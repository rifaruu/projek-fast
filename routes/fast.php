<?php

use App\Http\Controllers\Admin\ApprovalController as ApprovalDashboardController;
use App\Http\Controllers\Admin\ArchiveController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\GlobalSettingsController;
use App\Http\Controllers\Admin\HistoryController;
use App\Http\Controllers\Admin\LetterController;
use App\Http\Controllers\Admin\LetterIndexController;
use App\Http\Controllers\Admin\QrManageController;
use App\Http\Controllers\Admin\TemplateController;
use App\Http\Controllers\Api\SuratController as ApiSuratController;
use App\Http\Controllers\User\DashboardController as UserDashboardController;
use App\Http\Controllers\User\HistoryController as UserHistoryController;
use App\Http\Controllers\User\LetterTypeController;
use App\Http\Controllers\User\SubmissionController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Dokumen surat
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified'])
    ->prefix('documents')
    ->name('documents.')
    ->group(function (): void {
        Route::get('/surat/{id}/template-preview', [DashboardController::class, 'previewTemplate'])
            ->whereNumber('id')
            ->name('surat.template-preview');
        Route::get('/surat/{id}/generated-document', [DashboardController::class, 'previewGeneratedDocument'])
            ->whereNumber('id')
            ->name('surat.generated-document');
        Route::get('/surat/{id}/generate', [LetterController::class, 'generate'])
            ->whereNumber('id')
            ->name('surat.generate');
        Route::get('/surat/{id}/pdf', [DashboardController::class, 'downloadPdf'])
            ->whereNumber('id')
            ->name('surat.pdf');
        Route::get('/lampiran/{id}/preview', [DashboardController::class, 'previewAttachment'])
            ->whereNumber('id')
            ->name('lampiran.preview');
    });

