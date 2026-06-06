<script setup lang="ts">
import { Head } from '@inertiajs/vue3';
import { ref } from 'vue';

const token = ref('');

function submit(): void {
    const trimmedToken = token.value.trim();

    if (!trimmedToken) {
        return;
    }

    window.location.href = `/verifikasi-qr/${encodeURIComponent(trimmedToken)}`;
}
</script>

<template>
    <Head title="Verifikasi Dokumen" />

    <div class="flex min-h-screen items-center justify-center bg-gradient-to-br from-slate-50 via-white to-emerald-50 px-4 py-10">
        <div class="w-full max-w-md rounded-3xl border border-slate-200 bg-white p-6 shadow-xl shadow-slate-200/60">
            <div class="space-y-2 text-center">
                <p class="text-xs font-semibold uppercase tracking-[0.2em] text-emerald-600">Verifikasi QR</p>
                <h1 class="text-2xl font-bold text-slate-900">Cek keaslian dokumen</h1>
                <p class="text-sm text-slate-500">
                    Masukkan token dari QR code surat untuk melihat status validasinya.
                </p>
            </div>

            <form class="mt-6 space-y-4" @submit.prevent="submit">
                <label class="block space-y-2">
                    <span class="text-sm font-medium text-slate-700">Token QR</span>
                    <input
                        v-model="token"
                        type="text"
                        inputmode="text"
                        autocomplete="off"
                        placeholder="Contoh: 550e8400-e29b-41d4-a716-446655440000"
                        class="h-12 w-full rounded-2xl border border-slate-200 bg-slate-50 px-4 text-sm text-slate-900 outline-none transition focus:border-emerald-500 focus:bg-white"
                    >
                </label>

                <button
                    type="submit"
                    class="inline-flex h-12 w-full items-center justify-center rounded-2xl bg-emerald-600 px-4 text-sm font-semibold text-white transition hover:bg-emerald-700 disabled:cursor-not-allowed disabled:opacity-60"
                    :disabled="token.trim().length === 0"
                >
                    Verifikasi Dokumen
                </button>
            </form>
        </div>
    </div>
</template>
