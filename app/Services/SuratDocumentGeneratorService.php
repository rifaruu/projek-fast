<?php

namespace App\Services;

use App\Models\NomorSuratSequence;
use App\Models\Surat;
use App\Models\TemplateGlobalSetting;
use BaconQrCode\Renderer\Image\SvgImageBackEnd;
use BaconQrCode\Renderer\ImageRenderer;
use BaconQrCode\Renderer\RendererStyle\RendererStyle;
use BaconQrCode\Writer;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Schema;
use Mpdf\Mpdf;
// use Barryvdh\DomPDF\Facade\Pdf;
// use Throwable;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class SuratDocumentGeneratorService
{
    /**
     * @var array<string, bool>
     */
    protected static array $suratColumnAvailability = [];

    public function __construct(
        protected SuratTemplateRendererService $renderer,
    ) {
    }

    public function generate(Surat $surat): Surat
    {
        $surat = $this->prepareDraft($surat);

        if (blank($surat->qr_token)) {
            $surat->forceFill([
                'qr_token' => (string) Str::uuid(),
            ])->save();
        }

        $outputPath = $this->makeOutputPath($surat);
        $freshSurat = $surat->fresh(['jenisSurat']);
        $finalizedAt = now();
        $renderSurat = $freshSurat->forceFill([
            'status' => Surat::STATUS_FINISHED,
            'tanggal_selesai' => $finalizedAt,
            'generated_at' => $finalizedAt,
        ]);
        $rendered     = $this->renderer->renderForSurat($renderSurat, false, 'pdf');
        $qrCodeBase64 = $this->makeQrCodeBase64($renderSurat);

        $renderedHtml   = is_array($rendered) ? ($rendered['full']   ?? $rendered['html'] ?? '') : (string) $rendered;
        $renderedBody   = is_array($rendered) ? ($rendered['body']   ?? $renderedHtml) : $renderedHtml;
        $renderedHeader = is_array($rendered) ? ($rendered['header'] ?? '') : '';
        $renderedFooter = is_array($rendered) ? ($rendered['footer'] ?? '') : '';

        $viewPayload = [
            'title'        => 'Surat '.$freshSurat->jenisSurat?->nama,
            'html'         => $renderedHtml,
            'bodyHtml'     => $renderedBody,
            'headerHtml'   => $renderedHeader,
            'footerHtml'   => $renderedFooter,
            'styles'       => $this->renderer->documentStyles(),
            'qrCodeBase64' => $qrCodeBase64,
            'qrToken'      => $freshSurat->qr_token,
            'template'     => $freshSurat->jenisSurat?->template,
            'customCss'    => $freshSurat->jenisSurat?->template?->css_style ?? '',
        ];
        // $rendered = $this->renderer->renderForSurat($surat->fresh());
        // $outputPath = $this->makeOutputPath($surat);
        // $freshSurat = $surat->fresh(['jenisSurat']);
        // $qrCodeBase64 = $this->makeQrCodeBase64($freshSurat);
        // $viewPayload = [
        //     'title'        => 'Surat '.$freshSurat->jenisSurat?->nama,
        //     'html'         => $rendered['full'],
        //     'bodyHtml'     => $rendered['body'],
        //     'headerHtml'   => $rendered['header'],
        //     'footerHtml'   => $rendered['footer'],
        //     'styles'       => $this->renderer->documentStyles(),
        //     'qrCodeBase64' => $qrCodeBase64,
        //     'qrToken'      => $freshSurat->qr_token,
        //     'template'     => $freshSurat->jenisSurat?->template,
        //     'customCss'    => $freshSurat->jenisSurat?->template?->css_style ?? '',
        // ];
        Storage::disk('public')->makeDirectory(dirname($outputPath));

        Storage::disk('public')->put(
            $outputPath,
            $this->renderPdfOutput($viewPayload),
        );

        $updates = [
            'rendered_snapshot' => $rendered['html'],
            'generated_file_path' => $outputPath,
            'generated_at' => $finalizedAt,
            'generated_file_type' => 'pdf',
            'template_version' => $rendered['template']->version,
            'status' => Surat::STATUS_FINISHED,
            'tanggal_selesai' => $finalizedAt,
        ];

        if ($this->suratTableHasColumn('generated_by')) {
            $updates['generated_by'] = auth()->id();
        }

        $freshSurat->forceFill($updates)->save();

        return $freshSurat->fresh();
    }

    public function prepareDraft(Surat $surat): Surat
    {
        if (blank($surat->nomor_surat)) {
            $surat->forceFill([
                'nomor_surat' => $this->generateNomorSurat($surat),
            ])->save();
        }

        $rendered = $this->renderer->renderForSurat($surat->fresh());

        $surat->forceFill([
            'rendered_snapshot' => $rendered['html'],
            'template_version' => $rendered['template']->version,
        ])->save();

        return $surat->fresh([
            'jenisSurat.template.placeholders',
            'pemohon',
            'dataEntries',
        ]);
    }

    protected function generateNomorSurat(Surat $surat): string
    {
        $surat->loadMissing('jenisSurat');

        $year = now()->year;
        $prefix = strtoupper((string) TemplateGlobalSetting::get('kode_prefix_nomor_surat', 'B'));
        $facultyCode = (string) TemplateGlobalSetting::get('kode_fakultas_nomor_surat', 'Ybk.041.10');
        $classificationCode = $this->resolveClassificationCode($surat);

        $sequenceKey = sprintf('FAKULTAS-%s', $year);
        $urutan = NomorSuratSequence::nextUrutan($sequenceKey, $year, 0);

        return sprintf(
            '%s/%03d/%s/%s/%d',
            $prefix,
            $urutan,
            $facultyCode,
            $classificationCode,
            $year
        );
    }

    protected function resolveClassificationCode(Surat $surat): string
    {
        $classificationCode = trim((string) ($surat->jenisSurat?->kode_klasifikasi ?? ''));

        if ($classificationCode === '') {
            return 'SURAT';
        }

        return strtoupper($classificationCode);
    }

    protected function makeOutputPath(Surat $surat): string
    {
        $surat->loadMissing('jenisSurat');

        $slug = Str::slug((string) ($surat->jenisSurat?->slug ?: $surat->jenisSurat?->nama ?: 'surat'));

        return sprintf('fast/generated/surat-%d-%s.pdf', $surat->id, $slug);
    }

    protected function makeQrCodeBase64(Surat $surat): string
    {
        // Ganti payload QR menjadi URL endpoint verifikasi
        $baseUrl = config('app.url') ?? 'http://localhost';
        $url = rtrim($baseUrl, '/') . '/verifikasi-qr/' . $surat->qr_token;

        $writer = new Writer(
            new ImageRenderer(
                new RendererStyle(180),
                new SvgImageBackEnd(),
            ),
        );

        return 'data:image/svg+xml;base64,' . base64_encode($writer->writeString($url));
    }

    protected function renderPdfOutput(array $viewPayload): string
    {
        $styles     = (string) ($viewPayload['styles'] ?? '');
        $customCss  = (string) ($viewPayload['customCss'] ?? '');
        $bodyHtml   = (string) ($viewPayload['bodyHtml'] ?? '');
        $headerHtml = (string) ($viewPayload['headerHtml'] ?? '');
        $footerHtml = (string) ($viewPayload['footerHtml'] ?? '');
        $tempDir    = $this->resolveMpdfTempDir();

        File::ensureDirectoryExists($tempDir);

        // Margin (mm). margin_bottom harus cukup menampung tinggi footer
        // berjalan (kop instansi + alamat + email) agar isi surat di SEMUA
        // halaman tidak menabrak footer.
        $mpdf = new Mpdf([
            'mode'          => 'utf-8',
            'format'        => 'A4',
            'margin_top'    => 48,
            'margin_bottom' => 32,
            'margin_left'   => 15,
            'margin_right'  => 15,
            'margin_header' => 5,
            'margin_footer' => 6,
            'tempDir'       => $tempDir,
            'cacheCleanupInterval' => app()->runningUnitTests() ? false : 3600,
        ]);

        $mpdf->SetHTMLHeader('<div style="width:100%;">' . $headerHtml . '</div>');
        $mpdf->SetHTMLFooter('<div style="width:100%;">' . $footerHtml . '</div>');

        // Tulis style sekali, lalu body sekali (jangan duplikat).
        $mpdf->WriteHTML("<style>{$styles} {$customCss}</style>", \Mpdf\HTMLParserMode::HEADER_CSS);
        $mpdf->WriteHTML($bodyHtml, \Mpdf\HTMLParserMode::HTML_BODY);

        // Tambahkan QR fixed hanya jika template belum merender QR sendiri.
        if (
            filled($viewPayload['qrCodeBase64'] ?? null)
            && ! str_contains($bodyHtml, 'data-qr-embedded="true"')
        ) {
            $qrCodeBase64 = e((string) $viewPayload['qrCodeBase64']);
            $mpdf->WriteHTML(<<<HTML
            <div style="position: fixed; bottom: 2mm; right: 0; width: 22mm; text-align: center;">
                <p style="color: #64748B; font-size: 5.5pt; font-weight: bold; letter-spacing: 0.02em; line-height: 1.15; margin: 0 0 1.2mm 0; text-transform: uppercase;">
                    Validasi<br>Dokumen
                </p>
                <img src="{$qrCodeBase64}" style="display: block; height: 16mm; width: 16mm; margin: 0 auto;">
            </div>
            HTML);
        }

        return $mpdf->Output('', 'S');
    }

    protected function resolveMpdfTempDir(): string
    {
        $baseDir = storage_path('app/tmp/mpdf');

        if (! app()->runningUnitTests()) {
            return $baseDir;
        }

        return rtrim(sys_get_temp_dir(), DIRECTORY_SEPARATOR)
            .DIRECTORY_SEPARATOR.'projek-fast-mpdf-tests'
            .DIRECTORY_SEPARATOR.Str::uuid()->toString();
    }

    protected function buildStyles(array $viewPayload): string
    {
        $styles    = (string) ($viewPayload['styles'] ?? '');
        $customCss = (string) ($viewPayload['customCss'] ?? '');
        return "<style>{$styles} {$customCss}</style>";
    }

    protected function suratTableHasColumn(string $column): bool
    {
        if (! array_key_exists($column, self::$suratColumnAvailability)) {
            self::$suratColumnAvailability[$column] = Schema::hasColumn('surats', $column);
        }

        return self::$suratColumnAvailability[$column];
    }

    // /**
    //  * @param  array<string, mixed>  $viewPayload
    //  */
    // protected function renderPdfOutput(array $viewPayload): string
    // {
    //     try {
    //         return Pdf::loadView('documents.surat', $viewPayload)
    //             ->setPaper('a4', 'portrait')
    //             ->output();
    //     } catch (Throwable) {
    //         return Pdf::loadHTML($this->buildFallbackHtml($viewPayload))
    //             ->setPaper('a4', 'portrait')
    //             ->output();
    //     }
    // }

    // protected function renderPdfOutput(array $viewPayload): string
    // {
    //     return Pdf::loadHTML($this->buildFullHtml($viewPayload))
    //         ->setPaper('a4', 'portrait')
    //         ->output();
    // }

    // protected function buildFullHtml(array $viewPayload): string
    // {
    //     $title      = e((string) ($viewPayload['title'] ?? 'Surat'));
    //     $styles     = (string) ($viewPayload['styles'] ?? '');
    //     $customCss  = (string) ($viewPayload['customCss'] ?? '');
    //     $bodyHtml   = (string) ($viewPayload['bodyHtml'] ?? $viewPayload['html'] ?? '');
    //     $footerHtml = (string) ($viewPayload['footerHtml'] ?? '');
    //     $qrMarkup   = '';

    //     if (filled($viewPayload['qrCodeBase64'] ?? null)) {
    //         $qrCodeBase64 = e((string) $viewPayload['qrCodeBase64']);
    //         $qrMarkup = <<<HTML
    //         <div style="position: fixed; bottom: -22mm; right: 0; text-align: right; width: 18mm;">
    //             <p style="color: #475569; font-size: 6pt; letter-spacing: 0.04em; margin-bottom: 1px; text-transform: uppercase;">Validasi Dokumen</p>
    //             <img src="{$qrCodeBase64}" alt="QR Code Surat" style="height: 15mm; width: 15mm;">
    //         </div>
    //         HTML;
    //         }

    //     return <<<HTML
    //     <!DOCTYPE html>
    //     <html lang="id">
    //     <head>
    //         <meta charset="utf-8">
    //         <title>{$title}</title>
    //         <style>
    //             @page { margin: 48mm 15mm 28mm 15mm; size: A4 portrait; }
    //             body { font-family: "Cambria", "Times New Roman", serif; font-size: 12pt; margin: 0; padding: 0; }
    //             {$styles}
    //             {$customCss}
    //             #kop    { position: fixed; top: -48mm; left: 0; right: 0; }
    //             #footer { position: fixed; bottom: -28mm; left: 0; right: 0; }
    //         </style>
    //     </head>
    //     <body>
    //         <div id="kop">{$headerHtml}</div>
    //         <div id="footer">{$footerHtml}</div>
    //         <div class="page">{$bodyHtml}</div>
    //         {$qrMarkup}
    //     </body>
    //     </html>
    //     HTML;
    // }
//     /**
//      * @param  array<string, mixed>  $viewPayload
//      */
//     protected function buildFallbackHtml(array $viewPayload): string
//     {
//         $qrMarkup = '';

//         if (filled($viewPayload['qrCodeBase64'] ?? null)) {
//             $qrCodeBase64 = e((string) $viewPayload['qrCodeBase64']);

//             $qrMarkup = <<<HTML
// <div style="bottom: 0; position: fixed; right: 0; text-align: right; width: 18mm;">
//     <p style="color: #475569; font-size: 6pt; letter-spacing: 0.04em; margin-bottom: 1px; text-transform: uppercase;">Validasi Dokumen</p>
//     <img src="{$qrCodeBase64}" alt="QR Code Surat" style="height: 15mm; width: 15mm;">
// </div>
// HTML;
//         }

//         return $this->renderer->wrapDocumentHtml(
//             (string) ($viewPayload['title'] ?? 'Surat'),
//             (string) ($viewPayload['html'] ?? '').$qrMarkup,
//             $viewPayload['template'] ?? null,
//         );
//     }
}