/*
|--------------------------------------------------------------------------
| Alias kompatibilitas lama untuk dokumen admin
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified'])
    ->prefix('admin')
    ->name('admin.')
    ->group(function (): void {
        Route::get('/surat/{id}/template-preview', [DashboardController::class, 'previewTemplate'])
            ->whereNumber('id')
            ->name('surat.template-preview');
        Route::get('/surat/{id}/generated-document', [DashboardController::class, 'previewGeneratedDocument'])
            ->whereNumber('id')
            ->name('surat.generated-document');
        Route::get('/surat/{id}/generate', [LetterController::class, 'generate'])
            ->whereNumber('id')
            ->name('surat.generate');
        Route::get('/surat/{id}/pdf', [DashboardController::class, 'downloadPdf'])
            ->whereNumber('id')
            ->name('surat.pdf');
        Route::get('/lampiran/{id}/preview', [DashboardController::class, 'previewAttachment'])
            ->whereNumber('id')
            ->name('lampiran.preview');
    });

/*
|--------------------------------------------------------------------------
| Mahasiswa dan dosen
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified', 'fast.user'])->group(function (): void {
    Route::prefix('fast/user')
        ->name('fast.user.')
        ->group(function (): void {
            Route::redirect('/', '/fast/user/dashboard')->name('index');
            Route::get('/dashboard', [UserDashboardController::class, 'index'])
                ->name('dashboard');
            Route::get('/ajukan', [SubmissionController::class, 'create'])
                ->name('ajukan');
            Route::post('/submissions', [SubmissionController::class, 'store'])
                ->name('submissions.store');
            Route::get('/history', [UserHistoryController::class, 'index'])
                ->name('history');
            Route::post('/surat/{id}/cancel', [UserHistoryController::class, 'cancel'])
                ->whereNumber('id')
                ->name('surat.cancel');
        });

    Route::get('/jenis-surat/{jenisSurat}', [LetterTypeController::class, 'show'])
        ->name('jenis-surat.show');
});

/*
|--------------------------------------------------------------------------
| Admin only
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified', 'admin.access'])
    ->prefix('admin')
    ->name('admin.')
    ->group(function (): void {
        Route::get('/dashboard', [DashboardController::class, 'index'])
            ->name('dashboard');
        Route::get('/archive', [ArchiveController::class, 'index'])
            ->name('archive.index');
        Route::get('/surat/{id}', [DashboardController::class, 'show'])
            ->whereNumber('id')
            ->name('surat.show');

        Route::get('/surat/create', [LetterController::class, 'create'])
            ->name('surat.create');
        Route::post('/surat/select-type', [LetterController::class, 'selectType'])
            ->name('surat.select-type');
        Route::get('/surat/form/{jenisSurat}', [LetterController::class, 'form'])
            ->name('surat.form');
        Route::get('/surat/preview', [LetterController::class, 'previewPage'])
            ->name('surat.preview-page');
        Route::post('/surat/preview', [LetterController::class, 'preview'])
            ->name('surat.preview');
        Route::post('/surat/store', [LetterController::class, 'store'])
            ->name('surat.store');

        Route::get('/surat', [LetterIndexController::class, 'index'])
            ->name('surat.index');
        Route::get('/surat/{id}/edit', [LetterController::class, 'edit'])
            ->whereNumber('id')
            ->name('surat.edit');
        Route::patch('/surat/{id}', [LetterController::class, 'update'])
            ->whereNumber('id')
            ->name('surat.update');
        Route::post('/surat/{id}/approve', [DashboardController::class, 'approve'])
            ->whereNumber('id')
            ->name('surat.approve');
        Route::post('/surat/{id}/reject', [DashboardController::class, 'reject'])
            ->whereNumber('id')
            ->name('surat.reject');

        Route::get('/history', [HistoryController::class, 'index'])
            ->name('history');

        Route::get('/templates', [TemplateController::class, 'index'])
            ->name('templates.index');
        Route::post('/templates', [TemplateController::class, 'store'])
            ->name('templates.store');
        Route::get('/templates/{jenisSurat}/preview', [TemplateController::class, 'preview'])
            ->name('templates.preview');
        Route::post('/templates/{jenisSurat}/duplicate', [TemplateController::class, 'duplicate'])
            ->name('templates.duplicate');
        Route::patch('/templates/{jenisSurat}/toggle-active', [TemplateController::class, 'toggleActive'])
            ->name('templates.toggle-active');
        Route::put('/templates/{jenisSurat}', [TemplateController::class, 'update'])
            ->name('templates.update');
        Route::delete('/templates/{jenisSurat}', [TemplateController::class, 'destroy'])
            ->name('templates.destroy');

        Route::get('/categories', [CategoryController::class, 'index'])
            ->name('categories.index');
        Route::post('/categories', [CategoryController::class, 'store'])
            ->name('categories.store');
        Route::put('/categories/{category}', [CategoryController::class, 'update'])
            ->name('categories.update');
        Route::delete('/categories/{category}', [CategoryController::class, 'destroy'])
            ->name('categories.destroy');

        Route::get('/qr', [QrManageController::class, 'index'])
            ->name('qr.index');
        Route::post('/qr/{id}/revoke', [QrManageController::class, 'revoke'])
            ->whereNumber('id')
            ->name('qr.revoke');

        Route::post('/settings/template', [GlobalSettingsController::class, 'save'])
            ->name('settings.template');
    });

/*
|--------------------------------------------------------------------------
| Approval
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified', 'approval.access'])
    ->prefix('approval')
    ->name('approval.')
    ->group(function (): void {
        Route::get('/dashboard', [ApprovalDashboardController::class, 'index'])
            ->name('dashboard');
        Route::get('/surat/{id}', [ApprovalDashboardController::class, 'show'])
            ->whereNumber('id')
            ->name('surat.show');
        Route::get('/lampiran/{id}/preview', [ApprovalDashboardController::class, 'previewAttachment'])
            ->whereNumber('id')
            ->name('lampiran.preview');
        Route::post('/surat/{id}/approve', [ApprovalDashboardController::class, 'approve'])
            ->whereNumber('id')
            ->name('surat.approve');
        Route::post('/surat/{id}/reject', [ApprovalDashboardController::class, 'reject'])
            ->whereNumber('id')
            ->name('surat.reject');
        Route::post('/surat/{id}/final-reject', [ApprovalDashboardController::class, 'finalReject'])
            ->whereNumber('id')
            ->name('surat.final-reject');
        Route::post('/surat/{id}/note', [ApprovalDashboardController::class, 'saveNote'])
            ->whereNumber('id')
            ->name('surat.note');
    });

/*
|--------------------------------------------------------------------------
| API Fast
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified'])
    ->prefix('api/fast')
    ->name('api.fast.')
    ->group(function (): void {
        Route::get('/surat', [ApiSuratController::class, 'index'])
            ->name('surat.index');
        Route::post('/surat', [ApiSuratController::class, 'store'])
            ->name('surat.store');
        Route::get('/surat/{surat}', [ApiSuratController::class, 'show'])
            ->name('surat.show');
        Route::post('/surat/{surat}/admin-validation', [ApiSuratController::class, 'adminValidate'])
            ->middleware('admin.access')
            ->name('surat.admin-validation');
        Route::post('/surat/{surat}/approval', [ApiSuratController::class, 'approve'])
            ->middleware('approval.access')
            ->name('surat.approval');
        Route::post('/surat/{surat}/generate-document', [ApiSuratController::class, 'generateDocument'])
            ->middleware('admin.access')
            ->name('surat.generate-document');
    });
