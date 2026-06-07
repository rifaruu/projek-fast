-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2026 at 09:33 AM
-- Server version: 8.4.3
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portal-fmikom`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_magangs`
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
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_respons`
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
-- Table structure for table `failed_jobs`
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
-- Table structure for table `fakultas`
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
-- Table structure for table `jenis_surats`
--

CREATE TABLE `jenis_surats` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_klasifikasi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `jenis_surat_roles`
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
-- Table structure for table `jobs`
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
-- Table structure for table `job_batches`
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
-- Table structure for table `karir_alumnis`
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
-- Table structure for table `kuesioners`
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
-- Table structure for table `logbook_magangs`
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
-- Table structure for table `lowongan_infos`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
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
(43, '2026_05_03_000001_enhance_surat_system', 14),
(44, '2026_05_21_141205_add_generated_by_and_qr_validated_at_to_surats_table', 15),
(45, '2026_06_05_000000_add_indexes_to_surats_table', 15),
(46, '2026_06_05_000000_remove_super_admin_and_user_roles', 15),
(47, '2026_06_05_100000_seed_role_accounts', 15),
(48, '2026_06_06_180000_add_kode_klasifikasi_to_jenis_surats_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `nomor_surat_sequences`
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

--
-- Dumping data for table `nomor_surat_sequences`
--

INSERT INTO `nomor_surat_sequences` (`id`, `kode_surat`, `tahun`, `bulan`, `urutan`, `created_at`, `updated_at`) VALUES
(1, 'FAKULTAS-2026', 2026, 0, 24, '2026-06-06 04:10:27', '2026-06-07 09:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('muchlisinmaruf@gmail.com', '$2y$12$HV9sEnOHXdFBzBUffbISwuXVa2VHXeovZmgdJs1wFWRtymE.sKsJS', '2026-03-29 15:11:55'),
('tiffanyhellen27@gmail.com', '$2y$12$BydpmQHppo7K8kWVv1wlYeQXW/2LpHVWT1YapiSdfa5SaYmNXnXYa', '2026-04-08 08:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `pembimbing_lapangans`
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
-- Table structure for table `pendaftaran_magangs`
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
-- Table structure for table `penilaian_magangs`
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
-- Table structure for table `pertanyaan_kuesioners`
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
-- Table structure for table `perusahaan_mitras`
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
-- Table structure for table `pilihan_jawabans`
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
-- Table structure for table `profil_alumnis`
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
-- Table structure for table `program_studis`
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
-- Table structure for table `respons_kuesioners`
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
-- Table structure for table `roles`
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
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nama`, `slug`, `deskripsi`, `created_at`, `updated_at`) VALUES
(3, 'Mahasiswa', 'mahasiswa', 'Pengguna mahasiswa untuk layanan akademik FAST.', '2026-04-18 04:24:26', '2026-04-18 04:24:26'),
(4, 'Dosen', 'dosen', 'Pengguna dosen untuk layanan akademik FAST.', '2026-04-18 04:24:26', '2026-04-18 04:24:26'),
(5, 'Admin', 'admin', 'Pengelola validasi administrasi surat FAST.', '2026-04-18 04:24:26', '2026-04-18 04:24:26'),
(6, 'Kaprodi', 'kaprodi', 'Pemberi persetujuan surat tingkat program studi.', '2026-04-22 17:06:37', '2026-04-22 17:06:37'),
(7, 'Dekan', 'dekan', 'Pemberi persetujuan surat tingkat fakultas.', '2026-04-22 17:06:37', '2026-04-22 17:06:37');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('otZ68116UEwamMF0Pc3XslmbbfTsZZxlQViKpBf6', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNUxRczBWMU5QWFhtZEp0OXoxQnFxeE1qVm5RTUJtVndPeEVINlpNcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi90ZW1wbGF0ZXMvMTIvcHJldmlldyI7czo1OiJyb3V0ZSI7czoyMzoiYWRtaW4udGVtcGxhdGVzLnByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1O3M6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zZXR0aW5ncy9zZWN1cml0eSI7fX0=', 1777883984);

-- --------------------------------------------------------

--
-- Table structure for table `surats`
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
  `generated_by` bigint UNSIGNED DEFAULT NULL,
  `qr_validated_at` timestamp NULL DEFAULT NULL COMMENT 'Waktu pertama kali QR di-scan dan surat sudah divalidasi',
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

-- --------------------------------------------------------

--
-- Table structure for table `surat_approval_flows`
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

-- --------------------------------------------------------

--
-- Table structure for table `surat_categories`
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
-- Dumping data for table `surat_categories`
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
-- Table structure for table `surat_data`
--

CREATE TABLE `surat_data` (
  `id` bigint UNSIGNED NOT NULL,
  `surat_id` bigint UNSIGNED NOT NULL,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_histories`
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

-- --------------------------------------------------------

--
-- Table structure for table `surat_lampirans`
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
-- Table structure for table `surat_qr_codes`
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
-- Table structure for table `surat_templates`
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

-- --------------------------------------------------------

--
-- Table structure for table `surat_template_placeholders`
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
-- Table structure for table `template_global_settings`
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
-- Dumping data for table `template_global_settings`
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
(13, 'format_nomor', 'B/Ybk.041.10', 'text', 'Format Nomor Surat', NULL, '2026-05-02 22:06:19', '2026-06-06 04:09:04'),
(14, 'kode_prefix_nomor_surat', 'B', 'text', 'Prefix Nomor Surat', NULL, '2026-06-06 04:04:16', '2026-06-06 04:04:16'),
(15, 'kode_fakultas_nomor_surat', 'Ybk.041.10', 'text', 'Kode Fakultas Nomor Surat', NULL, '2026-06-06 04:04:16', '2026-06-06 04:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `nomor_induk`, `status_approval`, `email_verified_at`, `password`, `otp_code`, `otp_expires_at`, `password_changed_at`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`, `role_id`, `program_studi_id`, `nim_nip`, `no_telepon`, `foto_path`, `is_active`) VALUES
(1, 'Muchlisin Maruf', 'muchlisinmaruf@gmail.com', NULL, 'approved', '2026-03-29 13:45:30', '$2y$12$7dVeo0mbJITCFTuEF51VoOzrZADBo16Pr0NKszt/rHCfeTQWIN.1e', NULL, NULL, '2026-03-29 13:57:07', NULL, NULL, NULL, NULL, '2026-03-29 13:23:50', '2026-03-29 13:57:07', 5, NULL, NULL, NULL, NULL, 1),
(2, 'Dummy Pelajar', 'mahasiswa@example.com', NULL, 'approved', NULL, '$2y$12$/0u391PgODpjbB2hikSzMuRr8FuOkjegffWWE508W6uTIeQgcN3n2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29 13:23:51', '2026-03-29 13:23:55', 3, NULL, NULL, NULL, NULL, 1),
(3, 'Maruf Muchlisin', 'cahwangon27112003@gmail.com', '22eo10013', 'pending', NULL, '$2y$12$pTB6zUDqA7NvUZk0qp/o0.Bi4PYI9qqusho8spU.D4hHIXcrvDF2.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29 14:50:10', '2026-03-29 14:50:10', 3, NULL, NULL, NULL, NULL, 1),
(5, 'Admin', 'tiffanyhellen27@gmail.com', NULL, 'approved', '2026-06-06 04:28:49', '$2y$12$/Bz6IDi/4swjM2odIAsL7uA4K7RmJ1er/XMjEUfVMrBqbMWacwRF6', NULL, NULL, NULL, NULL, NULL, NULL, 'mqMwus28XHutzOpZGeBZboUDX2B0b4WukFwv7iqcCkpIv7i3XeyaO1XV2pCt', '2026-06-06 04:28:49', '2026-06-06 04:28:49', 5, NULL, NULL, NULL, NULL, 1),
(6, 'Test User', 'test@example.com', '20210045', 'approved', '2026-04-27 09:33:20', '$2y$12$UgR52kLlAsSKB5yyxUy6ie6WMDQ/E1Cd3yM5ez5ARSoOq1MDxO1ju', NULL, NULL, NULL, NULL, NULL, NULL, 'LtWlUGyiTM', '2026-04-18 04:27:39', '2026-04-27 09:33:20', 3, NULL, '20210045', NULL, NULL, 1),
(8, 'Fanny', 'hellentiffanyyy@gmail.com', NULL, 'approved', '2026-06-06 04:28:49', '$2y$12$CqwQU0MgeHxrxk0M1Ty/Ku/LXwLH.YgmOVS7o.fsAxUj3WrJABPm.', NULL, NULL, NULL, NULL, NULL, NULL, 'IYZVviGK4Bl4FLUkkzMRr93p5hJZjPstPrGMcIfoqTEgaTzih9xGLRmKCRUZ', '2026-06-06 04:28:49', '2026-06-06 04:28:49', 3, NULL, '22eo10001', NULL, NULL, 1),
(9, 'Mrs. Laora', 'hellenfast1@gmail.com', NULL, 'approved', '2026-06-06 04:28:50', '$2y$12$qR2jkhmWyuZ2pnfjXbU4kePrBB.pRuuGbM/.6wQU7GFy03zXQS0i2', NULL, NULL, NULL, NULL, NULL, NULL, 'i40JEsI7o0SfjkV0ipJwceH3G9Q6QB50aTA5XhvxyxT2PIXUva9F5UTNP3dT', '2026-06-06 04:28:50', '2026-06-06 04:28:50', 4, NULL, NULL, NULL, NULL, 1),
(10, 'Mrs. Anna', 'hellenfast2@gmail.com', NULL, 'approved', '2026-06-06 04:28:50', '$2y$12$nQmd82fi.jv4utNYmm26SOcBAeGMLHiKSnpKEnTTvE/eZYbwkl6mO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-06 04:28:50', '2026-06-06 04:28:50', 6, NULL, NULL, NULL, NULL, 1),
(11, 'Mrs. Moana', 'hellenfast3@gmail.com', NULL, 'approved', '2026-06-06 04:28:50', '$2y$12$Sn/Liwqvikj.SBDm2jk1yO55.kZBVYwXhcL4PdiZYnG9fPw6Su0ue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-06 04:28:50', '2026-06-06 04:28:50', 7, NULL, NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi_magangs`
--
ALTER TABLE `absensi_magangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absensi_magangs_pendaftaran_id_foreign` (`pendaftaran_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `detail_respons`
--
ALTER TABLE `detail_respons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_respons_respons_id_foreign` (`respons_id`),
  ADD KEY `detail_respons_pertanyaan_id_foreign` (`pertanyaan_id`),
  ADD KEY `detail_respons_pilihan_id_foreign` (`pilihan_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fakultas_kode_unique` (`kode`);

--
-- Indexes for table `jenis_surats`
--
ALTER TABLE `jenis_surats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenis_surats_allowed_role_id_foreign` (`allowed_role_id`),
  ADD KEY `jenis_surats_approval_role_id_foreign` (`approval_role_id`),
  ADD KEY `jenis_surats_category_id_foreign` (`category_id`);

--
-- Indexes for table `jenis_surat_roles`
--
ALTER TABLE `jenis_surat_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jenis_surat_roles_jenis_surat_id_role_id_unique` (`jenis_surat_id`,`role_id`),
  ADD KEY `jenis_surat_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_available_at_index` (`queue`,`reserved_at`,`available_at`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karir_alumnis`
--
ALTER TABLE `karir_alumnis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `karir_alumnis_alumni_id_foreign` (`alumni_id`);

--
-- Indexes for table `kuesioners`
--
ALTER TABLE `kuesioners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kuesioners_pembuat_id_foreign` (`pembuat_id`);

--
-- Indexes for table `logbook_magangs`
--
ALTER TABLE `logbook_magangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logbook_magangs_pendaftaran_id_foreign` (`pendaftaran_id`);

--
-- Indexes for table `lowongan_infos`
--
ALTER TABLE `lowongan_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lowongan_infos_pembuat_id_foreign` (`pembuat_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nomor_surat_sequences`
--
ALTER TABLE `nomor_surat_sequences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_surat_sequences_kode_surat_tahun_bulan_unique` (`kode_surat`,`tahun`,`bulan`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pembimbing_lapangans`
--
ALTER TABLE `pembimbing_lapangans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembimbing_lapangans_user_id_foreign` (`user_id`),
  ADD KEY `pembimbing_lapangans_perusahaan_id_foreign` (`perusahaan_id`);

--
-- Indexes for table `pendaftaran_magangs`
--
ALTER TABLE `pendaftaran_magangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pendaftaran_magangs_mahasiswa_id_foreign` (`mahasiswa_id`),
  ADD KEY `pendaftaran_magangs_perusahaan_id_foreign` (`perusahaan_id`),
  ADD KEY `pendaftaran_magangs_dosen_pembimbing_id_foreign` (`dosen_pembimbing_id`),
  ADD KEY `pendaftaran_magangs_pembimbing_lapangan_id_foreign` (`pembimbing_lapangan_id`),
  ADD KEY `pendaftaran_magangs_surat_tugas_id_foreign` (`surat_tugas_id`);

--
-- Indexes for table `penilaian_magangs`
--
ALTER TABLE `penilaian_magangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penilaian_magangs_pendaftaran_id_foreign` (`pendaftaran_id`),
  ADD KEY `penilaian_magangs_dosen_id_foreign` (`dosen_id`),
  ADD KEY `penilaian_magangs_pembimbing_lapangan_id_foreign` (`pembimbing_lapangan_id`);

--
-- Indexes for table `pertanyaan_kuesioners`
--
ALTER TABLE `pertanyaan_kuesioners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pertanyaan_kuesioners_kuesioner_id_foreign` (`kuesioner_id`);

--
-- Indexes for table `perusahaan_mitras`
--
ALTER TABLE `perusahaan_mitras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pilihan_jawabans`
--
ALTER TABLE `pilihan_jawabans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pilihan_jawabans_pertanyaan_id_foreign` (`pertanyaan_id`);

--
-- Indexes for table `profil_alumnis`
--
ALTER TABLE `profil_alumnis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profil_alumnis_nim_unique` (`nim`),
  ADD KEY `profil_alumnis_user_id_foreign` (`user_id`),
  ADD KEY `profil_alumnis_program_studi_id_foreign` (`program_studi_id`);

--
-- Indexes for table `program_studis`
--
ALTER TABLE `program_studis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `program_studis_kode_unique` (`kode`),
  ADD KEY `program_studis_fakultas_id_foreign` (`fakultas_id`);

--
-- Indexes for table `respons_kuesioners`
--
ALTER TABLE `respons_kuesioners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `respons_kuesioners_kuesioner_id_foreign` (`kuesioner_id`),
  ADD KEY `respons_kuesioners_alumni_id_foreign` (`alumni_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `surats`
--
ALTER TABLE `surats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surats_qr_token_unique` (`qr_token`),
  ADD KEY `surats_jenis_surat_id_foreign` (`jenis_surat_id`),
  ADD KEY `surats_pemohon_id_foreign` (`pemohon_id`),
  ADD KEY `surats_validated_by_admin_id_foreign` (`validated_by_admin_id`),
  ADD KEY `surats_approved_by_id_foreign` (`approved_by_id`),
  ADD KEY `surats_generated_by_foreign` (`generated_by`),
  ADD KEY `surats_status_index` (`status`),
  ADD KEY `surats_tanggal_pengajuan_index` (`tanggal_pengajuan`);

--
-- Indexes for table `surat_approval_flows`
--
ALTER TABLE `surat_approval_flows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_approval_flows_surat_id_foreign` (`surat_id`),
  ADD KEY `surat_approval_flows_approver_id_foreign` (`approver_id`);

--
-- Indexes for table `surat_categories`
--
ALTER TABLE `surat_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_categories_slug_unique` (`slug`);

--
-- Indexes for table `surat_data`
--
ALTER TABLE `surat_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_data_surat_id_field_name_unique` (`surat_id`,`field_name`);

--
-- Indexes for table `surat_histories`
--
ALTER TABLE `surat_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_histories_surat_id_created_at_index` (`surat_id`,`created_at`),
  ADD KEY `surat_histories_user_id_index` (`user_id`);

--
-- Indexes for table `surat_lampirans`
--
ALTER TABLE `surat_lampirans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_lampirans_surat_id_foreign` (`surat_id`);

--
-- Indexes for table `surat_qr_codes`
--
ALTER TABLE `surat_qr_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_qr_codes_token_unique` (`token`),
  ADD KEY `surat_qr_codes_revoked_by_foreign` (`revoked_by`),
  ADD KEY `surat_qr_codes_token_status_index` (`token`,`status`),
  ADD KEY `surat_qr_codes_surat_id_index` (`surat_id`);

--
-- Indexes for table `surat_templates`
--
ALTER TABLE `surat_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_templates_slug_unique` (`slug`),
  ADD KEY `surat_templates_jenis_surat_id_foreign` (`jenis_surat_id`),
  ADD KEY `surat_templates_created_by_foreign` (`created_by`),
  ADD KEY `surat_templates_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `surat_template_placeholders`
--
ALTER TABLE `surat_template_placeholders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_template_placeholder_unique` (`surat_template_id`,`placeholder_key`);

--
-- Indexes for table `template_global_settings`
--
ALTER TABLE `template_global_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_global_settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_program_studi_id_foreign` (`program_studi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi_magangs`
--
ALTER TABLE `absensi_magangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_respons`
--
ALTER TABLE `detail_respons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_surats`
--
ALTER TABLE `jenis_surats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jenis_surat_roles`
--
ALTER TABLE `jenis_surat_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karir_alumnis`
--
ALTER TABLE `karir_alumnis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kuesioners`
--
ALTER TABLE `kuesioners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logbook_magangs`
--
ALTER TABLE `logbook_magangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lowongan_infos`
--
ALTER TABLE `lowongan_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `nomor_surat_sequences`
--
ALTER TABLE `nomor_surat_sequences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembimbing_lapangans`
--
ALTER TABLE `pembimbing_lapangans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pendaftaran_magangs`
--
ALTER TABLE `pendaftaran_magangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penilaian_magangs`
--
ALTER TABLE `penilaian_magangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pertanyaan_kuesioners`
--
ALTER TABLE `pertanyaan_kuesioners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perusahaan_mitras`
--
ALTER TABLE `perusahaan_mitras`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pilihan_jawabans`
--
ALTER TABLE `pilihan_jawabans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profil_alumnis`
--
ALTER TABLE `profil_alumnis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_studis`
--
ALTER TABLE `program_studis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `respons_kuesioners`
--
ALTER TABLE `respons_kuesioners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `surats`
--
ALTER TABLE `surats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `surat_approval_flows`
--
ALTER TABLE `surat_approval_flows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `surat_categories`
--
ALTER TABLE `surat_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `surat_data`
--
ALTER TABLE `surat_data`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=585;

--
-- AUTO_INCREMENT for table `surat_histories`
--
ALTER TABLE `surat_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `surat_lampirans`
--
ALTER TABLE `surat_lampirans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `surat_qr_codes`
--
ALTER TABLE `surat_qr_codes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_templates`
--
ALTER TABLE `surat_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `surat_template_placeholders`
--
ALTER TABLE `surat_template_placeholders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `template_global_settings`
--
ALTER TABLE `template_global_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi_magangs`
--
ALTER TABLE `absensi_magangs`
  ADD CONSTRAINT `absensi_magangs_pendaftaran_id_foreign` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran_magangs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_respons`
--
ALTER TABLE `detail_respons`
  ADD CONSTRAINT `detail_respons_pertanyaan_id_foreign` FOREIGN KEY (`pertanyaan_id`) REFERENCES `pertanyaan_kuesioners` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_respons_pilihan_id_foreign` FOREIGN KEY (`pilihan_id`) REFERENCES `pilihan_jawabans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `detail_respons_respons_id_foreign` FOREIGN KEY (`respons_id`) REFERENCES `respons_kuesioners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jenis_surats`
--
ALTER TABLE `jenis_surats`
  ADD CONSTRAINT `jenis_surats_allowed_role_id_foreign` FOREIGN KEY (`allowed_role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `jenis_surats_approval_role_id_foreign` FOREIGN KEY (`approval_role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `jenis_surats_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `surat_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `jenis_surat_roles`
--
ALTER TABLE `jenis_surat_roles`
  ADD CONSTRAINT `jenis_surat_roles_jenis_surat_id_foreign` FOREIGN KEY (`jenis_surat_id`) REFERENCES `jenis_surats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jenis_surat_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `karir_alumnis`
--
ALTER TABLE `karir_alumnis`
  ADD CONSTRAINT `karir_alumnis_alumni_id_foreign` FOREIGN KEY (`alumni_id`) REFERENCES `profil_alumnis` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kuesioners`
--
ALTER TABLE `kuesioners`
  ADD CONSTRAINT `kuesioners_pembuat_id_foreign` FOREIGN KEY (`pembuat_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `logbook_magangs`
--
ALTER TABLE `logbook_magangs`
  ADD CONSTRAINT `logbook_magangs_pendaftaran_id_foreign` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran_magangs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lowongan_infos`
--
ALTER TABLE `lowongan_infos`
  ADD CONSTRAINT `lowongan_infos_pembuat_id_foreign` FOREIGN KEY (`pembuat_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pembimbing_lapangans`
--
ALTER TABLE `pembimbing_lapangans`
  ADD CONSTRAINT `pembimbing_lapangans_perusahaan_id_foreign` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan_mitras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembimbing_lapangans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pendaftaran_magangs`
--
ALTER TABLE `pendaftaran_magangs`
  ADD CONSTRAINT `pendaftaran_magangs_dosen_pembimbing_id_foreign` FOREIGN KEY (`dosen_pembimbing_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pendaftaran_magangs_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pendaftaran_magangs_pembimbing_lapangan_id_foreign` FOREIGN KEY (`pembimbing_lapangan_id`) REFERENCES `pembimbing_lapangans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pendaftaran_magangs_perusahaan_id_foreign` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan_mitras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pendaftaran_magangs_surat_tugas_id_foreign` FOREIGN KEY (`surat_tugas_id`) REFERENCES `surats` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penilaian_magangs`
--
ALTER TABLE `penilaian_magangs`
  ADD CONSTRAINT `penilaian_magangs_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penilaian_magangs_pembimbing_lapangan_id_foreign` FOREIGN KEY (`pembimbing_lapangan_id`) REFERENCES `pembimbing_lapangans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penilaian_magangs_pendaftaran_id_foreign` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran_magangs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pertanyaan_kuesioners`
--
ALTER TABLE `pertanyaan_kuesioners`
  ADD CONSTRAINT `pertanyaan_kuesioners_kuesioner_id_foreign` FOREIGN KEY (`kuesioner_id`) REFERENCES `kuesioners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pilihan_jawabans`
--
ALTER TABLE `pilihan_jawabans`
  ADD CONSTRAINT `pilihan_jawabans_pertanyaan_id_foreign` FOREIGN KEY (`pertanyaan_id`) REFERENCES `pertanyaan_kuesioners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profil_alumnis`
--
ALTER TABLE `profil_alumnis`
  ADD CONSTRAINT `profil_alumnis_program_studi_id_foreign` FOREIGN KEY (`program_studi_id`) REFERENCES `program_studis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `profil_alumnis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `program_studis`
--
ALTER TABLE `program_studis`
  ADD CONSTRAINT `program_studis_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `respons_kuesioners`
--
ALTER TABLE `respons_kuesioners`
  ADD CONSTRAINT `respons_kuesioners_alumni_id_foreign` FOREIGN KEY (`alumni_id`) REFERENCES `profil_alumnis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `respons_kuesioners_kuesioner_id_foreign` FOREIGN KEY (`kuesioner_id`) REFERENCES `kuesioners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `surats`
--
ALTER TABLE `surats`
  ADD CONSTRAINT `surats_approved_by_id_foreign` FOREIGN KEY (`approved_by_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `surats_generated_by_foreign` FOREIGN KEY (`generated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `surats_jenis_surat_id_foreign` FOREIGN KEY (`jenis_surat_id`) REFERENCES `jenis_surats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surats_pemohon_id_foreign` FOREIGN KEY (`pemohon_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surats_validated_by_admin_id_foreign` FOREIGN KEY (`validated_by_admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `surat_approval_flows`
--
ALTER TABLE `surat_approval_flows`
  ADD CONSTRAINT `surat_approval_flows_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surat_approval_flows_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `surat_data`
--
ALTER TABLE `surat_data`
  ADD CONSTRAINT `surat_data_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `surat_histories`
--
ALTER TABLE `surat_histories`
  ADD CONSTRAINT `surat_histories_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surat_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `surat_lampirans`
--
ALTER TABLE `surat_lampirans`
  ADD CONSTRAINT `surat_lampirans_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `surat_qr_codes`
--
ALTER TABLE `surat_qr_codes`
  ADD CONSTRAINT `surat_qr_codes_revoked_by_foreign` FOREIGN KEY (`revoked_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `surat_qr_codes_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `surat_templates`
--
ALTER TABLE `surat_templates`
  ADD CONSTRAINT `surat_templates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `surat_templates_jenis_surat_id_foreign` FOREIGN KEY (`jenis_surat_id`) REFERENCES `jenis_surats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surat_templates_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `surat_template_placeholders`
--
ALTER TABLE `surat_template_placeholders`
  ADD CONSTRAINT `surat_template_placeholders_surat_template_id_foreign` FOREIGN KEY (`surat_template_id`) REFERENCES `surat_templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_program_studi_id_foreign` FOREIGN KEY (`program_studi_id`) REFERENCES `program_studis` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
