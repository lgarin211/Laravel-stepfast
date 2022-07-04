-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 04, 2022 at 12:35 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_pak_miko`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_meteran_user`
--

CREATE TABLE `data_meteran_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `nomor_meteran` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meteran_awal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meteran_akhir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selisih_meteran_SE` int(11) DEFAULT NULL,
  `tgl_penetapan` date DEFAULT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `biyaya_meteran` int(11) DEFAULT NULL,
  `biyaya_denda` int(11) DEFAULT NULL,
  `total_harus_dibayarkan` int(11) DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masalah` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bukti_meteran_akhir` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_meteran_user`
--

INSERT INTO `data_meteran_user` (`id`, `nomor_meteran`, `meteran_awal`, `meteran_akhir`, `selisih_meteran_SE`, `tgl_penetapan`, `tgl_pembayaran`, `biyaya_meteran`, `biyaya_denda`, `total_harus_dibayarkan`, `keterangan`, `masalah`, `created_at`, `updated_at`, `bukti_meteran_akhir`, `id_user`) VALUES
(1, 'a23123', '0', '14', 14, '2022-07-02', '2022-07-04', 210000, 0, 210000, NULL, NULL, NULL, '2022-07-04 03:12:40', '/', 2),
(2, 'a23123', '14', '22', 0, '2022-07-02', '2022-07-02', 120000, 0, 120000, NULL, NULL, NULL, '2022-07-04 03:12:40', '/', 2),
(3, 'a23123', '22', '53', 0, '2022-07-02', '2022-07-04', 465000, 0, 465000, NULL, NULL, NULL, '2022-07-04 03:12:40', '/', 2);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'nomor_meteran', 'text', 'Nomor Meteran', 0, 1, 1, 0, 0, 1, '{}', 2),
(58, 7, 'meteran_awal', 'text', 'Meteran Awal', 0, 1, 1, 0, 0, 1, '{}', 3),
(59, 7, 'meteran_akhir', 'text', 'Meteran Akhir', 0, 1, 1, 0, 0, 1, '{}', 4),
(60, 7, 'selisih_meteran_SE', 'text', 'Selisih Meteran SE', 0, 1, 1, 0, 0, 1, '{}', 5),
(61, 7, 'tgl_penetapan', 'date', 'Tgl Penetapan', 0, 1, 1, 1, 1, 1, '{}', 6),
(62, 7, 'tgl_pembayaran', 'date', 'Tgl Pembayaran', 0, 1, 1, 0, 0, 1, '{}', 7),
(63, 7, 'biyaya_meteran', 'text', 'Biyaya Meteran', 0, 1, 1, 0, 0, 1, '{}', 8),
(64, 7, 'biyaya_denda', 'text', 'Biyaya Denda', 0, 1, 1, 0, 0, 1, '{}', 9),
(65, 7, 'total_harus_dibayarkan', 'text', 'Total Harus Dibayarkan', 0, 1, 1, 0, 0, 1, '{}', 10),
(66, 7, 'keterangan', 'rich_text_box', 'Keterangan', 0, 1, 1, 1, 0, 1, '{}', 11),
(67, 7, 'masalah', 'rich_text_box', 'Masalah', 0, 1, 1, 1, 0, 1, '{}', 12),
(68, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 13),
(69, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(70, 7, 'bukti_meteran_akhir', 'text', 'Bukti Meteran Akhir', 0, 1, 1, 0, 0, 1, '{}', 15),
(71, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 0, 1, '{}', 16),
(72, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(73, 8, 'tgl_mulai', 'date', 'Tgl Mulai', 0, 1, 1, 1, 1, 1, '{}', 2),
(74, 8, 'tgl_berakhir', 'date', 'Tgl Berakhir', 0, 1, 1, 1, 1, 1, '{}', 3),
(75, 8, 'rumus', 'text', 'Rumus', 0, 1, 1, 1, 1, 1, '{}', 4),
(76, 8, 'harga_per_qubik', 'number', 'Harga Per Qubik', 0, 1, 1, 1, 1, 1, '{}', 5),
(77, 8, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 6),
(78, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(79, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(80, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(81, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(82, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(7, 'data_meteran_user', 'data-meteran-user', 'Data Meteran User', 'Data Meteran Users', NULL, 'App\\DataMeteranUser', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-07-01 22:36:47', '2022-07-01 22:36:47'),
(8, 'rumus_meteran', 'rumus-meteran', 'Rumus Meteran', 'Rumus Meterans', NULL, 'App\\RumusMeteran', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-07-01 23:33:20', '2022-07-01 23:36:47'),
(9, 'meteranlist', 'meteranlist', 'Meteranlist', 'Meteranlists', NULL, 'App\\Meteranlist', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-07-04 02:50:04', '2022-07-04 02:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-06-28 20:46:57', '2022-06-28 20:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-06-28 20:46:57', '2022-06-28 20:46:57', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-06-28 20:46:57', '2022-06-28 20:46:57', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-06-28 20:46:57', '2022-06-28 20:46:57', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-06-28 20:46:57', '2022-06-28 20:46:57', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2022-06-28 20:46:57', '2022-06-28 20:46:57', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2022-06-28 20:46:57', '2022-06-28 20:46:57', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2022-06-28 20:46:57', '2022-06-28 20:46:57', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2022-06-28 20:46:57', '2022-06-28 20:46:57', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2022-06-28 20:46:57', '2022-06-28 20:46:57', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2022-06-28 20:46:57', '2022-06-28 20:46:57', 'voyager.settings.index', NULL),
(14, 1, 'Data Meteran Users', '', '_self', NULL, NULL, NULL, 15, '2022-07-01 22:36:48', '2022-07-01 22:36:48', 'voyager.data-meteran-user.index', NULL),
(15, 1, 'Rumus Meterans', '', '_self', NULL, NULL, NULL, 16, '2022-07-01 23:33:20', '2022-07-01 23:33:20', 'voyager.rumus-meteran.index', NULL),
(16, 1, 'Meteranlists', '', '_self', NULL, NULL, NULL, 17, '2022-07-04 02:50:04', '2022-07-04 02:50:04', 'voyager.meteranlist.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meteranlist`
--

