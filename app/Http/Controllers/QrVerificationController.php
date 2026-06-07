<?php

namespace App\Http\Controllers;

use App\Models\Surat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Inertia\Inertia;
use Inertia\Response;

class QrVerificationController extends Controller
{
    /**
     * @var array<string, bool>
     */
    protected static array $suratColumnAvailability = [];

    // Tampilkan form input manual token QR
    public function showForm(): Response
    {
        return Inertia::render('qr/VerifyForm');
    }

    // Verifikasi QR berdasarkan token
    public function verify(Request $request, string $token): Response
    {
        $surat = Surat::where('qr_token', $token)
            ->with(['pemohon.programStudi', 'jenisSurat.category', 'approvedBy', 'approvalFlows.approver'])
            ->first();

        if (! $surat) {
            return Inertia::render('qr/VerifyResult', [
                'found' => false,
                'valid' => false,
                'revoked' => false,
                'message' => 'Dokumen tidak ditemukan atau tidak valid.',
                'surat' => null,
            ]);
        }

        $isValidated = $surat->status === 'finished';
        $isRevoked = $surat->qrCode?->status === 'revoked';

        // Catat pertama kali QR di-scan setelah divalidasi
        if ($isValidated && ! $isRevoked && $this->suratTableHasColumn('qr_validated_at') && ! $surat->qr_validated_at) {
            $surat->update(['qr_validated_at' => now()]);
        }

        return Inertia::render('qr/VerifyResult', [
            'found' => true,
            'valid' => $isValidated && ! $isRevoked,
            'revoked' => $isRevoked,
            'message' => $isRevoked
                ? 'Dokumen ini telah dicabut dan tidak berlaku.'
                : ($isValidated
                    ? 'Dokumen ini sah dan telah divalidasi.'
                    : 'Dokumen belum divalidasi.'),
            'surat' => [
                'nomor_surat' => $surat->nomor_surat,
                'jenis_surat' => $surat->jenisSurat?->nama,
                'kategori' => $surat->jenisSurat?->category?->nama,
                'nama_pemohon' => $surat->pemohon?->name,
                'nim' => $surat->pemohon?->nim_nip ?? $surat->pemohon?->nomor_induk,
                'program_studi' => $surat->pemohon?->programStudi?->nama,
                'keperluan' => $surat->keperluan,
                'tanggal_terbit' => $surat->generated_at?->toISOString(),
                'disahkan_oleh' => $surat->finalApprovalRoleSlug() === 'dekan'
                    ? 'Dekan'
                    : ($surat->finalApprovalRoleSlug() === 'kaprodi' ? 'Kaprodi' : 'Admin'),
                'nama_approver' => $surat->approvedBy?->name
                    ?? optional(
                        $surat->approvalFlows
                            ->where('status', 'approved')
                            ->sortByDesc(fn ($flow) => $flow->approved_at?->getTimestamp() ?? 0)
                            ->first()
                    )?->approver?->name,
                'tanggal_persetujuan_final' => $surat->approved_at?->toISOString()
                    ?? optional(
                        $surat->approvalFlows
                            ->where('status', 'approved')
                            ->sortByDesc(fn ($flow) => $flow->approved_at?->getTimestamp() ?? 0)
                            ->first()
                    )?->approved_at?->toISOString(),
                'status' => $isRevoked ? 'dicabut' : ($isValidated ? 'valid' : 'belum_divalidasi'),
            ],
        ]);
    }

    protected function suratTableHasColumn(string $column): bool
    {
        if (! array_key_exists($column, self::$suratColumnAvailability)) {
            self::$suratColumnAvailability[$column] = Schema::hasColumn('surats', $column);
        }

        return self::$suratColumnAvailability[$column];
    }
}
