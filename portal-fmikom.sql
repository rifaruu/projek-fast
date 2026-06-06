-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 06 Jun 2026 pada 08.58
-- Versi server: 8.4.3
-- Versi PHP: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `portal-fmikom`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi_magangs`
--

CREATE TABLE `absensi_magangs` (
  `id` bigint UNSIGNED NOT NULL,
  `pendaftaran_id` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_masuk` time DEFAULT NULL,
  `waktu_keluar` time DEFAULT NULL,
  `latitude_masuk` decimal(10,8) DEFAULT NULL,
  `longitude_masuk` decimal(11,8) DEFAULT NULL,
  `latitude_keluar` decimal(10,8) DEFAULT NULL,
  `longitude_keluar` decimal(11,8) DEFAULT NULL,
  `lokasi_valid` tinyint(1) NOT NULL DEFAULT '0',
  `foto_bukti_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-83fe1a0bcd98af4fde10f1ead3a98eb1', 'i:1;', 1780735757),
('laravel-cache-83fe1a0bcd98af4fde10f1ead3a98eb1:timer', 'i:1780735757;', 1780735757),
('laravel-cache-eae20c26987514ec04b47ca6b05a8029', 'i:1;', 1780735801),
('laravel-cache-eae20c26987514ec04b47ca6b05a8029:timer', 'i:1780735801;', 1780735801),
('laravel-cache-f06274183fa3d0c5751d4260f152c15d', 'i:1;', 1780735824),
('laravel-cache-f06274183fa3d0c5751d4260f152c15d:timer', 'i:1780735824;', 1780735824),
('laravel-cache-notif_count_pending_admin', 'i:3;', 1780736289);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_respons`
--