CREATE TABLE `meteranlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meteran_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_meteran` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meteranlist`
--

INSERT INTO `meteranlist` (`id`, `user_id`, `meteran_no`, `alamat_meteran`, `created_at`, `updated_at`) VALUES
(1, '2', 'a1234', 'Tajur kota Bogor', '2022-07-04 09:52:15', '2022-07-04 09:52:15'),
(2, '2', 'a23123', 'Tajur kota Bogor', '2022-07-04 09:52:15', '2022-07-04 09:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_03_30_203216_create_products_table', 1),
(6, '2016_01_01_000000_add_voyager_user_fields', 2),
(7, '2016_01_01_000000_create_data_types_table', 2),
(8, '2016_05_19_173453_create_menu_table', 2),
(9, '2016_10_21_190000_create_roles_table', 2),
(10, '2016_10_21_190000_create_settings_table', 2),
(11, '2016_11_30_135954_create_permission_table', 2),
(12, '2016_11_30_141208_create_permission_role_table', 2),
(13, '2016_12_26_201236_data_types__add__server_side', 2),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(15, '2017_01_14_005015_create_translations_table', 2),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(18, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(19, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(20, '2017_08_05_000000_add_group_to_settings_table', 2),
(21, '2017_11_26_013050_add_user_role_relationship', 2),
(22, '2017_11_26_015000_create_user_roles_table', 2),
(23, '2018_03_11_000000_add_user_settings', 2),
(24, '2018_03_14_000000_add_details_to_data_types_table', 2),
(25, '2018_03_16_000000_make_settings_value_nullable', 2),
(26, '2022_06_27_160759_create_tagihans_table', 2),
(27, '2016_01_01_000000_create_pages_table', 3),
(28, '2016_01_01_000000_create_posts_table', 3),
(29, '2016_02_15_204651_create_categories_table', 3),
(30, '2017_04_11_000000_alter_post_nullable_fields_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(2, 'browse_bread', NULL, '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(3, 'browse_database', NULL, '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(4, 'browse_media', NULL, '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(5, 'browse_compass', NULL, '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(6, 'browse_menus', 'menus', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(7, 'read_menus', 'menus', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(8, 'edit_menus', 'menus', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(9, 'add_menus', 'menus', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(10, 'delete_menus', 'menus', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(11, 'browse_roles', 'roles', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(12, 'read_roles', 'roles', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(13, 'edit_roles', 'roles', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(14, 'add_roles', 'roles', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(15, 'delete_roles', 'roles', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(16, 'browse_users', 'users', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(17, 'read_users', 'users', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(18, 'edit_users', 'users', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(19, 'add_users', 'users', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(20, 'delete_users', 'users', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(21, 'browse_settings', 'settings', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(22, 'read_settings', 'settings', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(23, 'edit_settings', 'settings', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(24, 'add_settings', 'settings', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(25, 'delete_settings', 'settings', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(41, 'browse_data_meteran_user', 'data_meteran_user', '2022-07-01 22:36:48', '2022-07-01 22:36:48'),
(42, 'read_data_meteran_user', 'data_meteran_user', '2022-07-01 22:36:48', '2022-07-01 22:36:48'),
(43, 'edit_data_meteran_user', 'data_meteran_user', '2022-07-01 22:36:48', '2022-07-01 22:36:48'),
(44, 'add_data_meteran_user', 'data_meteran_user', '2022-07-01 22:36:48', '2022-07-01 22:36:48'),
(45, 'delete_data_meteran_user', 'data_meteran_user', '2022-07-01 22:36:48', '2022-07-01 22:36:48'),
(46, 'browse_rumus_meteran', 'rumus_meteran', '2022-07-01 23:33:20', '2022-07-01 23:33:20'),
(47, 'read_rumus_meteran', 'rumus_meteran', '2022-07-01 23:33:20', '2022-07-01 23:33:20'),
(48, 'edit_rumus_meteran', 'rumus_meteran', '2022-07-01 23:33:20', '2022-07-01 23:33:20'),
(49, 'add_rumus_meteran', 'rumus_meteran', '2022-07-01 23:33:20', '2022-07-01 23:33:20'),
(50, 'delete_rumus_meteran', 'rumus_meteran', '2022-07-01 23:33:20', '2022-07-01 23:33:20'),
(51, 'browse_meteranlist', 'meteranlist', '2022-07-04 02:50:04', '2022-07-04 02:50:04'),
(52, 'read_meteranlist', 'meteranlist', '2022-07-04 02:50:04', '2022-07-04 02:50:04'),
(53, 'edit_meteranlist', 'meteranlist', '2022-07-04 02:50:04', '2022-07-04 02:50:04'),
(54, 'add_meteranlist', 'meteranlist', '2022-07-04 02:50:04', '2022-07-04 02:50:04'),
(55, 'delete_meteranlist', 'meteranlist', '2022-07-04 02:50:04', '2022-07-04 02:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'myapptoken', 'ab7a949925e68e80c9b97338091e17c499369ad54337167399c20c4c4212d693', '[\"*\"]', '2022-06-27 01:48:48', '2022-06-27 01:43:19', '2022-06-27 01:48:48'),
(2, 'App\\Models\\User', 1, 'myapptoken', '27b710392e94eb93f3eb44eacc7c6f0447c42afdf5b8b76682d3181b7a6ba890', '[\"*\"]', NULL, '2022-06-27 01:52:26', '2022-06-27 01:52:26'),
(3, 'App\\Models\\User', 3, 'myapptoken', '64472b3f615d4a0be69b7a87e4939a5c63866f14ff54d5be238d869a53cabefa', '[\"*\"]', NULL, '2022-06-28 23:33:50', '2022-06-28 23:33:50'),
(4, 'App\\Models\\User', 1, 'myapptoken', '5928447a5a117865f54fbd06637eef54163c0db3907ce7bdf3e3015b1310bc9c', '[\"*\"]', NULL, '2022-07-04 03:00:59', '2022-07-04 03:00:59'),
(5, 'App\\Models\\User', 1, 'myapptoken', 'ac6edf8d1a4343988d1fdbcd93401bb2ee22f2a233f68d8a7a50101a7383d15e', '[\"*\"]', '2022-07-04 03:24:37', '2022-07-04 03:04:50', '2022-07-04 03:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Lumen', 'inpon', NULL, '195.00', '2022-06-27 01:48:48', '2022-06-27 01:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-06-28 20:46:57', '2022-06-28 20:46:57'),
(2, 'user', 'Normal User', '2022-06-28 20:46:57', '2022-06-28 20:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `rumus_meteran`
--

CREATE TABLE `rumus_meteran` (
  `id` int(10) UNSIGNED NOT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_berakhir` date DEFAULT NULL,
  `rumus` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_per_qubik` int(11) DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rumus_meteran`
