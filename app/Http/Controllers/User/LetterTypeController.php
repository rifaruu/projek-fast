<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\JenisSurat;
use App\Support\SuratDataContract;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LetterTypeController extends Controller
{
    public function show(Request $request, JenisSurat $jenisSurat): JsonResponse
    {
        $user = $request->user();
        abort_if($user === null, 403);
        abort_if(! $jenisSurat->is_active || $jenisSurat->template === null, 404);

        return response()->json([
            'data' => [
                'id' => $jenisSurat->id,
                'nama' => $jenisSurat->nama,
                'deskripsi' => $jenisSurat->deskripsi,
                'field_config' => SuratDataContract::filterDynamicFieldConfig($jenisSurat->field_config ?? []),
            ],
        ]);
    }

}