CREATE TABLE `detail_respons` (
  `id` bigint UNSIGNED NOT NULL,
  `respons_id` bigint UNSIGNED NOT NULL,
  `pertanyaan_id` bigint UNSIGNED NOT NULL,
  `pilihan_id` bigint UNSIGNED DEFAULT NULL,
  `jawaban_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakultas`
--

CREATE TABLE `fakultas` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_surats`
--

CREATE TABLE `jenis_surats` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `field_config` json DEFAULT NULL,
  `template_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_surat` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `allowed_role_id` bigint UNSIGNED DEFAULT NULL,
  `approval_role_id` bigint UNSIGNED DEFAULT NULL,
  `perlu_approval` tinyint(1) NOT NULL DEFAULT '1',
  `qr_mode` enum('immediate','after_approval') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'after_approval' COMMENT 'immediate=QR langsung aktif, after_approval=setelah disetujui',
  `allowed_roles` json DEFAULT NULL COMMENT 'Array slug role yang boleh buat surat ini, null=semua',
  `urutan` smallint UNSIGNED NOT NULL DEFAULT '0',
  `alur_pengajuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'submission',
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenis_surats`
--

INSERT INTO `jenis_surats` (`id`, `category_id`, `nama`, `slug`, `kode_surat`, `deskripsi`, `field_config`, `template_file_path`, `template_surat`, `created_at`, `updated_at`, `allowed_role_id`, `approval_role_id`, `perlu_approval`, `qr_mode`, `allowed_roles`, `urutan`, `alur_pengajuan`, `is_active`) VALUES
(15, 2, 'Surat Keterangan Lulus', 'surat-keterangan-lulus-1780724110', 'ybk.10.00/pk', NULL, '[{\"help\": \"\", \"name\": \"nama\", \"type\": \"text\", \"label\": \"Nama\", \"options\": [], \"required\": true, \"placeholder\": \"\"}, {\"help\": \"\", \"name\": \"nik\", \"type\": \"text\", \"label\": \"NIK\", \"options\": [], \"required\": true, \"placeholder\": \"\"}, {\"help\": \"\", \"name\": \"jabatan\", \"type\": \"text\", \"label\": \"Jabatan\", \"options\": [], \"required\": true, \"placeholder\": \"\"}, {\"help\": \"\", \"name\": \"nama\", \"type\": \"text\", \"label\": \"Nama\", \"options\": [], \"required\": true, \"placeholder\": \"\"}, {\"help\": \"\", \"name\": \"nim\", \"type\": \"text\", \"label\": \"NIM\", \"options\": [], \"required\": true, \"placeholder\": \"\"}, {\"help\": \"\", \"name\": \"tempat_tanggal_lahir\", \"type\": \"text\", \"label\": \"Tempat Tanggal Lahir\", \"options\": [], \"required\": true, \"placeholder\": \"\"}]', NULL, NULL, '2026-06-05 22:35:10', '2026-06-05 22:42:58', 3, 7, 1, 'after_approval', NULL, 0, 'submission', 1),
(16, 2, 'Surat Keterangan Dosen', 'surat-keterangan-dosen-1780724611', 'PK.10/TM', NULL, '[{\"help\": \"\", \"name\": \"nama\", \"type\": \"text\", \"label\": \"nama\", \"options\": [], \"required\": true, \"placeholder\": \"\"}, {\"help\": \"\", \"name\": \"nik\", \"type\": \"text\", \"label\": \"Nik\", \"options\": [], \"required\": true, \"placeholder\": \"\"}, {\"help\": \"\", \"name\": \"lahir\", \"type\": \"text\", \"label\": \"lahir\", \"options\": [], \"required\": true, \"placeholder\": \"\"}, {\"help\": \"\", \"name\": \"nama\", \"type\": \"text\", \"label\": \"Nama\", \"options\": [], \"required\": true, \"placeholder\": \"\"}, {\"help\": \"\", \"name\": \"nim\", \"type\": \"text\", \"label\": \"NIM\", \"options\": [], \"required\": true, \"placeholder\": \"\"}]', NULL, NULL, '2026-06-05 22:43:31', '2026-06-05 22:47:35', 4, 7, 0, 'after_approval', NULL, 0, 'submission', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_surat_roles`
--

CREATE TABLE `jenis_surat_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `jenis_surat_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karir_alumnis`
--

CREATE TABLE `karir_alumnis` (
  `id` bigint UNSIGNED NOT NULL,
  `alumni_id` bigint UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidang_industri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `negara` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Indonesia',
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `gaji_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_kerja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kuesioners`
--

CREATE TABLE `kuesioners` (
  `id` bigint UNSIGNED NOT NULL,
  `pembuat_id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `periode_mulai` date NOT NULL,
  `periode_selesai` date NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `tujuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `logbook_magangs`
--

CREATE TABLE `logbook_magangs` (
  `id` bigint UNSIGNED NOT NULL,
  `pendaftaran_id` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `aktivitas_harian` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kompetensi_dicapai` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `catatan_dosen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lowongan_infos`
--

CREATE TABLE `lowongan_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `pembuat_id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_perusahaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `poster_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_eksternal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_14_170933_add_two_factor_columns_to_users_table', 1),
(5, '2026_03_29_180950_create_roles_table', 1),
(6, '2026_03_29_180951_create_fakultas_table', 1),
(7, '2026_03_29_180954_create_program_studis_table', 1),
(8, '2026_03_29_180955_create_perusahaan_mitras_table', 1),
(9, '2026_03_29_180956_create_pembimbing_lapangans_table', 1),
(10, '2026_03_29_180958_create_jenis_surats_table', 1),
(11, '2026_03_29_181000_create_surats_table', 1),
(12, '2026_03_29_181003_create_surat_approval_flows_table', 1),
(13, '2026_03_29_181004_create_surat_lampirans_table', 1),
(14, '2026_03_29_181005_create_pendaftaran_magangs_table', 1),
(15, '2026_03_29_181007_create_absensi_magangs_table', 1),
(16, '2026_03_29_181007_create_logbook_magangs_table', 1),
(17, '2026_03_29_181008_create_penilaian_magangs_table', 1),
(18, '2026_03_29_181009_create_profil_alumnis_table', 1),
(19, '2026_03_29_181010_create_karir_alumnis_table', 1),
(20, '2026_03_29_181011_create_kuesioners_table', 1),
(21, '2026_03_29_181012_create_pertanyaan_kuesioners_table', 1),
(22, '2026_03_29_181013_create_pilihan_jawabans_table', 1),
(23, '2026_03_29_181013_create_respons_kuesioners_table', 1),
(24, '2026_03_29_181014_create_detail_respons_table', 1),
(25, '2026_03_29_181015_create_lowongan_infos_table', 1),
(26, '2026_03_29_181016_add_columns_to_users_table', 1),
(27, '2026_03_29_201237_add_otp_and_password_changed_to_users_table', 2),
(28, '2026_03_29_214305_add_registration_fields_to_users_table', 3),
(29, '2026_04_10_084236_add_fields_to_jenis_surats_table', 4),
(30, '2026_04_10_084935_add_qr_token_to_surats_table', 4),
(31, '2026_04_14_110300_add_tanggal_kebutuhan_to_surats_table', 5),
(32, '2026_04_15_052519_create_jenis_surat_roles_table', 6),
(33, '2026_04_15_054253_create_surat_data_table', 7),
(34, '2026_04_15_055204_add_perlu_approval_to_jenis_surats_table', 8),
(35, '2026_04_18_120000_add_field_config_to_jenis_surats_table', 9),
(36, '2026_04_20_060000_add_workflow_columns_to_surat_approval_flows_table', 10),
(37, '2026_04_27_130000_create_surat_categories_table', 11),
(38, '2026_04_27_130100_add_category_fields_to_jenis_surats_table', 11),
(39, '2026_04_27_140000_create_surat_templates_table', 12),
(40, '2026_04_27_140100_create_surat_template_placeholders_table', 12),
(41, '2026_04_27_140200_add_generated_document_fields_to_surats_table', 12),
(42, '2026_04_28_110000_add_api_workflow_fields_to_surats_and_jenis_surats_table', 13),
(43, '2026_05_03_000001_enhance_surat_system', 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nomor_surat_sequences`
--

CREATE TABLE `nomor_surat_sequences` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_surat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode jenis surat, e.g. CUTI-MHS',
  `tahun` smallint UNSIGNED NOT NULL,
  `bulan` smallint UNSIGNED NOT NULL,
  `urutan` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('muchlisinmaruf@gmail.com', '$2y$12$HV9sEnOHXdFBzBUffbISwuXVa2VHXeovZmgdJs1wFWRtymE.sKsJS', '2026-03-29 15:11:55'),
('tiffanyhellen27@gmail.com', '$2y$12$BydpmQHppo7K8kWVv1wlYeQXW/2LpHVWT1YapiSdfa5SaYmNXnXYa', '2026-04-08 08:22:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembimbing_lapangans`
--

CREATE TABLE `pembimbing_lapangans` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `perusahaan_id` bigint UNSIGNED NOT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran_magangs`
--

CREATE TABLE `pendaftaran_magangs` (
  `id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `perusahaan_id` bigint UNSIGNED NOT NULL,
  `dosen_pembimbing_id` bigint UNSIGNED DEFAULT NULL,
  `pembimbing_lapangan_id` bigint UNSIGNED DEFAULT NULL,
  `surat_tugas_id` bigint UNSIGNED DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian_magangs`
--

CREATE TABLE `penilaian_magangs` (
  `id` bigint UNSIGNED NOT NULL,
  `pendaftaran_id` bigint UNSIGNED NOT NULL,
  `dosen_id` bigint UNSIGNED DEFAULT NULL,
  `pembimbing_lapangan_id` bigint UNSIGNED DEFAULT NULL,
  `nilai_logbook` decimal(5,2) DEFAULT NULL,
  `nilai_presentasi` decimal(5,2) DEFAULT NULL,
  `nilai_dari_pembimbing` decimal(5,2) DEFAULT NULL,
  `nilai_akhir` decimal(5,2) DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal_nilai` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pertanyaan_kuesioners`
--

CREATE TABLE `pertanyaan_kuesioners` (
  `id` bigint UNSIGNED NOT NULL,
  `kuesioner_id` bigint UNSIGNED NOT NULL,
  `teks_pertanyaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urutan` int NOT NULL DEFAULT '0',
  `wajib_diisi` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `perusahaan_mitras`
--

CREATE TABLE `perusahaan_mitras` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `radius_valid_meter` decimal(10,2) DEFAULT NULL,
  `bidang_industri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kontak_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pilihan_jawabans`
--

CREATE TABLE `pilihan_jawabans` (
  `id` bigint UNSIGNED NOT NULL,
  `pertanyaan_id` bigint UNSIGNED NOT NULL,
  `teks_pilihan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_alumnis`
--

CREATE TABLE `profil_alumnis` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `program_studi_id` bigint UNSIGNED NOT NULL,
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_lulus` int NOT NULL,
  `no_telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `program_studis`
--

CREATE TABLE `program_studis` (
  `id` bigint UNSIGNED NOT NULL,
  `fakultas_id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `respons_kuesioners`
--

CREATE TABLE `respons_kuesioners` (
  `id` bigint UNSIGNED NOT NULL,
  `kuesioner_id` bigint UNSIGNED NOT NULL,
  `alumni_id` bigint UNSIGNED NOT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT '0',
  `tanggal_isi` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `nama`, `slug`, `deskripsi`, `created_at`, `updated_at`) VALUES
(3, 'Mahasiswa', 'mahasiswa', 'Pengguna mahasiswa untuk layanan akademik FAST.', '2026-04-18 04:24:26', '2026-04-18 04:24:26'),
(4, 'Dosen', 'dosen', 'Pengguna dosen untuk layanan akademik FAST.', '2026-04-18 04:24:26', '2026-04-18 04:24:26'),
(5, 'Admin', 'admin', 'Pengelola validasi administrasi surat FAST.', '2026-04-18 04:24:26', '2026-04-18 04:24:26'),
(6, 'Kaprodi', 'kaprodi', 'Pemberi persetujuan surat tingkat program studi.', '2026-04-22 17:06:37', '2026-04-22 17:06:37'),
(7, 'Dekan', 'dekan', 'Pemberi persetujuan surat tingkat fakultas.', '2026-04-22 17:06:37', '2026-04-22 17:06:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('otZ68116UEwamMF0Pc3XslmbbfTsZZxlQViKpBf6', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNUxRczBWMU5QWFhtZEp0OXoxQnFxeE1qVm5RTUJtVndPeEVINlpNcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi90ZW1wbGF0ZXMvMTIvcHJldmlldyI7czo1OiJyb3V0ZSI7czoyMzoiYWRtaW4udGVtcGxhdGVzLnByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1O3M6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zZXR0aW5ncy9zZWN1cml0eSI7fX0=', 1777883984);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surats`
--

CREATE TABLE `surats` (
  `id` bigint UNSIGNED NOT NULL,
  `jenis_surat_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pengajuan',
  `pemohon_id` bigint UNSIGNED NOT NULL,
  `nomor_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keperluan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kepada_yth` json DEFAULT NULL COMMENT 'Array penerima surat, bisa multiple',
  `lampiran_keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Contoh: 1 (satu) lembar',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `isi_surat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rejection_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `validated_by_admin_id` bigint UNSIGNED DEFAULT NULL,
  `validated_by_admin_at` datetime DEFAULT NULL,
  `approved_by_id` bigint UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `generated_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generated_file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL,
  `template_version` int UNSIGNED DEFAULT NULL,
  `revisi_ke` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `catatan_revisi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `print_count` smallint UNSIGNED NOT NULL DEFAULT '0',
  `last_printed_at` timestamp NULL DEFAULT NULL,
  `rendered_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal_pengajuan` datetime DEFAULT NULL,
  `tanggal_kebutuhan` date DEFAULT NULL,
  `tanggal_selesai` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `qr_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `surats`
--

INSERT INTO `surats` (`id`, `jenis_surat_id`, `type`, `pemohon_id`, `nomor_surat`, `keperluan`, `kepada_yth`, `lampiran_keterangan`, `status`, `isi_surat`, `admin_note`, `rejection_reason`, `validated_by_admin_id`, `validated_by_admin_at`, `approved_by_id`, `approved_at`, `generated_file_path`, `generated_file_type`, `generated_at`, `template_version`, `revisi_ke`, `catatan_revisi`, `print_count`, `last_printed_at`, `rendered_snapshot`, `tanggal_pengajuan`, `tanggal_kebutuhan`, `tanggal_selesai`, `created_at`, `updated_at`, `qr_token`) VALUES
(98, 15, 'pengajuan', 8, NULL, 'untuk persyaratan lulus', NULL, NULL, 'rejected', '{\"jenis_surat_id\":15,\"jenis_surat\":\"Surat Keterangan Lulus\",\"keperluan\":\"untuk persyaratan lulus\",\"tanggal_kebutuhan\":\"2026-06-06\",\"data\":{\"nama\":\"Hellen Tiffani\",\"nik\":\"232242\",\"jabatan\":\"Guru\",\"nim\":\"22344\",\"tempat_tanggal_lahir\":\"27 Maret 2025\"}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2026-06-06 05:48:41', '2026-06-06', NULL, '2026-06-05 22:48:41', '2026-06-05 22:51:29', NULL),
(99, 16, 'pengajuan', 9, NULL, 'untuk keperluan pengunduran', NULL, NULL, 'rejected', '{\"jenis_surat_id\":16,\"jenis_surat\":\"Surat Keterangan Dosen\",\"keperluan\":\"untuk keperluan pengunduran\",\"tanggal_kebutuhan\":\"2026-06-06\",\"data\":{\"nama\":\"hellen\",\"nik\":\"13131\",\"lahir\":\"24 maret 2026\",\"nim\":\"324253\"}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2026-06-06 05:50:06', '2026-06-06', NULL, '2026-06-05 22:50:06', '2026-06-05 22:51:22', NULL),
(100, 16, 'pengajuan', 9, NULL, 'qkjhahdahikdlqa', NULL, NULL, 'pending', '{\"jenis_surat_id\":16,\"jenis_surat\":\"Surat Keterangan Dosen\",\"keperluan\":\"qkjhahdahikdlqa\",\"tanggal_kebutuhan\":\"2026-06-06\",\"data\":{\"nama\":\"qjehdqhdqi\",\"nik\":\"123131\",\"lahir\":\"26382\",\"nim\":\"212314\"}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2026-06-06 05:53:57', '2026-06-06', NULL, '2026-06-05 22:53:57', '2026-06-05 22:53:57', NULL),
(101, 15, 'pengajuan', 8, NULL, 'kdkalkjcalkmdlca', NULL, NULL, 'pending', '{\"jenis_surat_id\":15,\"jenis_surat\":\"Surat Keterangan Lulus\",\"keperluan\":\"kdkalkjcalkmdlca\",\"tanggal_kebutuhan\":\"2026-06-06\",\"data\":{\"nama\":\"adada\",\"nik\":\"213131\",\"jabatan\":\"jshsjjqqjq\",\"nim\":\"122132\",\"tempat_tanggal_lahir\":\"27 maret 2025\"}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2026-06-06 05:55:27', '2026-06-06', NULL, '2026-06-05 22:55:27', '2026-06-05 22:55:27', NULL),
(102, 16, 'surat_keluar', 5, NULL, 'untuk pengundurann diri', NULL, NULL, 'pending', '{\"jenis_surat_id\":16,\"jenis_surat\":\"Surat Keterangan Dosen\",\"keperluan\":\"untuk pengundurann diri\",\"data\":{\"nama\":\"hellen\",\"nik\":\"22222\",\"lahir\":\"26 maret 2022\",\"nim\":\"66758768\"},\"created_by\":{\"id\":5,\"name\":\"Admin\"}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2026-06-06 07:25:13', NULL, NULL, '2026-06-06 00:25:13', '2026-06-06 00:25:13', NULL),
(103, 16, 'surat_keluar', 5, 'B/0103/PK.10/TM/FMIKOM/2026', 'untuk pengundurann diri', NULL, NULL, 'finished', '{\"jenis_surat_id\":16,\"jenis_surat\":\"Surat Keterangan Dosen\",\"keperluan\":\"untuk pengundurann diri\",\"data\":{\"nama\":\"hellen\",\"nik\":\"22222\",\"lahir\":\"26 maret 2022\",\"nim\":\"66758768\"},\"created_by\":{\"id\":5,\"name\":\"Admin\"}}', NULL, NULL, 5, '2026-06-06 07:31:05', NULL, NULL, 'fast/generated/surat-103-surat-keterangan-dosen-1780724611.pdf', 'pdf', '2026-06-06 07:31:05', 1, 0, NULL, 0, NULL, '<section style=\"margin-bottom: 8px; text-align: center;\">\n    <img src=\"data:image/png;base64,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\" alt=\"Logo\" style=\"display:block; height:70px; margin:0 auto 4px;\">\n    <div style=\"color: #1B5E20; font-family: \'Times New Roman\', serif; font-weight: 700; line-height: 1.1; text-align: center;\">\n        <div style=\"font-size: 16pt; letter-spacing: 0.08em;\">UNIVERSITAS NAHDLATUL ULAMA AL GHAZALI CILACAP</div>\n        <div style=\"font-size: 13pt; text-transform: uppercase;\">FAKULTAS MATEMATIKA DAN ILMU KOMPUTER</div><div style=\"font-size: 13pt;\">(FMIKOM)</div>\n    </div>\n    <p style=\"color: #1B5E20; font-size: 9.5pt; line-height: 1.2; margin: 3px 0 5px; text-align: center;\">Keputusan Kemendikbud RI Nomor : 264/E/O/2014 Tanggal 23 Juli 2014</p>\n    <div style=\"margin: 0 auto; width: 100%;\">\n        <div style=\"border-top: 2px solid #1B5E20; margin-bottom: 1.5px;\"></div>\n        <div style=\"border-top: 0.8px solid #1B5E20;\"></div>\n    </div>\n</section>\n<div class=\"surat-content\"><h2 style=\"margin: 0 0 2px 0; text-align: center; font-size: 12pt; font-weight: bold;  text-transform: uppercase;\">Surat keterangan lulus</h2>\n<p style=\"margin: 0 0 8px 0; text-align: justify; font-size: 11pt; line-height: 1.5;   \">Yang bertanda tangan dibawah ini:</p>\n<table style=\"width: 100%; border-collapse: collapse; margin-bottom: 8px; font-size: 11pt;\">\n<tbody>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">Nama</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{nama_pemohon}}</td>\n            </tr>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">NIk</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{nim}}</td>\n            </tr>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">Lahir</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{lahir}}</td>\n            </tr>\n</tbody>\n</table>\n<p style=\"margin: 0 0 8px 0; text-align: justify; font-size: 11pt; line-height: 1.5;   \">Menerangkan Dosen tersebut di bawah ini</p>\n<table style=\"width: 100%; border-collapse: collapse; margin-bottom: 8px; font-size: 11pt;\">\n<tbody>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">Nama</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{nama_pemohon}}</td>\n            </tr>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">NIM</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{nim}}</td>\n            </tr>\n</tbody>\n</table>\n<p style=\"margin: 0 0 8px 0; text-align: justify; font-size: 11pt; line-height: 1.5;   \">Benar dosen unugha</p>\n<table style=\"width: 100%; border-collapse: collapse; margin-top: 16px; font-size: 11pt;\">\n    <tbody>\n        <tr>\n            <td style=\"vertical-align: top; text-align: right; padding: 0 8px 0 0; font-size: 11pt;\">\n    <p style=\"margin: 0 0 3px 0;\">Ketua,</p>\n    <div style=\"height: 50px;\"></div>\n    <p style=\"margin: 0; font-weight: bold;\">Hellen</p>\n    <p style=\"margin: 0;\">7357</p>\n</td>\n            <td style=\"width: 130px; vertical-align: top; text-align: center; padding: 0 0 0 8px;\">\n                <div style=\"display: inline-block; text-align: center;\">\n    <div style=\"width: 113px; height: 113px;\">\n        <?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"113\" height=\"113\" viewBox=\"0 0 113 113\"><rect x=\"0\" y=\"0\" width=\"113\" height=\"113\" fill=\"#ffffff\"/><g transform=\"scale(2.756)\"><g transform=\"translate(4,4)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 4L15 4L15 3L16 3L16 4L17 4L17 5L14 5L14 8L13 8L13 6L12 6L12 9L17 9L17 10L18 10L18 12L17 12L17 11L16 11L16 10L15 10L15 11L14 11L14 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L8 9L8 11L7 11L7 10L6 10L6 11L7 11L7 12L5 12L5 11L4 11L4 10L5 10L5 8L0 8L0 9L2 9L2 10L1 10L1 11L4 11L4 12L3 12L3 13L8 13L8 14L3 14L3 15L1 15L1 16L0 16L0 17L2 17L2 16L4 16L4 18L5 18L5 16L4 16L4 15L7 15L7 16L6 16L6 17L7 17L7 16L8 16L8 17L10 17L10 16L9 16L9 15L11 15L11 13L12 13L12 16L13 16L13 17L11 17L11 18L13 18L13 17L15 17L15 16L16 16L16 17L19 17L19 18L20 18L20 19L18 19L18 18L15 18L15 19L14 19L14 20L13 20L13 19L11 19L11 20L12 20L12 21L10 21L10 22L12 22L12 21L14 21L14 24L13 24L13 23L12 23L12 24L9 24L9 23L8 23L8 22L6 22L6 21L8 21L8 19L10 19L10 18L8 18L8 19L7 19L7 18L6 18L6 19L5 19L5 20L6 20L6 21L4 21L4 22L2 22L2 21L1 21L1 20L0 20L0 25L1 25L1 22L2 22L2 24L3 24L3 25L4 25L4 24L5 24L5 25L8 25L8 27L9 27L9 25L11 25L11 26L13 26L13 27L12 27L12 29L11 29L11 28L10 28L10 29L11 29L11 30L12 30L12 31L14 31L14 30L15 30L15 32L16 32L16 33L20 33L20 32L22 32L22 31L21 31L21 30L23 30L23 27L24 27L24 31L23 31L23 32L24 32L24 33L25 33L25 32L24 32L24 31L27 31L27 32L28 32L28 33L29 33L29 31L30 31L30 32L31 32L31 33L32 33L32 32L31 32L31 31L32 31L32 30L31 30L31 29L30 29L30 28L31 28L31 27L32 27L32 26L33 26L33 24L32 24L32 26L31 26L31 25L30 25L30 24L31 24L31 23L32 23L32 22L33 22L33 21L32 21L32 20L31 20L31 19L32 19L32 18L33 18L33 17L32 17L32 16L31 16L31 15L32 15L32 14L33 14L33 13L31 13L31 15L30 15L30 13L29 13L29 10L28 10L28 8L27 8L27 9L26 9L26 8L25 8L25 6L24 6L24 8L23 8L23 6L22 6L22 7L21 7L21 5L20 5L20 4L21 4L21 3L22 3L22 4L23 4L23 5L24 5L24 4L25 4L25 3L24 3L24 2L25 2L25 1L24 1L24 0L23 0L23 1L24 1L24 2L22 2L22 1L21 1L21 2L20 2L20 4L19 4L19 3L16 3L16 1L14 1L14 0L13 0L13 1L11 1L11 2L10 2L10 0ZM17 0L17 1L18 1L18 2L19 2L19 1L20 1L20 0L19 0L19 1L18 1L18 0ZM13 1L13 2L12 2L12 4L13 4L13 3L14 3L14 1ZM10 3L10 4L11 4L11 3ZM23 3L23 4L24 4L24 3ZM8 5L8 7L9 7L9 5ZM17 5L17 8L19 8L19 9L18 9L18 10L19 10L19 13L15 13L15 12L16 12L16 11L15 11L15 12L14 12L14 11L12 11L12 12L14 12L14 13L13 13L13 14L14 14L14 13L15 13L15 14L16 14L16 16L19 16L19 17L21 17L21 18L22 18L22 19L24 19L24 20L21 20L21 19L20 19L20 20L19 20L19 21L17 21L17 20L18 20L18 19L17 19L17 20L14 20L14 21L15 21L15 22L16 22L16 24L18 24L18 23L19 23L19 24L21 24L21 25L20 25L20 26L17 26L17 25L15 25L15 24L14 24L14 25L13 25L13 24L12 24L12 25L13 25L13 26L14 26L14 25L15 25L15 26L16 26L16 27L15 27L15 28L14 28L14 27L13 27L13 28L14 28L14 29L12 29L12 30L14 30L14 29L15 29L15 30L16 30L16 32L18 32L18 31L20 31L20 30L21 30L21 29L22 29L22 28L21 28L21 29L20 29L20 26L21 26L21 25L22 25L22 24L21 24L21 23L20 23L20 22L19 22L19 21L21 21L21 22L23 22L23 23L24 23L24 24L27 24L27 22L25 22L25 21L27 21L27 20L28 20L28 19L26 19L26 18L25 18L25 17L28 17L28 18L29 18L29 17L30 17L30 19L29 19L29 20L30 20L30 21L28 21L28 24L30 24L30 23L29 23L29 22L30 22L30 21L31 21L31 20L30 20L30 19L31 19L31 16L30 16L30 15L29 15L29 13L28 13L28 16L26 16L26 14L25 14L25 13L27 13L27 12L28 12L28 11L27 11L27 10L25 10L25 9L24 9L24 10L23 10L23 9L22 9L22 8L21 8L21 7L20 7L20 5ZM15 6L15 8L16 8L16 6ZM18 6L18 7L19 7L19 8L20 8L20 9L19 9L19 10L20 10L20 9L21 9L21 11L20 11L20 13L19 13L19 14L17 14L17 15L19 15L19 14L20 14L20 16L22 16L22 17L23 17L23 18L24 18L24 19L25 19L25 18L24 18L24 17L25 17L25 16L24 16L24 17L23 17L23 15L21 15L21 14L24 14L24 13L23 13L23 12L26 12L26 11L25 11L25 10L24 10L24 11L22 11L22 9L21 9L21 8L20 8L20 7L19 7L19 6ZM29 8L29 9L30 9L30 8ZM31 8L31 10L33 10L33 9L32 9L32 8ZM8 11L8 12L9 12L9 11ZM30 11L30 12L31 12L31 11ZM0 12L0 14L1 14L1 12ZM10 12L10 13L9 13L9 14L8 14L8 15L9 15L9 14L10 14L10 13L11 13L11 12ZM21 12L21 13L20 13L20 14L21 14L21 13L22 13L22 12ZM13 15L13 16L15 16L15 15ZM28 16L28 17L29 17L29 16ZM1 18L1 19L3 19L3 18ZM6 19L6 20L7 20L7 19ZM23 21L23 22L24 22L24 21ZM4 22L4 23L6 23L6 24L7 24L7 23L6 23L6 22ZM17 22L17 23L18 23L18 22ZM8 24L8 25L9 25L9 24ZM23 25L23 26L22 26L22 27L23 27L23 26L24 26L24 25ZM25 25L25 28L28 28L28 25ZM29 25L29 28L30 28L30 27L31 27L31 26L30 26L30 25ZM26 26L26 27L27 27L27 26ZM8 28L8 33L9 33L9 28ZM15 28L15 29L16 29L16 30L17 30L17 29L19 29L19 30L20 30L20 29L19 29L19 28L17 28L17 29L16 29L16 28ZM32 28L32 29L33 29L33 28ZM25 29L25 30L28 30L28 31L29 31L29 30L28 30L28 29ZM30 30L30 31L31 31L31 30ZM10 31L10 32L11 32L11 31ZM13 32L13 33L14 33L14 32ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM33 0L26 0L26 7L33 7ZM32 1L27 1L27 6L32 6ZM31 2L28 2L28 5L31 5ZM0 33L7 33L7 26L0 26ZM1 32L6 32L6 27L1 27ZM2 31L5 31L5 28L2 28Z\" fill=\"#000000\"/></g></g></svg>\n\n    </div>\n    <p style=\"margin: 2px 0 0 0; font-size: 7pt; text-align: center; font-weight: bold; letter-spacing: 0.02em;\">Dokumen Terverifikasi</p>\n</div>\n            </td>\n        </tr>\n    </tbody>\n    <div style=\"height: 35mm; display: block;\"></div>\n</table></div>\n<!-- <div style=\"position: fixed; bottom: 3mm; left: 0; right: 0; width: 100%;\"> -->\n    <div style=\"width: 100%;\">\n    <div style=\"border-top: 2px solid #1B5E20; margin-bottom: 1.5px;\"></div>\n    <div style=\"border-top: 0.8px solid #1B5E20; margin-bottom: 3px;\"></div>\n    <p style=\"color: #1B5E20; font-size: 9.5pt; font-weight: 700; text-align: center; margin: 0; line-height: 1.3; letter-spacing: 0.04em; font-family: \'Times New Roman\', serif;\">\n        UNIVERSITAS NAHDLATUL ULAMA AL GHAZALI CILACAP\n    </p>\n    <p style=\"font-size: 7.8pt; text-align: center; margin: 0; line-height: 1.3; color: #1B5E20;\">\n        Jl. Kemerdekaan Barat No. 17, Cilacap Tengah, http:// unugha.ac.id\n    </p>\n    <p style=\"font-size: 7.8pt; text-align: center; margin: 0; line-height: 1.3; color: #1B5E20;\">\n        Email : fmikom@unugha.ac.id Telp. : (0282) 695415, 695407 Fax : (0282) 695407\n    </p>\n</div>', '2026-06-06 07:31:04', NULL, '2026-06-06 07:31:05', '2026-06-06 00:31:04', '2026-06-06 00:31:05', '59ce4349-8366-48b0-8678-ec6a5724a9c0');
INSERT INTO `surats` (`id`, `jenis_surat_id`, `type`, `pemohon_id`, `nomor_surat`, `keperluan`, `kepada_yth`, `lampiran_keterangan`, `status`, `isi_surat`, `admin_note`, `rejection_reason`, `validated_by_admin_id`, `validated_by_admin_at`, `approved_by_id`, `approved_at`, `generated_file_path`, `generated_file_type`, `generated_at`, `template_version`, `revisi_ke`, `catatan_revisi`, `print_count`, `last_printed_at`, `rendered_snapshot`, `tanggal_pengajuan`, `tanggal_kebutuhan`, `tanggal_selesai`, `created_at`, `updated_at`, `qr_token`) VALUES
(104, 16, 'surat_keluar', 5, 'B/0104/PK.10/TM/FMIKOM/2026', 'jjhjbjb', NULL, NULL, 'finished', '{\"jenis_surat_id\":16,\"jenis_surat\":\"Surat Keterangan Dosen\",\"keperluan\":\"jjhjbjb\",\"data\":{\"nama\":\"njkjbuj\",\"nik\":\"667887\",\"lahir\":\"56 thjijn\",\"nim\":\"89u0u09\"},\"created_by\":{\"id\":5,\"name\":\"Admin\"}}', NULL, NULL, 5, '2026-06-06 08:48:04', NULL, NULL, 'fast/generated/surat-104-surat-keterangan-dosen-1780724611.pdf', 'pdf', '2026-06-06 08:48:04', 1, 0, NULL, 0, NULL, '<section style=\"margin-bottom: 8px; text-align: center;\">\n    <img src=\"data:image/png;base64,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\" alt=\"Logo\" style=\"display:block; height:70px; margin:0 auto 4px;\">\n    <div style=\"color: #1B5E20; font-family: \'Times New Roman\', serif; font-weight: 700; line-height: 1.1; text-align: center;\">\n        <div style=\"font-size: 16pt; letter-spacing: 0.08em;\">UNIVERSITAS NAHDLATUL ULAMA AL GHAZALI CILACAP</div>\n        <div style=\"font-size: 13pt; text-transform: uppercase;\">FAKULTAS MATEMATIKA DAN ILMU KOMPUTER</div><div style=\"font-size: 13pt;\">(FMIKOM)</div>\n    </div>\n    <p style=\"color: #1B5E20; font-size: 9.5pt; line-height: 1.2; margin: 3px 0 5px; text-align: center;\">Keputusan Kemendikbud RI Nomor : 264/E/O/2014 Tanggal 23 Juli 2014</p>\n    <div style=\"margin: 0 auto; width: 100%;\">\n        <div style=\"border-top: 2px solid #1B5E20; margin-bottom: 1.5px;\"></div>\n        <div style=\"border-top: 0.8px solid #1B5E20;\"></div>\n    </div>\n</section>\n<div class=\"surat-content\"><h2 style=\"margin: 0 0 2px 0; text-align: center; font-size: 12pt; font-weight: bold;  text-transform: uppercase;\">Surat keterangan lulus</h2>\n<p style=\"margin: 0 0 8px 0; text-align: justify; font-size: 11pt; line-height: 1.5;   \">Yang bertanda tangan dibawah ini:</p>\n<table style=\"width: 100%; border-collapse: collapse; margin-bottom: 8px; font-size: 11pt;\">\n<tbody>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">Nama</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{nama_pemohon}}</td>\n            </tr>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">NIk</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{nim}}</td>\n            </tr>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">Lahir</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{lahir}}</td>\n            </tr>\n</tbody>\n</table>\n<p style=\"margin: 0 0 8px 0; text-align: justify; font-size: 11pt; line-height: 1.5;   \">Menerangkan Dosen tersebut di bawah ini</p>\n<table style=\"width: 100%; border-collapse: collapse; margin-bottom: 8px; font-size: 11pt;\">\n<tbody>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">Nama</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{nama_pemohon}}</td>\n            </tr>\n<tr>\n                <td style=\"width: 130px; padding: 1.5px 0; vertical-align: top;\">NIM</td>\n                <td style=\"width: 12px; padding: 1.5px 0; vertical-align: top; text-align: center;\">:</td>\n                <td style=\"padding: 1.5px 0; vertical-align: top;\">{{nim}}</td>\n            </tr>\n</tbody>\n</table>\n<p style=\"margin: 0 0 8px 0; text-align: justify; font-size: 11pt; line-height: 1.5;   \">Benar dosen unugha</p>\n<table style=\"width: 100%; border-collapse: collapse; margin-top: 16px; font-size: 11pt;\">\n    <tbody>\n        <tr>\n            <td style=\"vertical-align: top; text-align: right; padding: 0 8px 0 0; font-size: 11pt;\">\n    <p style=\"margin: 0 0 3px 0;\">Ketua,</p>\n    <div style=\"height: 50px;\"></div>\n    <p style=\"margin: 0; font-weight: bold;\">Hellen</p>\n    <p style=\"margin: 0;\">7357</p>\n</td>\n            <td style=\"width: 130px; vertical-align: top; text-align: center; padding: 0 0 0 8px;\">\n                <div style=\"display: inline-block; text-align: center;\">\n    <div style=\"width: 113px; height: 113px;\">\n        <?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"113\" height=\"113\" viewBox=\"0 0 113 113\"><rect x=\"0\" y=\"0\" width=\"113\" height=\"113\" fill=\"#ffffff\"/><g transform=\"scale(2.756)\"><g transform=\"translate(4,4)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L5 9L5 8L0 8L0 9L1 9L1 10L0 10L0 11L1 11L1 12L0 12L0 16L1 16L1 17L0 17L0 19L2 19L2 20L1 20L1 21L0 21L0 25L1 25L1 21L2 21L2 20L3 20L3 21L4 21L4 20L3 20L3 19L2 19L2 18L3 18L3 17L4 17L4 18L5 18L5 21L7 21L7 22L6 22L6 23L7 23L7 24L6 24L6 25L7 25L7 24L8 24L8 27L9 27L9 24L10 24L10 27L11 27L11 28L12 28L12 27L13 27L13 26L12 26L12 25L14 25L14 26L15 26L15 27L14 27L14 28L13 28L13 29L10 29L10 28L8 28L8 33L12 33L12 32L13 32L13 33L14 33L14 32L13 32L13 29L14 29L14 30L15 30L15 33L20 33L20 32L22 32L22 31L21 31L21 30L23 30L23 27L24 27L24 31L23 31L23 32L24 32L24 33L25 33L25 32L24 32L24 31L27 31L27 32L28 32L28 33L29 33L29 31L30 31L30 32L31 32L31 33L32 33L32 32L31 32L31 31L32 31L32 30L31 30L31 29L30 29L30 28L31 28L31 27L32 27L32 26L33 26L33 24L32 24L32 26L31 26L31 25L30 25L30 24L31 24L31 23L32 23L32 22L33 22L33 21L32 21L32 20L31 20L31 19L32 19L32 18L33 18L33 17L32 17L32 16L31 16L31 15L32 15L32 14L33 14L33 13L31 13L31 15L30 15L30 13L29 13L29 10L28 10L28 8L27 8L27 9L26 9L26 8L25 8L25 6L24 6L24 8L23 8L23 6L22 6L22 7L21 7L21 6L20 6L20 8L22 8L22 9L18 9L18 8L16 8L16 7L17 7L17 6L16 6L16 5L15 5L15 4L17 4L17 5L21 5L21 4L19 4L19 2L18 2L18 1L21 1L21 2L20 2L20 3L22 3L22 4L23 4L23 5L24 5L24 4L25 4L25 3L24 3L24 2L25 2L25 1L24 1L24 0L23 0L23 1L24 1L24 2L22 2L22 1L21 1L21 0L18 0L18 1L14 1L14 0L13 0L13 1L11 1L11 2L10 2L10 0ZM13 1L13 2L12 2L12 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 9L15 9L15 10L13 10L13 11L12 11L12 12L14 12L14 13L13 13L13 15L12 15L12 13L11 13L11 12L10 12L10 13L9 13L9 12L8 12L8 11L6 11L6 10L8 10L8 9L6 9L6 10L3 10L3 9L2 9L2 10L1 10L1 11L2 11L2 10L3 10L3 15L4 15L4 16L5 16L5 17L6 17L6 18L7 18L7 19L6 19L6 20L7 20L7 21L8 21L8 23L9 23L9 22L10 22L10 23L12 23L12 22L11 22L11 21L13 21L13 22L17 22L17 23L13 23L13 24L14 24L14 25L15 25L15 26L17 26L17 28L19 28L19 29L15 29L15 28L16 28L16 27L15 27L15 28L14 28L14 29L15 29L15 30L16 30L16 32L18 32L18 31L20 31L20 30L21 30L21 29L22 29L22 28L21 28L21 29L20 29L20 28L19 28L19 27L21 27L21 25L22 25L22 24L21 24L21 22L23 22L23 23L24 23L24 24L27 24L27 22L25 22L25 21L27 21L27 20L28 20L28 19L26 19L26 18L25 18L25 17L28 17L28 18L29 18L29 17L30 17L30 19L29 19L29 20L30 20L30 21L28 21L28 24L30 24L30 23L29 23L29 22L30 22L30 21L31 21L31 20L30 20L30 19L31 19L31 16L30 16L30 15L29 15L29 13L28 13L28 16L26 16L26 14L25 14L25 13L27 13L27 12L28 12L28 11L27 11L27 10L25 10L25 9L24 9L24 10L23 10L23 9L22 9L22 11L24 11L24 10L25 10L25 11L26 11L26 12L23 12L23 13L24 13L24 14L21 14L21 13L22 13L22 12L21 12L21 11L20 11L20 10L18 10L18 9L15 9L15 8L14 8L14 6L15 6L15 7L16 7L16 6L15 6L15 5L14 5L14 4L15 4L15 3L14 3L14 1ZM16 2L16 3L18 3L18 2ZM10 3L10 4L11 4L11 3ZM13 3L13 4L14 4L14 3ZM23 3L23 4L24 4L24 3ZM8 5L8 7L9 7L9 5ZM18 6L18 7L19 7L19 6ZM29 8L29 9L30 9L30 8ZM31 8L31 10L33 10L33 9L32 9L32 8ZM15 10L15 11L14 11L14 12L15 12L15 13L14 13L14 16L13 16L13 17L11 17L11 18L13 18L13 17L14 17L14 18L15 18L15 19L14 19L14 20L13 20L13 21L15 21L15 20L17 20L17 21L19 21L19 22L21 22L21 21L19 21L19 20L17 20L17 19L19 19L19 18L20 18L20 20L24 20L24 19L25 19L25 18L24 18L24 17L25 17L25 16L24 16L24 17L23 17L23 15L21 15L21 16L20 16L20 17L18 17L18 16L16 16L16 14L17 14L17 15L19 15L19 14L20 14L20 13L21 13L21 12L20 12L20 13L19 13L19 12L17 12L17 11L16 11L16 10ZM15 11L15 12L16 12L16 13L15 13L15 14L16 14L16 13L17 13L17 14L19 14L19 13L17 13L17 12L16 12L16 11ZM30 11L30 12L31 12L31 11ZM1 12L1 16L2 16L2 17L1 17L1 18L2 18L2 17L3 17L3 16L2 16L2 12ZM4 12L4 14L6 14L6 15L5 15L5 16L6 16L6 17L7 17L7 18L8 18L8 19L7 19L7 20L8 20L8 21L11 21L11 20L12 20L12 19L10 19L10 16L12 16L12 15L9 15L9 14L6 14L6 13L8 13L8 12ZM10 13L10 14L11 14L11 13ZM6 15L6 16L8 16L8 18L9 18L9 16L8 16L8 15ZM14 16L14 17L15 17L15 18L18 18L18 17L16 17L16 16ZM21 16L21 17L20 17L20 18L22 18L22 19L24 19L24 18L23 18L23 17L22 17L22 16ZM28 16L28 17L29 17L29 16ZM8 19L8 20L10 20L10 19ZM23 21L23 22L24 22L24 21ZM2 22L2 23L3 23L3 22ZM18 23L18 24L15 24L15 25L17 25L17 26L20 26L20 25L21 25L21 24L20 24L20 25L19 25L19 23ZM2 24L2 25L3 25L3 24ZM4 24L4 25L5 25L5 24ZM11 24L11 25L12 25L12 24ZM23 25L23 26L22 26L22 27L23 27L23 26L24 26L24 25ZM25 25L25 28L28 28L28 25ZM29 25L29 28L30 28L30 27L31 27L31 26L30 26L30 25ZM11 26L11 27L12 27L12 26ZM26 26L26 27L27 27L27 26ZM32 28L32 29L33 29L33 28ZM19 29L19 30L20 30L20 29ZM25 29L25 30L28 30L28 31L29 31L29 30L28 30L28 29ZM10 30L10 31L9 31L9 32L12 32L12 30ZM30 30L30 31L31 31L31 30ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM33 0L26 0L26 7L33 7ZM32 1L27 1L27 6L32 6ZM31 2L28 2L28 5L31 5ZM0 33L7 33L7 26L0 26ZM1 32L6 32L6 27L1 27ZM2 31L5 31L5 28L2 28Z\" fill=\"#000000\"/></g></g></svg>\n\n    </div>\n    <p style=\"margin: 2px 0 0 0; font-size: 7pt; text-align: center; font-weight: bold; letter-spacing: 0.02em;\">Dokumen Terverifikasi</p>\n</div>\n            </td>\n        </tr>\n    </tbody>\n    <div style=\"height: 35mm; display: block;\"></div>\n</table></div>\n<!-- <div style=\"position: fixed; bottom: 3mm; left: 0; right: 0; width: 100%;\"> -->\n    <div style=\"width: 100%;\">\n    <div style=\"border-top: 2px solid #1B5E20; margin-bottom: 1.5px;\"></div>\n    <div style=\"border-top: 0.8px solid #1B5E20; margin-bottom: 3px;\"></div>\n    <p style=\"color: #1B5E20; font-size: 9.5pt; font-weight: 700; text-align: center; margin: 0; line-height: 1.3; letter-spacing: 0.04em; font-family: \'Times New Roman\', serif;\">\n        UNIVERSITAS NAHDLATUL ULAMA AL GHAZALI CILACAP\n    </p>\n    <p style=\"font-size: 7.8pt; text-align: center; margin: 0; line-height: 1.3; color: #1B5E20;\">\n        Jl. Kemerdekaan Barat No. 17, Cilacap Tengah, http:// unugha.ac.id\n    </p>\n    <p style=\"font-size: 7.8pt; text-align: center; margin: 0; line-height: 1.3; color: #1B5E20;\">\n        Email : fmikom@unugha.ac.id Telp. : (0282) 695415, 695407 Fax : (0282) 695407\n    </p>\n</div>', '2026-06-06 08:47:58', NULL, '2026-06-06 08:48:04', '2026-06-06 01:47:58', '2026-06-06 01:48:04', '60e01ddf-e3c4-4073-8f01-3951f1086b76');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_approval_flows`
--

CREATE TABLE `surat_approval_flows` (
  `id` bigint UNSIGNED NOT NULL,
  `surat_id` bigint UNSIGNED NOT NULL,
  `approver_id` bigint UNSIGNED NOT NULL,
  `urutan` int NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal_aksi` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `surat_approval_flows`
--

INSERT INTO `surat_approval_flows` (`id`, `surat_id`, `approver_id`, `urutan`, `role`, `status`, `keterangan`, `approved_at`, `catatan`, `tanggal_aksi`, `created_at`, `updated_at`) VALUES
(39, 99, 5, 1, 'admin', 'rejected', 'Ditolak ADMIN', '2026-06-06 05:51:22', 'data kurang lengkap', '2026-06-06 05:51:22', '2026-06-05 22:51:22', '2026-06-05 22:51:22'),
(40, 98, 5, 1, 'admin', 'rejected', 'Ditolak ADMIN', '2026-06-06 05:51:29', 'data kurang lengkap', '2026-06-06 05:51:29', '2026-06-05 22:51:29', '2026-06-05 22:51:29'),
(42, 103, 5, 1, 'admin', 'approved', 'Validasi Admin', '2026-06-06 07:31:04', NULL, '2026-06-06 07:31:04', '2026-06-06 00:31:04', '2026-06-06 00:31:04'),
(43, 104, 5, 1, 'admin', 'approved', 'Validasi Admin', '2026-06-06 08:47:58', NULL, '2026-06-06 08:47:58', '2026-06-06 01:47:58', '2026-06-06 01:47:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_categories`
--

CREATE TABLE `surat_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Lucide icon name, e.g. mail, file-text',
  `warna` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tailwind color key, e.g. indigo, emerald, amber',
  `urutan` int UNSIGNED NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `surat_categories`
--

INSERT INTO `surat_categories` (`id`, `nama`, `slug`, `deskripsi`, `icon`, `warna`, `urutan`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Surat Permohonan', 'surat-permohonan', 'Surat yang berisi permintaan resmi dari mahasiswa atau dosen.', NULL, NULL, 1, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(2, 'Surat Keterangan', 'surat-keterangan', 'Surat yang menerangkan status atau kondisi akademik.', NULL, NULL, 2, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(3, 'Surat Tugas', 'surat-tugas', 'Surat penugasan resmi untuk dosen atau staf.', NULL, NULL, 3, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(4, 'Surat Undangan', 'surat-undangan', 'Surat undangan rapat atau kegiatan resmi.', NULL, NULL, 4, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(5, 'Surat Pengantar', 'surat-pengantar', 'Surat pengantar ke instansi atau pihak lain.', NULL, NULL, 5, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(6, 'Surat Rekomendasi', 'surat-rekomendasi', 'Surat rekomendasi akademik atau non-akademik.', NULL, NULL, 6, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(7, 'Surat Keputusan', 'surat-keputusan', 'Dokumen keputusan resmi lembaga.', NULL, NULL, 7, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(8, 'Surat Edaran', 'surat-edaran', 'Penyampaian informasi resmi yang bersifat umum.', NULL, NULL, 8, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(9, 'Surat Pemberitahuan', 'surat-pemberitahuan', 'Informasi resmi yang lebih spesifik kepada penerima.', NULL, NULL, 9, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(10, 'Memo / Nota Dinas', 'memo-nota-dinas', 'Komunikasi internal formal untuk kebutuhan administratif.', NULL, NULL, 10, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31'),
(11, 'Pengumuman', 'pengumuman', 'Informasi publik internal kampus.', NULL, NULL, 11, 1, '2026-04-26 23:28:31', '2026-04-26 23:28:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_data`
--

CREATE TABLE `surat_data` (
  `id` bigint UNSIGNED NOT NULL,
  `surat_id` bigint UNSIGNED NOT NULL,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `surat_data`
--

INSERT INTO `surat_data` (`id`, `surat_id`, `field_name`, `field_value`, `created_at`, `updated_at`) VALUES
(456, 98, 'nama', 'Hellen Tiffani', '2026-06-05 22:48:41', '2026-06-05 22:48:41'),
(457, 98, 'nik', '232242', '2026-06-05 22:48:41', '2026-06-05 22:48:41'),
(458, 98, 'jabatan', 'Guru', '2026-06-05 22:48:41', '2026-06-05 22:48:41'),
(459, 98, 'nim', '22344', '2026-06-05 22:48:41', '2026-06-05 22:48:41'),
(460, 98, 'tempat_tanggal_lahir', '27 Maret 2025', '2026-06-05 22:48:41', '2026-06-05 22:48:41'),
(461, 99, 'nama', 'hellen', '2026-06-05 22:50:06', '2026-06-05 22:50:06'),
(462, 99, 'nik', '13131', '2026-06-05 22:50:06', '2026-06-05 22:50:06'),
(463, 99, 'lahir', '24 maret 2026', '2026-06-05 22:50:06', '2026-06-05 22:50:06'),
(464, 99, 'nim', '324253', '2026-06-05 22:50:06', '2026-06-05 22:50:06'),
(465, 100, 'nama', 'qjehdqhdqi', '2026-06-05 22:53:57', '2026-06-05 22:53:57'),
(466, 100, 'nik', '123131', '2026-06-05 22:53:57', '2026-06-05 22:53:57'),
(467, 100, 'lahir', '26382', '2026-06-05 22:53:57', '2026-06-05 22:53:57'),
(468, 100, 'nim', '212314', '2026-06-05 22:53:57', '2026-06-05 22:53:57'),
(469, 101, 'nama', 'adada', '2026-06-05 22:55:27', '2026-06-05 22:55:27'),
(470, 101, 'nik', '213131', '2026-06-05 22:55:27', '2026-06-05 22:55:27'),
(471, 101, 'jabatan', 'jshsjjqqjq', '2026-06-05 22:55:27', '2026-06-05 22:55:27'),
(472, 101, 'nim', '122132', '2026-06-05 22:55:27', '2026-06-05 22:55:27'),
(473, 101, 'tempat_tanggal_lahir', '27 maret 2025', '2026-06-05 22:55:27', '2026-06-05 22:55:27'),
(474, 102, 'nama', 'hellen', '2026-06-06 00:25:13', '2026-06-06 00:25:13'),
(475, 102, 'nik', '22222', '2026-06-06 00:25:13', '2026-06-06 00:25:13'),
(476, 102, 'lahir', '26 maret 2022', '2026-06-06 00:25:13', '2026-06-06 00:25:13'),
(477, 102, 'nim', '66758768', '2026-06-06 00:25:13', '2026-06-06 00:25:13'),
(478, 103, 'nama', 'hellen', '2026-06-06 00:31:04', '2026-06-06 00:31:04'),
(479, 103, 'nik', '22222', '2026-06-06 00:31:04', '2026-06-06 00:31:04'),
(480, 103, 'lahir', '26 maret 2022', '2026-06-06 00:31:04', '2026-06-06 00:31:04'),
(481, 103, 'nim', '66758768', '2026-06-06 00:31:04', '2026-06-06 00:31:04'),
(482, 104, 'nama', 'njkjbuj', '2026-06-06 01:47:58', '2026-06-06 01:47:58'),
(483, 104, 'nik', '667887', '2026-06-06 01:47:58', '2026-06-06 01:47:58'),
(484, 104, 'lahir', '56 thjijn', '2026-06-06 01:47:58', '2026-06-06 01:47:58'),
(485, 104, 'nim', '89u0u09', '2026-06-06 01:47:58', '2026-06-06 01:47:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_histories`
--

CREATE TABLE `surat_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `surat_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'created|submitted|validated|approved|rejected|generated|printed|qr_scanned|qr_revoked|revised',
  `action_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Label ramah: Surat dibuat, Surat disetujui Kaprodi',
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta` json DEFAULT NULL COMMENT 'Data tambahan: {status_lama, status_baru, ...}',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `surat_histories`
--

INSERT INTO `surat_histories` (`id`, `surat_id`, `user_id`, `action`, `action_label`, `keterangan`, `meta`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 103, 5, 'validated', 'Surat divalidasi admin', NULL, NULL, '127.0.0.1', '2026-06-06 00:31:05', '2026-06-06 00:31:05'),
(2, 104, 5, 'validated', 'Surat divalidasi admin', NULL, NULL, '127.0.0.1', '2026-06-06 01:48:04', '2026-06-06 01:48:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_lampirans`
--

CREATE TABLE `surat_lampirans` (
  `id` bigint UNSIGNED NOT NULL,
  `surat_id` bigint UNSIGNED NOT NULL,
  `nama_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_qr_codes`
--

CREATE TABLE `surat_qr_codes` (
  `id` bigint UNSIGNED NOT NULL,
  `surat_id` bigint UNSIGNED NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'UUID token QR',
  `status` enum('active','revoked','expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `revoked_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked_by` bigint UNSIGNED DEFAULT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL COMMENT 'Kapan QR mulai aktif — null jika belum disetujui',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_templates`
--

CREATE TABLE `surat_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `jenis_surat_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'html',
  `source_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `docx_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Path file .docx yang diupload admin',
  `kop_surat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'HTML kop override (null = pakai global settings)',
  `footer_surat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'HTML footer override',
  `css_style` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'CSS kustom untuk template ini',
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `template_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `template_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_footer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `version` int UNSIGNED NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `surat_templates`
--

INSERT INTO `surat_templates` (`id`, `jenis_surat_id`, `name`, `deskripsi`, `slug`, `format`, `source_reference`, `docx_path`, `kop_surat`, `footer_surat`, `css_style`, `subject`, `template_header`, `template_body`, `template_footer`, `version`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(7, 15, 'Surat Keterangan Lulus', NULL, 'template-surat-keterangan-lulus-1780724110-v1', 'html', NULL, NULL, NULL, NULL, '', NULL, NULL, '[{\"type\":\"judul\",\"teks\":\"surat keterangan lulus\",\"align\":\"center\",\"font_size\":\"12pt\",\"bold\":true,\"underline\":false},{\"type\":\"paragraf\",\"teks\":\"Yang bertanda tangan di bawah ini:\",\"align\":\"justify\",\"text_indent\":0},{\"type\":\"tabel_data\",\"rows\":[{\"label\":\"Nama\",\"nilai\":\"{{nama_pemohon}}\"},{\"label\":\"NIK\",\"nilai\":\"{{nim}}\"},{\"label\":\"Jabatan\",\"nilai\":\"\"}]},{\"type\":\"spasi\",\"tinggi\":12},{\"type\":\"paragraf\",\"teks\":\"Menerangkan Mahasiswa tersebut di bawah ini\",\"align\":\"justify\",\"text_indent\":0},{\"type\":\"tabel_data\",\"rows\":[{\"label\":\"Nama\",\"nilai\":\"{{nama_pemohon}}\"},{\"label\":\"NIM\",\"nilai\":\"{{nim}}\"},{\"label\":\"Tempat, Tanggal Lahir\",\"nilai\":\"{{Tempat_Tanggal_Lahir}}\"},{\"label\":\"Tahun Masuk\",\"nilai\":\"{{Tahun Masuk}}\"}]},{\"type\":\"spasi\",\"tinggi\":12},{\"type\":\"paragraf\",\"teks\":\"Adalah benar mahasiswa kami yang TELAH DINYATAKAN LULUS  \",\"align\":\"justify\",\"text_indent\":0},{\"type\":\"tanda_tangan\",\"kolom\":[{\"jabatan\":\"Ketua,\",\"nama\":\"Pak, Zen\",\"nik\":\"\"}],\"posisi\":\"kanan\"}]', NULL, 1, 1, NULL, NULL, '2026-06-05 22:40:31', '2026-06-05 22:40:31'),
(8, 16, 'Surat Keterangan Dosen', NULL, 'template-surat-keterangan-dosen-1780724611-v1', 'html', NULL, NULL, NULL, NULL, '', NULL, NULL, '[{\"type\":\"judul\",\"teks\":\"Surat keterangan lulus\",\"align\":\"center\",\"font_size\":\"12pt\",\"bold\":true,\"underline\":false},{\"type\":\"paragraf\",\"teks\":\"Yang bertanda tangan dibawah ini:\",\"align\":\"justify\",\"text_indent\":0},{\"type\":\"tabel_data\",\"rows\":[{\"label\":\"Nama\",\"nilai\":\"{{nama_pemohon}}\"},{\"label\":\"NIk\",\"nilai\":\"{{nim}}\"},{\"label\":\"Lahir\",\"nilai\":\"{{lahir}}\"}]},{\"type\":\"paragraf\",\"teks\":\"Menerangkan Dosen tersebut di bawah ini\",\"align\":\"justify\",\"text_indent\":0},{\"type\":\"tabel_data\",\"rows\":[{\"label\":\"Nama\",\"nilai\":\"{{nama_pemohon}}\"},{\"label\":\"NIM\",\"nilai\":\"{{nim}}\"}]},{\"type\":\"paragraf\",\"teks\":\"Benar dosen unugha\",\"align\":\"justify\",\"text_indent\":0},{\"type\":\"tanda_tangan\",\"kolom\":[{\"jabatan\":\"Ketua,\",\"nama\":\"Hellen\",\"nik\":\"7357\"}],\"posisi\":\"kanan\"}]', NULL, 1, 1, NULL, NULL, '2026-06-05 22:45:53', '2026-06-05 22:45:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_template_placeholders`
--

CREATE TABLE `surat_template_placeholders` (
  `id` bigint UNSIGNED NOT NULL,
  `surat_template_id` bigint UNSIGNED NOT NULL,
  `placeholder_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `default_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `template_global_settings`
--

CREATE TABLE `template_global_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tipe` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text' COMMENT 'text|html|json|image_path',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `template_global_settings`
--

INSERT INTO `template_global_settings` (`id`, `key`, `value`, `tipe`, `label`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'nama_instansi', 'Universitas Nahdlatul Ulama Al Ghazali Cilacap', 'text', 'Nama Instansi', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(2, 'nama_fakultas', 'Fakultas Matematika dan Ilmu Komputer', 'text', 'Nama Fakultas', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(3, 'singkatan', 'FMIKOM', 'text', 'Singkatan Fakultas', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(4, 'alamat', 'Jl. Kemerdekaan Barat No. 17, Cilacap Tengah', 'text', 'Alamat', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(5, 'telepon', NULL, 'text', 'Telepon', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(6, 'website', NULL, 'text', 'Website', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(7, 'email', NULL, 'text', 'Email', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(8, 'logo_path', NULL, 'image_path', 'Logo Universitas', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(9, 'kop_html', NULL, 'html', 'Kop Surat (HTML)', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(10, 'footer_html', NULL, 'html', 'Footer Surat (HTML)', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(11, 'warna_primer', '#1B5E20', 'text', 'Warna Primer Kop', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(12, 'kota_surat', 'Cilacap', 'text', 'Kota Default', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19'),
(13, 'format_nomor', '{kode}/{urutan}/{bulan_romawi}/{tahun}', 'text', 'Format Nomor Surat', NULL, '2026-05-02 22:06:19', '2026-05-02 22:06:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_induk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_approval` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `program_studi_id` bigint UNSIGNED DEFAULT NULL,
  `nim_nip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `nomor_induk`, `status_approval`, `email_verified_at`, `password`, `otp_code`, `otp_expires_at`, `password_changed_at`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`, `role_id`, `program_studi_id`, `nim_nip`, `no_telepon`, `foto_path`, `is_active`) VALUES
(1, 'Muchlisin Maruf', 'muchlisinmaruf@gmail.com', NULL, 'approved', '2026-03-29 13:45:30', '$2y$12$7dVeo0mbJITCFTuEF51VoOzrZADBo16Pr0NKszt/rHCfeTQWIN.1e', NULL, NULL, '2026-03-29 13:57:07', NULL, NULL, NULL, NULL, '2026-03-29 13:23:50', '2026-03-29 13:57:07', 5, NULL, NULL, NULL, NULL, 1),
(2, 'Dummy Pelajar', 'mahasiswa@example.com', NULL, 'approved', NULL, '$2y$12$/0u391PgODpjbB2hikSzMuRr8FuOkjegffWWE508W6uTIeQgcN3n2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29 13:23:51', '2026-03-29 13:23:55', 3, NULL, NULL, NULL, NULL, 1),
(3, 'Maruf Muchlisin', 'cahwangon27112003@gmail.com', '22eo10013', 'pending', NULL, '$2y$12$pTB6zUDqA7NvUZk0qp/o0.Bi4PYI9qqusho8spU.D4hHIXcrvDF2.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29 14:50:10', '2026-03-29 14:50:10', 3, NULL, NULL, NULL, NULL, 1),
(5, 'Admin', 'tiffanyhellen27@gmail.com', NULL, 'approved', '2026-04-22 17:18:33', '$2y$12$M4949ana0DQJY84aX4QTEeNDSQkx7404pu9hNwFgw.loq5YVao8hO', NULL, NULL, NULL, NULL, NULL, NULL, 'U5vejqSBU8sXVMX0lNmR2q0Yk3xOu9tW3t8qDNkP8pIWY4QauWsaW2BAbJtL', '2026-04-08 08:47:09', '2026-04-22 17:18:33', 5, NULL, NULL, NULL, NULL, 1),
(6, 'Test User', 'test@example.com', '20210045', 'approved', '2026-04-27 09:33:20', '$2y$12$UgR52kLlAsSKB5yyxUy6ie6WMDQ/E1Cd3yM5ez5ARSoOq1MDxO1ju', NULL, NULL, NULL, NULL, NULL, NULL, 'LtWlUGyiTM', '2026-04-18 04:27:39', '2026-04-27 09:33:20', 3, NULL, '20210045', NULL, NULL, 1),
(8, 'Fanny', 'hellentiffanyyy@gmail.com', NULL, 'approved', '2026-04-22 17:18:33', '$2y$12$I9m3CK6kuTeFWwoix0bxA.h1j2FNOzElgEbimZhhmP4oxIaJVK/iC', NULL, NULL, NULL, NULL, NULL, NULL, '4D7u3KYkJlnhT0mSi513smvpeviYRgMyYfTS3AEKpF6KuaT48Q0jc9sgCE7I', '2026-04-22 17:18:11', '2026-04-22 17:18:33', 3, NULL, NULL, NULL, NULL, 1),
(9, 'Mrs. Laora', 'hellenfast1@gmail.com', NULL, 'approved', '2026-04-22 17:18:33', '$2y$12$fKiKLmFnXBJ6SrPO6IaUb./x7cJkHfeyoj1OHwDhzQBpvhvJFvLhe', NULL, NULL, NULL, NULL, NULL, NULL, 'i40JEsI7o0SfjkV0ipJwceH3G9Q6QB50aTA5XhvxyxT2PIXUva9F5UTNP3dT', '2026-04-22 17:18:11', '2026-04-22 17:18:33', 4, NULL, NULL, NULL, NULL, 1),
(10, 'Mrs. Anna', 'hellenfast2@gmail.com', NULL, 'approved', '2026-04-22 17:18:33', '$2y$12$2LIbDW.A9SKCW6BoQzPlSuMCFNS11ED8zEr5YbHnbzVoxMteKLDS6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-22 17:18:11', '2026-04-22 17:18:33', 6, NULL, NULL, NULL, NULL, 1),
(11, 'Mrs. Moana', 'hellenfast3@gmail.com', NULL, 'approved', '2026-04-22 17:18:33', '$2y$12$Y3hD7wmDIBn4hd23aAYaNOII9XwvF66XUu44wPrR8FcGq95L2RFJK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-22 17:18:11', '2026-04-22 17:18:33', 7, NULL, NULL, NULL, NULL, 1);

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `absensi_magangs`
--
ALTER TABLE `absensi_magangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absensi_magangs_pendaftaran_id_foreign` (`pendaftaran_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `detail_respons`
--
ALTER TABLE `detail_respons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_respons_respons_id_foreign` (`respons_id`),
  ADD KEY `detail_respons_pertanyaan_id_foreign` (`pertanyaan_id`),
  ADD KEY `detail_respons_pilihan_id_foreign` (`pilihan_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fakultas_kode_unique` (`kode`);

--
-- Indeks untuk tabel `jenis_surats`
--
ALTER TABLE `jenis_surats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenis_surats_allowed_role_id_foreign` (`allowed_role_id`),
  ADD KEY `jenis_surats_approval_role_id_foreign` (`approval_role_id`),
  ADD KEY `jenis_surats_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `jenis_surat_roles`
--
ALTER TABLE `jenis_surat_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jenis_surat_roles_jenis_surat_id_role_id_unique` (`jenis_surat_id`,`role_id`),
  ADD KEY `jenis_surat_roles_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_available_at_index` (`queue`,`reserved_at`,`available_at`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karir_alumnis`
--
ALTER TABLE `karir_alumnis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `karir_alumnis_alumni_id_foreign` (`alumni_id`);

--
-- Indeks untuk tabel `kuesioners`
--
ALTER TABLE `kuesioners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kuesioners_pembuat_id_foreign` (`pembuat_id`);

--
-- Indeks untuk tabel `logbook_magangs`
--
ALTER TABLE `logbook_magangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logbook_magangs_pendaftaran_id_foreign` (`pendaftaran_id`);

--
-- Indeks untuk tabel `lowongan_infos`
--
ALTER TABLE `lowongan_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lowongan_infos_pembuat_id_foreign` (`pembuat_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nomor_surat_sequences`
--
ALTER TABLE `nomor_surat_sequences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_surat_sequences_kode_surat_tahun_bulan_unique` (`kode_surat`,`tahun`,`bulan`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pembimbing_lapangans`
--
ALTER TABLE `pembimbing_lapangans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembimbing_lapangans_user_id_foreign` (`user_id`),
  ADD KEY `pembimbing_lapangans_perusahaan_id_foreign` (`perusahaan_id`);

--
-- Indeks untuk tabel `pendaftaran_magangs`
--
ALTER TABLE `pendaftaran_magangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pendaftaran_magangs_mahasiswa_id_foreign` (`mahasiswa_id`),
  ADD KEY `pendaftaran_magangs_perusahaan_id_foreign` (`perusahaan_id`),
  ADD KEY `pendaftaran_magangs_dosen_pembimbing_id_foreign` (`dosen_pembimbing_id`),
  ADD KEY `pendaftaran_magangs_pembimbing_lapangan_id_foreign` (`pembimbing_lapangan_id`),
  ADD KEY `pendaftaran_magangs_surat_tugas_id_foreign` (`surat_tugas_id`);

--
-- Indeks untuk tabel `penilaian_magangs`
--
ALTER TABLE `penilaian_magangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penilaian_magangs_pendaftaran_id_foreign` (`pendaftaran_id`),
  ADD KEY `penilaian_magangs_dosen_id_foreign` (`dosen_id`),
  ADD KEY `penilaian_magangs_pembimbing_lapangan_id_foreign` (`pembimbing_lapangan_id`);

--
-- Indeks untuk tabel `pertanyaan_kuesioners`
--
ALTER TABLE `pertanyaan_kuesioners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pertanyaan_kuesioners_kuesioner_id_foreign` (`kuesioner_id`);

--
-- Indeks untuk tabel `perusahaan_mitras`
--
ALTER TABLE `perusahaan_mitras`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pilihan_jawabans`
--
ALTER TABLE `pilihan_jawabans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pilihan_jawabans_pertanyaan_id_foreign` (`pertanyaan_id`);

--
-- Indeks untuk tabel `profil_alumnis`
--
ALTER TABLE `profil_alumnis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profil_alumnis_nim_unique` (`nim`),
  ADD KEY `profil_alumnis_user_id_foreign` (`user_id`),
  ADD KEY `profil_alumnis_program_studi_id_foreign` (`program_studi_id`);

--
-- Indeks untuk tabel `program_studis`
--
ALTER TABLE `program_studis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `program_studis_kode_unique` (`kode`),
  ADD KEY `program_studis_fakultas_id_foreign` (`fakultas_id`);

--
-- Indeks untuk tabel `respons_kuesioners`
--
ALTER TABLE `respons_kuesioners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `respons_kuesioners_kuesioner_id_foreign` (`kuesioner_id`),
  ADD KEY `respons_kuesioners_alumni_id_foreign` (`alumni_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `surats`
--
ALTER TABLE `surats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surats_qr_token_unique` (`qr_token`),
  ADD KEY `surats_jenis_surat_id_foreign` (`jenis_surat_id`),
  ADD KEY `surats_pemohon_id_foreign` (`pemohon_id`),
  ADD KEY `surats_validated_by_admin_id_foreign` (`validated_by_admin_id`),
  ADD KEY `surats_approved_by_id_foreign` (`approved_by_id`);

--
-- Indeks untuk tabel `surat_approval_flows`
--
ALTER TABLE `surat_approval_flows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_approval_flows_surat_id_foreign` (`surat_id`),
  ADD KEY `surat_approval_flows_approver_id_foreign` (`approver_id`);

--
-- Indeks untuk tabel `surat_categories`
--
ALTER TABLE `surat_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_categories_slug_unique` (`slug`);

--
-- Indeks untuk tabel `surat_data`
--
ALTER TABLE `surat_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_data_surat_id_field_name_unique` (`surat_id`,`field_name`);

--
-- Indeks untuk tabel `surat_histories`
--
ALTER TABLE `surat_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_histories_surat_id_created_at_index` (`surat_id`,`created_at`),
  ADD KEY `surat_histories_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `surat_lampirans`
--
ALTER TABLE `surat_lampirans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_lampirans_surat_id_foreign` (`surat_id`);

--
-- Indeks untuk tabel `surat_qr_codes`
--
ALTER TABLE `surat_qr_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_qr_codes_token_unique` (`token`),
  ADD KEY `surat_qr_codes_revoked_by_foreign` (`revoked_by`),
  ADD KEY `surat_qr_codes_token_status_index` (`token`,`status`),
  ADD KEY `surat_qr_codes_surat_id_index` (`surat_id`);

--
-- Indeks untuk tabel `surat_templates`
--
ALTER TABLE `surat_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_templates_slug_unique` (`slug`),
  ADD KEY `surat_templates_jenis_surat_id_foreign` (`jenis_surat_id`),
  ADD KEY `surat_templates_created_by_foreign` (`created_by`),
  ADD KEY `surat_templates_updated_by_foreign` (`updated_by`);

--
-- Indeks untuk tabel `surat_template_placeholders`
--
ALTER TABLE `surat_template_placeholders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_template_placeholder_unique` (`surat_template_id`,`placeholder_key`);

--
-- Indeks untuk tabel `template_global_settings`
--
ALTER TABLE `template_global_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_global_settings_key_unique` (`key`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_program_studi_id_foreign` (`program_studi_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi_magangs`
--
ALTER TABLE `absensi_magangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_respons`
--
ALTER TABLE `detail_respons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenis_surats`
--
ALTER TABLE `jenis_surats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `jenis_surat_roles`
--
ALTER TABLE `jenis_surat_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `karir_alumnis`
--
ALTER TABLE `karir_alumnis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kuesioners`
--
ALTER TABLE `kuesioners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `logbook_magangs`
--
ALTER TABLE `logbook_magangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lowongan_infos`
--
ALTER TABLE `lowongan_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `nomor_surat_sequences`
--
ALTER TABLE `nomor_surat_sequences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembimbing_lapangans`
--
ALTER TABLE `pembimbing_lapangans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran_magangs`
--
ALTER TABLE `pendaftaran_magangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penilaian_magangs`
--
ALTER TABLE `penilaian_magangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pertanyaan_kuesioners`
--
ALTER TABLE `pertanyaan_kuesioners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `perusahaan_mitras`
--
ALTER TABLE `perusahaan_mitras`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pilihan_jawabans`
--
ALTER TABLE `pilihan_jawabans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `profil_alumnis`
--
ALTER TABLE `profil_alumnis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `program_studis`
--
ALTER TABLE `program_studis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `respons_kuesioners`
--
ALTER TABLE `respons_kuesioners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `surats`
--
ALTER TABLE `surats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT untuk tabel `surat_approval_flows`
--
ALTER TABLE `surat_approval_flows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `surat_categories`
--
ALTER TABLE `surat_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `surat_data`
--
ALTER TABLE `surat_data`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT untuk tabel `surat_histories`
--
ALTER TABLE `surat_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `surat_lampirans`
--
ALTER TABLE `surat_lampirans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `surat_qr_codes`
--
ALTER TABLE `surat_qr_codes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `surat_templates`
--
ALTER TABLE `surat_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `surat_template_placeholders`
--
ALTER TABLE `surat_template_placeholders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `template_global_settings`
--
ALTER TABLE `template_global_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensi_magangs`
--
ALTER TABLE `absensi_magangs`
  ADD CONSTRAINT `absensi_magangs_pendaftaran_id_foreign` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran_magangs` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_respons`
--
ALTER TABLE `detail_respons`
  ADD CONSTRAINT `detail_respons_pertanyaan_id_foreign` FOREIGN KEY (`pertanyaan_id`) REFERENCES `pertanyaan_kuesioners` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_respons_pilihan_id_foreign` FOREIGN KEY (`pilihan_id`) REFERENCES `pilihan_jawabans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `detail_respons_respons_id_foreign` FOREIGN KEY (`respons_id`) REFERENCES `respons_kuesioners` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jenis_surats`
--
ALTER TABLE `jenis_surats`
  ADD CONSTRAINT `jenis_surats_allowed_role_id_foreign` FOREIGN KEY (`allowed_role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `jenis_surats_approval_role_id_foreign` FOREIGN KEY (`approval_role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `jenis_surats_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `surat_categories` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `jenis_surat_roles`
--
ALTER TABLE `jenis_surat_roles`
  ADD CONSTRAINT `jenis_surat_roles_jenis_surat_id_foreign` FOREIGN KEY (`jenis_surat_id`) REFERENCES `jenis_surats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jenis_surat_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `karir_alumnis`
--
ALTER TABLE `karir_alumnis`
  ADD CONSTRAINT `karir_alumnis_alumni_id_foreign` FOREIGN KEY (`alumni_id`) REFERENCES `profil_alumnis` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kuesioners`
--
ALTER TABLE `kuesioners`
  ADD CONSTRAINT `kuesioners_pembuat_id_foreign` FOREIGN KEY (`pembuat_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `logbook_magangs`
--
ALTER TABLE `logbook_magangs`
  ADD CONSTRAINT `logbook_magangs_pendaftaran_id_foreign` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran_magangs` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `lowongan_infos`
--
ALTER TABLE `lowongan_infos`
  ADD CONSTRAINT `lowongan_infos_pembuat_id_foreign` FOREIGN KEY (`pembuat_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembimbing_lapangans`
--
ALTER TABLE `pembimbing_lapangans`
  ADD CONSTRAINT `pembimbing_lapangans_perusahaan_id_foreign` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan_mitras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembimbing_lapangans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pendaftaran_magangs`
--
ALTER TABLE `pendaftaran_magangs`
  ADD CONSTRAINT `pendaftaran_magangs_dosen_pembimbing_id_foreign` FOREIGN KEY (`dosen_pembimbing_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pendaftaran_magangs_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pendaftaran_magangs_pembimbing_lapangan_id_foreign` FOREIGN KEY (`pembimbing_lapangan_id`) REFERENCES `pembimbing_lapangans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pendaftaran_magangs_perusahaan_id_foreign` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan_mitras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pendaftaran_magangs_surat_tugas_id_foreign` FOREIGN KEY (`surat_tugas_id`) REFERENCES `surats` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `penilaian_magangs`
--
ALTER TABLE `penilaian_magangs`
  ADD CONSTRAINT `penilaian_magangs_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penilaian_magangs_pembimbing_lapangan_id_foreign` FOREIGN KEY (`pembimbing_lapangan_id`) REFERENCES `pembimbing_lapangans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penilaian_magangs_pendaftaran_id_foreign` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran_magangs` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pertanyaan_kuesioners`
--
ALTER TABLE `pertanyaan_kuesioners`
  ADD CONSTRAINT `pertanyaan_kuesioners_kuesioner_id_foreign` FOREIGN KEY (`kuesioner_id`) REFERENCES `kuesioners` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pilihan_jawabans`
--
ALTER TABLE `pilihan_jawabans`
  ADD CONSTRAINT `pilihan_jawabans_pertanyaan_id_foreign` FOREIGN KEY (`pertanyaan_id`) REFERENCES `pertanyaan_kuesioners` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `profil_alumnis`
--
ALTER TABLE `profil_alumnis`
  ADD CONSTRAINT `profil_alumnis_program_studi_id_foreign` FOREIGN KEY (`program_studi_id`) REFERENCES `program_studis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `profil_alumnis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `program_studis`
--
ALTER TABLE `program_studis`
  ADD CONSTRAINT `program_studis_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `respons_kuesioners`
--
ALTER TABLE `respons_kuesioners`
  ADD CONSTRAINT `respons_kuesioners_alumni_id_foreign` FOREIGN KEY (`alumni_id`) REFERENCES `profil_alumnis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `respons_kuesioners_kuesioner_id_foreign` FOREIGN KEY (`kuesioner_id`) REFERENCES `kuesioners` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surats`
--
ALTER TABLE `surats`
  ADD CONSTRAINT `surats_approved_by_id_foreign` FOREIGN KEY (`approved_by_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `surats_jenis_surat_id_foreign` FOREIGN KEY (`jenis_surat_id`) REFERENCES `jenis_surats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surats_pemohon_id_foreign` FOREIGN KEY (`pemohon_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surats_validated_by_admin_id_foreign` FOREIGN KEY (`validated_by_admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `surat_approval_flows`
--
ALTER TABLE `surat_approval_flows`
  ADD CONSTRAINT `surat_approval_flows_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surat_approval_flows_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_data`
--
ALTER TABLE `surat_data`
  ADD CONSTRAINT `surat_data_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_histories`
--
ALTER TABLE `surat_histories`
  ADD CONSTRAINT `surat_histories_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surat_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `surat_lampirans`
--
ALTER TABLE `surat_lampirans`
  ADD CONSTRAINT `surat_lampirans_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_qr_codes`
--
ALTER TABLE `surat_qr_codes`
  ADD CONSTRAINT `surat_qr_codes_revoked_by_foreign` FOREIGN KEY (`revoked_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `surat_qr_codes_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_templates`
--
ALTER TABLE `surat_templates`
  ADD CONSTRAINT `surat_templates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `surat_templates_jenis_surat_id_foreign` FOREIGN KEY (`jenis_surat_id`) REFERENCES `jenis_surats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surat_templates_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `surat_template_placeholders`
--
ALTER TABLE `surat_template_placeholders`
  ADD CONSTRAINT `surat_template_placeholders_surat_template_id_foreign` FOREIGN KEY (`surat_template_id`) REFERENCES `surat_templates` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_program_studi_id_foreign` FOREIGN KEY (`program_studi_id`) REFERENCES `program_studis` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