--

INSERT INTO `rumus_meteran` (`id`, `tgl_mulai`, `tgl_berakhir`, `rumus`, `harga_per_qubik`, `status`, `created_at`, `updated_at`) VALUES
(1, '2022-07-01', '2022-07-03', '1 qubik 15000', 15000, 'active', '2022-07-01 23:37:00', '2022-07-04 02:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'KSM', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'TEMPAT TRANSAKSI', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/June2022/oXQD0wukaTWBLyq12Ay6.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/June2022/xDOBl4KlaR077EohBIIr.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'ADMIN', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'ADMIN APLIKASI PEMBAYARAN', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings/June2022/rgPqW3mMw9lANKCOgcsU.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/June2022/f9wqGfzpbGEAV5QFvpIa.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tagihans`
--

CREATE TABLE `tagihans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-06-28 20:46:58', '2022-06-28 20:46:58'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-06-28 20:46:59', '2022-06-28 20:46:59'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-06-28 20:46:59', '2022-06-28 20:46:59'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-06-28 20:46:59', '2022-06-28 20:46:59'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-06-28 20:46:59', '2022-06-28 20:46:59'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-06-28 20:46:59', '2022-06-28 20:46:59'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-06-28 20:46:59', '2022-06-28 20:46:59'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-06-28 20:46:59', '2022-06-28 20:46:59'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-06-28 20:46:59', '2022-06-28 20:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 2, 'lgarin211', 'a@a.com', 'users/default.png', NULL, '$2y$10$48Lhvwq.YXJrG1/wuZdjouADnIXsflwSvNNuwUdXCV4yxpnXr3MkO', NULL, NULL, '2022-06-27 01:43:19', '2022-06-27 01:43:19'),
(2, 1, 'b', 'b@b.com', 'users/default.png', NULL, '$2y$10$qlnmO6QAbGcYfkyh/JkA1OeCg.TzIKZm0ajjGURgNstxIhydyisfa', NULL, NULL, '2022-06-28 20:54:53', '2022-06-28 20:54:53'),
(3, 2, 'lgarin211', 'c@c.com', 'users/default.png', NULL, '$2y$10$.ifGdqL1AlwiRZxha6vTr.bGz5lKIxZ..C0swRz81uedri6AJZFOi', NULL, NULL, '2022-06-28 23:33:50', '2022-06-28 23:33:50');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_meteran_user`
--
ALTER TABLE `data_meteran_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `meteranlist`
--
ALTER TABLE `meteranlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `rumus_meteran`
--
ALTER TABLE `rumus_meteran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `tagihans`
--
ALTER TABLE `tagihans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_meteran_user`
--
ALTER TABLE `data_meteran_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `meteranlist`
--
ALTER TABLE `meteranlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rumus_meteran`
--
ALTER TABLE `rumus_meteran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tagihans`
--
ALTER TABLE `tagihans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
