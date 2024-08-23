-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 23, 2024 lúc 01:41 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `pharmacyshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluanthuoc`
--

CREATE TABLE `binhluanthuoc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thuoc_id` bigint(20) UNSIGNED NOT NULL,
  `nguoidung_id` bigint(20) UNSIGNED NOT NULL,
  `noidungbinhluan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluanthuoc`
--

INSERT INTO `binhluanthuoc` (`id`, `thuoc_id`, `nguoidung_id`, `noidungbinhluan`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Sản phẩm này Oke', '2024-05-01 10:27:27', '2024-05-03 06:37:27'),
(3, 39, 2, 'Sản phẩm này dùng oke lắm', '2024-05-04 03:26:55', '2024-05-04 03:26:55'),
(4, 39, 2, 'Sản phẩm tuyệt vời', '2024-05-04 03:27:16', '2024-05-04 03:27:16'),
(5, 38, 2, 'Sản phẩm này oke', '2024-05-14 07:08:20', '2024-05-14 07:08:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tendanhmuc` varchar(191) NOT NULL,
  `tendanhmuc_slug` varchar(191) NOT NULL,
  `motadanhmuc` text DEFAULT NULL,
  `hinhanh` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `tendanhmuc`, `tendanhmuc_slug`, `motadanhmuc`, `hinhanh`, `created_at`, `updated_at`) VALUES
(1, 'Thuốc', 'thuoc', NULL, 'danh-muc/thuoc.webp', '2024-04-27 06:46:14', '2024-04-27 06:46:14'),
(2, 'Thực phẩm chức năng', 'thuc-pham-chuc-nang', NULL, 'danh-muc/thuc-pham-chuc-nang.webp', '2024-04-27 06:46:35', '2024-04-27 06:46:35'),
(3, 'Chăm sóc cá nhân', 'cham-soc-ca-nhan', NULL, 'danh-muc/cham-soc-ca-nhan.webp', '2024-04-27 06:46:54', '2024-04-27 06:46:54'),
(4, 'Mẹ và Bé', 'me-va-be', NULL, 'danh-muc/me-va-be.webp', '2024-04-27 06:47:11', '2024-04-27 06:47:11'),
(5, 'Chăm sóc sắc đẹp', 'cham-soc-sac-dep', NULL, 'danh-muc/cham-soc-sac-dep.webp', '2024-04-27 06:47:31', '2024-04-27 06:47:31'),
(6, 'Thiết bị y tế', 'thiet-bi-y-te', NULL, 'danh-muc/thiet-bi-y-te.webp', '2024-04-27 06:52:18', '2024-04-27 06:52:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nguoidung_id` bigint(20) UNSIGNED NOT NULL,
  `tinhtrang_id` bigint(20) UNSIGNED NOT NULL,
  `dienthoaigiaohang` varchar(20) NOT NULL,
  `diachigiaohang` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `nguoidung_id`, `tinhtrang_id`, `dienthoaigiaohang`, `diachigiaohang`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '0123456789', 'An Giang', '2024-04-30 15:27:35', '2024-05-01 14:39:55'),
(2, 2, 1, '0123456789', 'An Giang', '2024-05-01 14:41:37', '2024-05-01 14:41:37'),
(3, 2, 1, '0123456789', 'An Giang', '2024-05-02 05:12:40', '2024-05-02 05:12:40'),
(4, 2, 2, '0123456789', 'An Giang', '2024-05-02 05:14:35', '2024-05-08 08:12:03'),
(5, 2, 1, '0123456789', 'An Giang', '2024-05-13 04:05:44', '2024-05-13 04:05:44'),
(6, 2, 3, '0123456789', 'An Giang', '2024-05-13 04:07:10', '2024-05-13 14:57:45'),
(7, 2, 1, '0123456789', 'An Giang', '2024-05-13 04:20:42', '2024-05-13 04:20:42'),
(8, 2, 1, '0123456789', 'An Giang', '2024-05-13 04:21:50', '2024-05-13 04:21:50'),
(9, 2, 2, '0123456789', 'An Giang', '2024-05-13 14:51:50', '2024-05-13 14:57:38'),
(10, 2, 1, '0123456789', 'Hậu Giang', '2024-05-14 06:49:52', '2024-05-14 06:49:52'),
(11, 2, 1, '0123456789', 'An Giang', '2024-05-14 06:56:07', '2024-05-14 06:56:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang_chitiet`
--

CREATE TABLE `donhang_chitiet` (
  `donhang_id` bigint(20) UNSIGNED NOT NULL,
  `thuoc_id` bigint(20) UNSIGNED NOT NULL,
  `soluongban` int(11) NOT NULL,
  `dongiaban` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang_chitiet`
--

INSERT INTO `donhang_chitiet` (`donhang_id`, `thuoc_id`, `soluongban`, `dongiaban`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 35000, '2024-04-30 15:27:35', '2024-04-30 15:27:35'),
(1, 2, 1, 37000, '2024-04-30 15:27:35', '2024-04-30 15:27:35'),
(1, 1, 1, 35000, '2024-04-30 15:27:35', '2024-04-30 15:27:35'),
(1, 2, 1, 37000, '2024-04-30 15:27:35', '2024-04-30 15:27:35'),
(2, 2, 1, 37000, '2024-05-01 14:41:37', '2024-05-01 14:41:37'),
(2, 3, 2, 90000, '2024-05-01 14:41:37', '2024-05-01 14:41:37'),
(3, 7, 1, 795000, '2024-05-02 05:12:40', '2024-05-02 05:12:40'),
(4, 4, 1, 200000, '2024-05-02 05:14:36', '2024-05-02 05:14:36'),
(5, 8, 1, 483000, '2024-05-13 04:05:44', '2024-05-13 04:05:44'),
(5, 37, 1, 20000, '2024-05-13 04:05:44', '2024-05-13 04:05:44'),
(6, 20, 1, 197500, '2024-05-13 04:07:10', '2024-05-13 04:07:10'),
(6, 14, 1, 115000, '2024-05-13 04:07:10', '2024-05-13 04:07:10'),
(6, 17, 3, 171000, '2024-05-13 04:07:10', '2024-05-13 04:07:10'),
(7, 10, 1, 75600, '2024-05-13 04:20:42', '2024-05-13 04:20:42'),
(8, 36, 1, 345000, '2024-05-13 04:21:50', '2024-05-13 04:21:50'),
(9, 36, 1, 345000, '2024-05-13 14:51:50', '2024-05-13 14:51:50'),
(10, 38, 2, 24900, '2024-05-14 06:49:52', '2024-05-14 06:49:52'),
(10, 37, 1, 20000, '2024-05-14 06:49:52', '2024-05-14 06:49:52'),
(11, 1, 5, 35000, '2024-05-14 06:56:07', '2024-05-14 06:56:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nguoidung_id` bigint(20) UNSIGNED NOT NULL,
  `thuoc_id` bigint(20) UNSIGNED NOT NULL,
  `soluong` int(11) NOT NULL DEFAULT 1,
  `dongiaban` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangsanxuat`
--

CREATE TABLE `hangsanxuat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenhang` varchar(191) NOT NULL,
  `tenhang_slug` varchar(191) NOT NULL,
  `motahang` text DEFAULT NULL,
  `hinhanh` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hangsanxuat`
--

INSERT INTO `hangsanxuat` (`id`, `tenhang`, `tenhang_slug`, `motahang`, `hinhanh`, `created_at`, `updated_at`) VALUES
(1, 'Exeltis', 'exeltis', NULL, 'hang-san-xuat/exeltis.png', '2024-04-27 08:15:22', '2024-04-27 08:16:30'),
(2, 'Postinor', 'postinor', NULL, 'hang-san-xuat/postinor.png', '2024-04-27 08:38:41', '2024-04-27 14:30:01'),
(3, 'Merck Sharp & Dohme', 'merck-sharp-dohme', NULL, 'hang-san-xuat/merck-sharp-dohme.png', '2024-04-27 12:06:38', '2024-04-27 12:06:38'),
(4, 'Mega Lifesciences', 'mega-lifesciences', NULL, 'hang-san-xuat/mega-lifesciences.png', '2024-04-27 12:19:01', '2024-04-27 12:19:01'),
(5, 'Welson', 'welson', NULL, 'hang-san-xuat/welson.webp', '2024-04-27 12:36:42', '2024-04-27 12:36:42'),
(6, 'Blissberry', 'blissberry', NULL, 'hang-san-xuat/blissberry.webp', '2024-04-27 13:28:19', '2024-04-27 13:28:19'),
(7, 'Blackmores', 'blackmores', NULL, 'hang-san-xuat/blackmores.png', '2024-04-27 13:35:12', '2024-04-27 13:35:12'),
(8, 'Nivea', 'nivea', NULL, 'hang-san-xuat/nivea.webp', '2024-04-27 13:39:48', '2024-04-27 13:39:48'),
(9, 'Johnson', 'johnson', NULL, 'hang-san-xuat/johnson.png', '2024-04-27 13:54:32', '2024-04-27 13:54:32'),
(10, 'Garnier', 'garnier', NULL, 'hang-san-xuat/garnier.jpg', '2024-04-27 14:18:40', '2024-04-27 14:18:40'),
(11, 'Cancer Council', 'cancer-council', NULL, 'hang-san-xuat/cancer-council.png', '2024-04-27 14:29:12', '2024-04-27 14:29:12'),
(12, 'KACHI', 'kachi', NULL, 'hang-san-xuat/kachi.webp', '2024-04-27 14:56:13', '2024-04-27 14:56:13'),
(13, 'OPC', 'opc', NULL, 'hang-san-xuat/opc.png', '2024-05-01 15:41:24', '2024-05-01 15:41:24'),
(14, 'GSK OTC', 'gsk-otc', NULL, 'hang-san-xuat/gsk-otc.png', '2024-05-01 15:46:21', '2024-05-01 15:46:21'),
(15, 'STELLA', 'stella', NULL, 'hang-san-xuat/stella.webp', '2024-05-01 16:33:42', '2024-05-01 16:33:42'),
(16, 'STADA', 'stada', NULL, 'hang-san-xuat/stada.jpg', '2024-05-01 16:36:44', '2024-05-01 16:36:44'),
(17, 'DHG Pharma', 'dhg-pharma', NULL, 'hang-san-xuat/dhg-pharma.webp', '2024-05-01 16:40:29', '2024-05-01 16:40:29'),
(18, 'Ipsen Pharma', 'ipsen-pharma', NULL, 'hang-san-xuat/ipsen-pharma.svg', '2024-05-01 16:48:01', '2024-05-01 16:48:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanh`
--

CREATE TABLE `hinhanh` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thuoc_id` bigint(20) UNSIGNED NOT NULL,
  `hinhanhmota` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhanh`
--

INSERT INTO `hinhanh` (`id`, `thuoc_id`, `hinhanhmota`, `created_at`, `updated_at`) VALUES
(1, 24, 'khang-viem/dentanalgi-1.webp', '2024-05-01 15:44:26', '2024-05-01 15:44:26'),
(2, 24, 'khang-viem/dentanalgi-2.webp', '2024-05-01 15:44:26', '2024-05-01 15:44:26'),
(3, 24, 'khang-viem/dentanalgi-3.webp', '2024-05-01 15:44:26', '2024-05-01 15:44:26'),
(4, 25, 'khang-viem/voltaren-emulgel-gel-1-1.webp', '2024-05-01 15:51:16', '2024-05-01 15:51:16'),
(5, 26, 'cam-lanh/siro-ho-astex-1.jpg', '2024-05-01 15:56:02', '2024-05-01 15:56:02'),
(6, 26, 'cam-lanh/siro-ho-astex-2.jpg', '2024-05-01 15:56:02', '2024-05-01 15:56:02'),
(7, 26, 'cam-lanh/siro-ho-astex-3.jpg', '2024-05-01 15:56:02', '2024-05-01 15:56:02'),
(8, 27, 'cam-lanh/siro-ho-nguoi-lon-opc-1.webp', '2024-05-01 15:59:32', '2024-05-01 15:59:32'),
(9, 27, 'cam-lanh/siro-ho-nguoi-lon-opc-2.webp', '2024-05-01 15:59:32', '2024-05-01 15:59:32'),
(10, 27, 'cam-lanh/siro-ho-nguoi-lon-opc-3.webp', '2024-05-01 15:59:32', '2024-05-01 15:59:32'),
(11, 28, 'danh-cho-phu-nu/ao-long-cao-ich-mau-opc-1.jpg', '2024-05-01 16:02:44', '2024-05-01 16:02:44'),
(12, 28, 'danh-cho-phu-nu/ao-long-cao-ich-mau-opc-2.jpg', '2024-05-01 16:02:44', '2024-05-01 16:02:44'),
(13, 28, 'danh-cho-phu-nu/ao-long-cao-ich-mau-opc-3.jpg', '2024-05-01 16:02:44', '2024-05-01 16:02:44'),
(14, 29, 'da-lieu/con-90-opc-1.jpg', '2024-05-01 16:05:42', '2024-05-01 16:05:42'),
(15, 29, 'da-lieu/con-90-opc-2.jpg', '2024-05-01 16:05:42', '2024-05-01 16:05:42'),
(16, 29, 'da-lieu/con-90-opc-3.jpg', '2024-05-01 16:05:42', '2024-05-01 16:05:42'),
(17, 30, 'dau-gio-dau-cu-la/con-xoa-bop-eagle-1.webp', '2024-05-01 16:08:08', '2024-05-01 16:08:08'),
(18, 30, 'dau-gio-dau-cu-la/con-xoa-bop-eagle-2.png', '2024-05-01 16:08:08', '2024-05-01 16:08:08'),
(19, 30, 'dau-gio-dau-cu-la/con-xoa-bop-eagle-3.png', '2024-05-01 16:08:08', '2024-05-01 16:08:08'),
(20, 31, 'da-lieu/dung-dich-dung-ngoai-milian-1.webp', '2024-05-01 16:11:59', '2024-05-01 16:11:59'),
(21, 31, 'da-lieu/dung-dich-dung-ngoai-milian-2.webp', '2024-05-01 16:11:59', '2024-05-01 16:11:59'),
(22, 31, 'da-lieu/dung-dich-dung-ngoai-milian-3.png', '2024-05-01 16:11:59', '2024-05-01 16:11:59'),
(23, 32, 'dau-gio-dau-cu-la/cao-sao-vang-1.png', '2024-05-01 16:22:06', '2024-05-01 16:22:06'),
(24, 32, 'dau-gio-dau-cu-la/cao-sao-vang-2.png', '2024-05-01 16:22:06', '2024-05-01 16:22:06'),
(25, 33, 'dau-gio-dau-cu-la/dau-nong-mat-troi-1.jpg', '2024-05-01 16:24:55', '2024-05-01 16:24:55'),
(26, 33, 'dau-gio-dau-cu-la/dau-nong-mat-troi-2.jpg', '2024-05-01 16:24:55', '2024-05-01 16:24:55'),
(27, 33, 'dau-gio-dau-cu-la/dau-nong-mat-troi-3.jpg', '2024-05-01 16:24:55', '2024-05-01 16:24:55'),
(28, 34, 'da-lieu/gel-picado-1.png', '2024-05-01 16:29:18', '2024-05-01 16:29:18'),
(29, 34, 'da-lieu/gel-picado-2.png', '2024-05-01 16:29:18', '2024-05-01 16:29:18'),
(30, 34, 'da-lieu/gel-picado-3.png', '2024-05-01 16:29:18', '2024-05-01 16:29:18'),
(31, 35, 'giam-can/vien-nang-odistad-120mg-1.webp', '2024-05-01 16:35:44', '2024-05-01 16:35:44'),
(32, 35, 'giam-can/vien-nang-odistad-120mg-2.webp', '2024-05-01 16:35:44', '2024-05-01 16:35:44'),
(33, 35, 'giam-can/vien-nang-odistad-120mg-3.png', '2024-05-01 16:35:44', '2024-05-01 16:35:44'),
(34, 36, 'giam-can/vien-nang-orlistat-stada-120mg-1.webp', '2024-05-01 16:38:46', '2024-05-01 16:38:46'),
(35, 36, 'giam-can/vien-nang-orlistat-stada-120mg-2.webp', '2024-05-01 16:38:46', '2024-05-01 16:38:46'),
(36, 36, 'giam-can/vien-nang-orlistat-stada-120mg-3.png', '2024-05-01 16:38:46', '2024-05-01 16:38:46'),
(37, 37, 'mattaimui/eyelight-cool-1.webp', '2024-05-01 16:43:43', '2024-05-01 16:43:43'),
(38, 37, 'mattaimui/eyelight-cool-2.png', '2024-05-01 16:43:43', '2024-05-01 16:43:43'),
(39, 37, 'mattaimui/eyelight-cool-3.png', '2024-05-01 16:43:43', '2024-05-01 16:43:43'),
(40, 38, 'mattaimui/nho-mat-eyelight-vit-1.webp', '2024-05-01 16:45:57', '2024-05-01 16:45:57'),
(41, 38, 'mattaimui/nho-mat-eyelight-vit-2.png', '2024-05-01 16:45:57', '2024-05-01 16:45:57'),
(42, 38, 'mattaimui/nho-mat-eyelight-vit-3.png', '2024-05-01 16:45:57', '2024-05-01 16:45:57'),
(43, 39, 'tieu-hoa/smecta-3g-1.jpg', '2024-05-01 16:51:00', '2024-05-01 16:51:00'),
(44, 39, 'tieu-hoa/smecta-3g-2.jpg', '2024-05-01 16:51:00', '2024-05-01 16:51:00'),
(45, 39, 'tieu-hoa/smecta-3g-3.jpg', '2024-05-01 16:51:00', '2024-05-01 16:51:00'),
(46, 1, 'ngua-thai/cerciorat-15mg-leon-farma-1.jpg', '2024-05-08 07:03:45', '2024-05-08 07:03:45'),
(47, 1, 'ngua-thai/cerciorat-15mg-leon-farma-2.jpg', '2024-05-08 07:03:45', '2024-05-08 07:03:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoiphucmatkhau`
--

CREATE TABLE `khoiphucmatkhau` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khoiphucmatkhau`
--

INSERT INTO `khoiphucmatkhau` (`email`, `token`, `created_at`) VALUES
('geekay05052002@gmail.com', '$2y$12$TmT.hWJ6oPWirL1A00LuQ.2/N4DZ7USKZ1.zgA/atpmeE2lyKCTvC', '2024-05-02 07:54:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lienhe`
--

CREATE TABLE `lienhe` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nguoidung_id` bigint(20) UNSIGNED NOT NULL,
  `ten` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `sdt` varchar(191) NOT NULL,
  `chude` varchar(191) NOT NULL,
  `noidung` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lienhe`
--

INSERT INTO `lienhe` (`id`, `nguoidung_id`, `ten`, `email`, `sdt`, `chude`, `noidung`, `created_at`, `updated_at`) VALUES
(1, 2, 'Khưu Hoàng Giang', 'geekay05052002@gmail.com', '0123456789', 'Phản Hồi', '<p>Tôi cần liên hệ với bạn&nbsp;</p><p>&nbsp;</p>', '2024-05-08 07:32:33', '2024-05-08 07:32:33'),
(2, 2, 'Khưu Hoàng Giang', 'geekay05052002@gmail.com', '0123456789', 'Phản Hồi', '<p>Tôi có 1 số vấn đề cần đề cặp đến shop của bạn</p>', '2024-05-13 04:22:43', '2024-05-13 04:22:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_02_04_062338_create_hang_san_xuats_table', 1),
(7, '2024_02_28_062337_create_danh_mucs_table', 1),
(8, '2024_02_28_062356_create_nhom_thuocs_table', 1),
(9, '2024_02_28_062411_create_quoc_gias_table', 1),
(10, '2024_02_28_062427_create_thuocs_table', 1),
(11, '2024_02_28_062449_create_hinh_anhs_table', 1),
(12, '2024_02_28_062652_create_nha_cung_caps_table', 1),
(13, '2024_02_28_062653_create_nhap_hangs_table', 1),
(14, '2024_03_14_214030_create_tinh_trangs_table', 1),
(15, '2024_04_03_225236_create_gio_hangs_table', 1),
(16, '2024_04_14_214030_create_don_hangs_table', 1),
(17, '2024_04_14_214031_create_don_hang__chi_tiets_table', 1),
(18, '2024_04_16_221647_create_thong_tin_nhap_hangs_table', 1),
(19, '2024_04_29_213842_create_lien_hes_table', 1),
(20, '2024_04_30_222210_create_binh_luan_thuocs_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `role` varchar(191) NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `hinhanh` varchar(191) DEFAULT NULL,
  `sdt` varchar(191) DEFAULT NULL,
  `diachi` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `name`, `email`, `username`, `role`, `email_verified_at`, `password`, `hinhanh`, `sdt`, `diachi`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Khưu Hoàng Admin', 'giangkhuu3897@gmail.com', 'giangkhuu3897', 'admin', NULL, '$2y$12$j/zS4J6OhXCxI4uBr4P2QeGAyFG2U2zi2FbJOqB1JZPdmyInXm4ky', NULL, NULL, NULL, NULL, '2024-04-27 15:02:41', '2024-04-27 15:03:21'),
(2, 'Khưu Hoàng Giang', 'geekay05052002@gmail.com', 'geekay05052002', 'user', NULL, '$2y$12$7V12RnSY5oLf79eHmvutfOSCkvTOVPjMFhmGs8secmzHbL0twlv4y', 'nguoi-dung/2.jpg', '0123456789', 'An Giang', NULL, '2024-04-30 07:30:30', '2024-05-13 04:18:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tennhacungcap` varchar(191) NOT NULL,
  `masothue` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `sdt` varchar(191) NOT NULL,
  `diachi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`id`, `tennhacungcap`, `masothue`, `email`, `sdt`, `diachi`, `created_at`, `updated_at`) VALUES
(1, 'Công ty Cổ phần Dược Hậu Giang', 'MST0123456', 'haugiang@gmail.com', '0123456789', 'Hậu Giang', '2024-04-30 08:19:02', '2024-04-30 08:19:02'),
(2, 'Công ty Cổ phần Xuất nhập khẩu Y tế DOMESCO', 'MST0123457', 'domesco@gmail.com', '0123456780', 'Đồng Tháp', '2024-04-30 08:21:21', '2024-04-30 08:21:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhaphang`
--

CREATE TABLE `nhaphang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nhacungcap_id` bigint(20) UNSIGNED NOT NULL,
  `manhap` varchar(191) NOT NULL,
  `nguoinhap` varchar(191) NOT NULL,
  `ngaynhap` date NOT NULL,
  `tongtiennhap` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhaphang`
--

INSERT INTO `nhaphang` (`id`, `nhacungcap_id`, `manhap`, `nguoinhap`, `ngaynhap`, `tongtiennhap`, `created_at`, `updated_at`) VALUES
(1, 1, 'PNK_M51UZNB', 'Khưu Hoàng Admin', '2024-05-14', NULL, '2024-05-14 06:53:57', '2024-05-14 06:53:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhomthuoc`
--

CREATE TABLE `nhomthuoc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tennhomthuoc` varchar(191) NOT NULL,
  `tennhomthuoc_slug` varchar(191) NOT NULL,
  `motanhomthuoc` text DEFAULT NULL,
  `hinhanh` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhomthuoc`
--

INSERT INTO `nhomthuoc` (`id`, `tennhomthuoc`, `tennhomthuoc_slug`, `motanhomthuoc`, `hinhanh`, `created_at`, `updated_at`) VALUES
(1, 'Ngừa thai', 'ngua-thai', NULL, 'nhom-thuoc/ngua-thai.jpg', '2024-04-27 07:03:31', '2024-04-27 07:03:31'),
(2, 'Kháng dị ứng', 'khang-di-ung', NULL, 'nhom-thuoc/khang-di-ung.jpg', '2024-04-27 07:03:59', '2024-04-27 07:03:59'),
(3, 'Kháng viêm', 'khang-viem', NULL, 'nhom-thuoc/khang-viem.webp', '2024-04-27 07:04:19', '2024-04-27 07:04:19'),
(4, 'Cảm lạnh', 'cam-lanh', NULL, 'nhom-thuoc/cam-lanh.webp', '2024-04-27 07:06:31', '2024-04-27 07:06:31'),
(5, 'Giảm cân', 'giam-can', NULL, 'nhom-thuoc/giam-can.jpg', '2024-04-27 07:07:11', '2024-04-27 07:07:11'),
(6, 'Mắt/Tai/Mũi', 'mattaimui', NULL, 'nhom-thuoc/mattaimui.webp', '2024-04-27 07:08:17', '2024-04-27 07:08:17'),
(7, 'Tiêu hóa', 'tieu-hoa', NULL, 'nhom-thuoc/tieu-hoa.jpg', '2024-04-27 07:08:54', '2024-04-27 07:08:54'),
(8, 'Dành cho nam', 'danh-cho-nam', NULL, 'nhom-thuoc/danh-cho-nam.webp', '2024-04-27 07:39:38', '2024-04-27 07:39:38'),
(9, 'Dành cho phụ nữ', 'danh-cho-phu-nu', NULL, 'nhom-thuoc/danh-cho-phu-nu.jpg', '2024-04-27 07:40:05', '2024-04-27 07:40:05'),
(10, 'Giảm đau hạ sốt', 'giam-dau-ha-sot', NULL, 'nhom-thuoc/giam-dau-ha-sot.webp', '2024-04-27 07:40:44', '2024-04-27 07:40:44'),
(11, 'Da liễu', 'da-lieu', NULL, 'nhom-thuoc/da-lieu.jpg', '2024-04-27 07:42:00', '2024-04-27 07:42:00'),
(12, 'Thần kinh', 'than-kinh', NULL, 'nhom-thuoc/than-kinh.jpg', '2024-04-27 07:51:35', '2024-04-27 07:51:35'),
(13, 'Cơ xương khớp', 'co-xuong-khop', NULL, 'nhom-thuoc/co-xuong-khop.webp', '2024-04-27 07:52:19', '2024-04-27 07:52:19'),
(14, 'Dầu gió. dầu cù là, ...', 'dau-gio-dau-cu-la', NULL, 'nhom-thuoc/dau-gio-dau-cu-la.jpg', '2024-04-27 07:52:55', '2024-04-27 07:52:55'),
(15, 'Tiểu đường', 'tieu-duong', NULL, 'nhom-thuoc/tieu-duong.webp', '2024-04-27 07:55:24', '2024-04-27 07:55:24'),
(16, 'Vitamin & khoáng chất', 'vitamin-khoang-chat', NULL, 'nhom-thuoc/vitamin-khoang-chat.webp', '2024-04-27 07:56:27', '2024-04-27 07:56:27'),
(17, 'Tim mạch, huyết áp', 'tim-mach-huyet-ap', NULL, 'nhom-thuoc/tim-mach-huyet-ap.jpg', '2024-04-27 07:57:00', '2024-04-27 07:57:00'),
(18, 'Gan', 'gan', NULL, 'nhom-thuoc/gan.jpg', '2024-04-27 07:58:24', '2024-04-27 07:58:24'),
(19, 'Hô hấp', 'ho-hap', NULL, 'nhom-thuoc/ho-hap.webp', '2024-04-27 07:58:48', '2024-04-27 07:58:48'),
(20, 'Khử mùi', 'khu-mui', NULL, 'nhom-thuoc/khu-mui.webp', '2024-04-27 08:01:15', '2024-04-27 08:01:15'),
(21, 'Em bé', 'em-be', NULL, 'nhom-thuoc/em-be.jpg', '2024-04-27 08:02:06', '2024-04-27 08:02:06'),
(22, 'Dành cho mẹ', 'danh-cho-me', NULL, 'nhom-thuoc/danh-cho-me.webp', '2024-04-27 08:02:37', '2024-04-27 08:02:37'),
(23, 'Mặt', 'mat', NULL, 'nhom-thuoc/mat.webp', '2024-04-27 08:03:17', '2024-04-27 08:03:17'),
(24, 'Chống nắng', 'chong-nang', NULL, 'nhom-thuoc/chong-nang.jpg', '2024-04-27 08:03:42', '2024-04-27 08:03:42'),
(25, 'Nhiệt kế', 'nhiet-ke', NULL, 'nhom-thuoc/nhiet-ke.webp', '2024-04-27 08:04:55', '2024-04-27 08:04:55'),
(26, 'Đo huyết áp', 'do-huyet-ap', NULL, 'nhom-thuoc/do-huyet-ap.jpg', '2024-04-27 08:05:39', '2024-04-27 08:05:39'),
(27, 'Làm đẹp', 'lam-dep', NULL, NULL, '2024-04-27 12:46:21', '2024-04-27 12:46:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quocgia`
--

CREATE TABLE `quocgia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenquocgia` varchar(191) NOT NULL,
  `tenquocgia_slug` varchar(191) NOT NULL,
  `hinhanh` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `quocgia`
--

INSERT INTO `quocgia` (`id`, `tenquocgia`, `tenquocgia_slug`, `hinhanh`, `created_at`, `updated_at`) VALUES
(1, 'Việt Nam', 'viet-nam', 'quoc-gia/viet-nam.webp', '2024-04-27 08:12:38', '2024-04-27 08:13:29'),
(2, 'Tây Ban Nha', 'tay-ban-nha', 'quoc-gia/tay-ban-nha.jpg', '2024-04-27 08:17:04', '2024-04-27 08:17:04'),
(3, 'Hungary', 'hungary', 'quoc-gia/hungary.jpg', '2024-04-27 08:39:57', '2024-04-27 08:39:57'),
(4, 'Thái lan', 'thai-lan', 'quoc-gia/thai-lan.png', '2024-04-27 12:10:32', '2024-04-27 12:10:32'),
(5, 'Hàn Quốc', 'han-quoc', 'quoc-gia/han-quoc.png', '2024-04-27 12:37:35', '2024-04-27 12:37:35'),
(6, 'Úc', 'uc', 'quoc-gia/uc.png', '2024-04-27 13:34:36', '2024-04-27 13:34:36'),
(7, 'Đức', 'duc', 'quoc-gia/duc.png', '2024-04-27 13:40:18', '2024-04-27 13:40:18'),
(8, 'Mỹ', 'my', 'quoc-gia/my.jpg', '2024-04-27 13:55:24', '2024-04-27 13:55:24'),
(9, 'Pháp', 'phap', 'quoc-gia/phap.png', '2024-04-27 14:17:55', '2024-04-27 14:17:55'),
(10, 'Trung quốc', 'trung-quoc', 'quoc-gia/trung-quoc.png', '2024-04-27 14:55:10', '2024-04-27 14:55:10'),
(11, 'Thụy Sĩ', 'thuy-si', 'quoc-gia/thuy-si.jpg', '2024-05-01 15:48:02', '2024-05-01 15:48:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongtinnhaphang`
--

CREATE TABLE `thongtinnhaphang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thuoc_id` bigint(20) UNSIGNED NOT NULL,
  `nhaphang_id` bigint(20) UNSIGNED NOT NULL,
  `solo` varchar(191) NOT NULL,
  `ngaysanxuat` date NOT NULL,
  `hansudung` date NOT NULL,
  `dongianhap` double NOT NULL,
  `soluong` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thongtinnhaphang`
--

INSERT INTO `thongtinnhaphang` (`id`, `thuoc_id`, `nhaphang_id`, `solo`, `ngaysanxuat`, `hansudung`, `dongianhap`, `soluong`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'P123', '2024-05-15', '2024-05-15', 152000, 10, '2024-05-14 06:53:57', '2024-05-14 06:53:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoc`
--

CREATE TABLE `thuoc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `danhmuc_id` bigint(20) UNSIGNED NOT NULL,
  `nhomthuoc_id` bigint(20) UNSIGNED NOT NULL,
  `hangsanxuat_id` bigint(20) UNSIGNED NOT NULL,
  `quocgia_id` bigint(20) UNSIGNED NOT NULL,
  `sodangky` varchar(191) NOT NULL,
  `tenthuoc` varchar(191) NOT NULL,
  `tenbietduoc` varchar(191) NOT NULL,
  `tenbietduoc_slug` varchar(191) NOT NULL,
  `dongiaban` double NOT NULL,
  `hoatchat` varchar(191) NOT NULL,
  `thuockedon` tinyint(3) UNSIGNED DEFAULT NULL,
  `donvitinh` varchar(191) NOT NULL,
  `donggoi` varchar(191) DEFAULT NULL,
  `thang` varchar(191) NOT NULL,
  `congdung` text NOT NULL,
  `hinhanh` varchar(191) DEFAULT NULL,
  `motathuoc` text DEFAULT NULL,
  `soluong` int(11) DEFAULT 0,
  `trangthai` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thuoc`
--

INSERT INTO `thuoc` (`id`, `danhmuc_id`, `nhomthuoc_id`, `hangsanxuat_id`, `quocgia_id`, `sodangky`, `tenthuoc`, `tenbietduoc`, `tenbietduoc_slug`, `dongiaban`, `hoatchat`, `thuockedon`, `donvitinh`, `donggoi`, `thang`, `congdung`, `hinhanh`, `motathuoc`, `soluong`, `trangthai`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 'P17254', 'Viên nén Cerciorat 1,5mg Leon Farma thuốc tránh thai khẩn cấp trong vòng 72 giờ (1 vỉ X 1 viên)', 'Cerciorat 1,5mg Leon Farma', 'cerciorat-15mg-leon-farma', 35000, 'LEVONORGESTREL', 0, 'Hộp', '1 vỉ X 1 viên', '48', 'Thuốc tránh thai khẩn cấp trong vòng 72 giờ', 'ngua-thai/cerciorat-15mg-leon-farma.jpg', '<p style=\"text-align:justify;\"><strong>Thành phần &nbsp;</strong><br>Mỗi viên nén có chứa:<br>Thành phần hoạt chất: Levonorgestrel 1.5mg.<br>Thành phần tá dược: Cellulose microcrystalline, lactose, monohydrate, poloxamer, croscamellose natri natri, magnesi stearat.<br><strong>&nbsp; &nbsp;</strong><br><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)<br>Thuốc uống tránh thai khẩn cấp trong vòng 72 giờ sau giao hợp mà không có phương pháp tránh thai hay phương pháp tránh thai thất bại.<br>&nbsp; &nbsp;<br><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)<br>Mẫn cảm với hoạt chất hay bất kỳ tá dược nào của thuốc<br>&nbsp;<br><strong>Liều dùng</strong><br>Uống một viên càng sớm càng tốt, tốt nhất trong vòng 12 giờ và không quá 72 giờ sau giao hợp không có phương pháp tránh thai.<br>Nếu nôn sau khi uống thuốc trong vòng ba giờ, cần uống viên khác ngay lập tức. Cerciorat có thể được uống bất cứ lúc nào trong chu kỳ kinh nguyệt, trừ khi trễ kinh.<br>Sau khi sử dụng thuốc tránh thai khẩn cấp, nên sử dụng phương pháp tránh thai dạng rào cản (như bao cao su, màng ngăn, thuốc diệt tinh trùng, mũ cổ tử cung) cho đến khi bắt đầu kỳ kinh nguyệt tiếp theo. Sử dụng Cerciorat không chống chỉ định đối với việc tiếp tục uống thuốc tránh thai dạng hormone dùng hằng ngày.<br>Phụ nữ khi đã dùng thuốc cảm ứng enzym trong vòng 4 tuần trước đó cần sử dụng biện pháp tránh thai khẩn cấp là biện pháp tránh thai không chứa hormone, ví dụ đặt vòng tránh thai trong tử cung. Đối với phụ nữ không thể hoặc không sẵn sàng đặt vòng tránh thai trong tử cung có thể uống liều gấp đôi levonorgestrel (nghĩa là 3000mcg trong vòng 72 giờ sau khi giao hợp không an toàn) (xem phần Tương tác thuốc)<br><i>Trẻ em</i><br>Cerciorat không được khuyến cáo ở trẻ em trước khi đến tuổi sinh sản. Cerciorat chỉ dùng cho phụ nữ đã có kinh nguyệt. Cerciorat không được khuyến cáo ở thiếu nữ chưa có kinh nguyệt dưới 16 tuổi.<br>&nbsp; &nbsp;<br><strong>Tác dụng phụ</strong> &nbsp;</p><p style=\"text-align:justify;\">Tác dụng phụ thường gặp nhất là buồn nôn</p><p style=\"text-align:justify;\"><strong>Bảo quản:</strong><span style=\"color:rgb(43,43,43);\"> Ở nhiệt độ dưới 30oC.</span><br><span style=\"color:rgb(43,43,43);\">&nbsp;</span><br><strong>Đóng gói:</strong><span style=\"color:rgb(43,43,43);\"> Hộp 1 vỉ x 1 viên nén.</span><br><strong>&nbsp;</strong><br><strong>Thương hiệu:</strong><span style=\"color:rgb(43,43,43);\"> Laboratorios Leon Farma S.A.</span><br><span style=\"color:rgb(43,43,43);\">&nbsp;</span><br><strong>Nơi sản xuất:</strong><span style=\"color:rgb(43,43,43);\"> Laboratorios Leon Farma S.A. (Tây Ban Nha)</span></p><p><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i></p><p><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 128, 1, '2024-04-27 08:23:35', '2024-05-14 06:56:07'),
(2, 1, 1, 2, 3, 'P02182', 'Viên nén Postinor 1 thuốc tránh thai khẩn cấp trong vòng 72 giờ (1 vỉ X 1 viên)', 'Postinor 1', 'postinor-1', 37000, 'LEVONORGESTREL', 0, 'Hộp', '1 vỉ X 1 viên', '48', 'Thuốc tránh thai khẩn cấp trong vòng 72 giờ', 'ngua-thai/postinor-1.jpg', '<p><strong>Thành phần</strong></p><p>- Hoạt chất: Levonorgestrel 1.5mg.</p><p>- Tá dược: keo silica khan, tinh bột khoai tây, magnesi stearat, talc, tinh bột ngô, lactose monohydrat.</p><p><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)</p><p>- Postinor 1 là thuốc ngừa thai khẩn cấp, có thể được dùng trong vòng 72 giờ sau các cuộc giao hợp không dùng biện pháp tránh thai, hoặc biện pháp tránh thai đã dùng không đạt hiệu quả. Loại thuốc tránh thai này thường được gọi là \"viên thuốc của ngày hôm sau\".</p><p><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)</p><p>- Bạn đã biết là bạn bị dị ứng với bất cứ thành phần nào của thuốc;</p><p>- Bạn mắc bệnh gan nặng;</p><p>- Nếu bạn mang thai.</p><p><strong>Liều dùng</strong></p><p>- Uống ngay một viên thuốc,càng sớm càng tốt trong 12 giờ đầu và không để muộn hơn 72 giờ (3 ngày) sau khi xảy ra cuộc giao hợp không dùng biện pháp tránh thai. Uống thuốc nguyên viên và có thể uống nước nếu cần. Không nên trì hoãn việc uống thuốc. Sau khi giao hợp, uống thuốc càng sớm thì hiệu quả càng cao.</p><p><strong>Tác dụng phụ</strong></p><p>Thông báo cho bác sỹ những tác dụng không mong muốn gặp phải khi sử dụng thuốc</p><p>- Tác dụng không mong muốn phổ biến nhất được báo cáo là buồn nôn sau khi dùng thuốc. Bạn cũng có thể bị nôn. Trường hợp này, cần xem lại phần hướng dẫn \"Bạn cần phải làm gì nếu bạn bị nôn?\"</p><p>- Kinh nguyệt có thể thay đổi. Tuy rằng đa số phụ nữ sẽ có chu kỳ kinh bình thường, nhưng một số người có thể có kinh sớm hoặc trễ hơn. Cũng có thể xảy ra xuất huyết bất thường hoặc xuất huyết lấm tấm trong thời gian sau dùng thuốc cho đến kỳ kinh tiếp theo. Nếu bạn bị trễ kinh quá 5 ngày hay kinh nguyệt ra nhiều hoặc ít hơn bình thường, bạn cần xin ý kiến của bác sĩ càng sớm càng tốt.</p><p>- Bạn có thể bị căng tức vú, nhức đầu, đau bụng dưới, tiêu chảy, chóng mặt hoặc mệt mỏi sau khi sử dụng thuốc. Những triệu chứng này sẽ giảm dần sau vài ngày.</p><p>- Các tác dụng không mong muốn sau đây đã được báo cáo tuy rất hiếm gặp từ giám sát hậu mãi: đau bụng, đỏ da, mày đay, ngứa, đau khung chậu, đau bụng kinh, phù mặt.</p><p>Nếu bạn nhận thấy những triệu chứng nào khác ngoài những gì liệt kê trên đây, hãy hỏi ý kiến bác sĩ, dược sĩ, các y sĩ thực hành hoặc tư vấn tại các phòng khám về kế hoạch hóa gia đình.</p><p>&nbsp;</p><p><strong>Thận trọng</strong> (Những lưu ý khi dùng thuốc)</p><p>- Nếu bạn đang mang thai hoặc nghĩ rằng có lẽ bạn đã thụ thai.</p><p>- Bạn bị trễ kinh, hoặc kỳ kinh cuối của bạn không giống như bình thường.</p><p>- Kể từ kỳ kinh cuối, nếu bạn đã có một cuộc giao hợp không dùng biện pháp tránh thai, xảy ra đã quá 72 giờ (vì có thể sự thụ thai đã xảy ra, nên việc điều trị sẽ không có kết quả).</p><p>- Nếu bạn mắc một bệnh nào đó về đường ruột (ví dụ, bệnh Crohn), ảnh hưởng đến sự tiêu hoá thức ăn.</p><p>- Nếu có bệnh suy gan nặng.</p><p>- Thuốc có chứa 142.5mg lactose monohydrat. Những người có bị bệnh di truyền hiếm gặp về không dung nạp galactose, không dung nạp lactose hoặc bị bệnh kém hấp thu glucose-galactose không nên dùng thuốc này.</p><p>- Postinor 1 không phải là biện pháp tránh thai thường xuyên và chỉ phù hợp như một biện pháp khẩn cấp. Phụ nữ cần dùng lặp lại thuốc tránh thai khẩn cấp được khuyên nên dùng các biện pháp tránh thai lâu dài.</p><p>- Dùng thuốc tránh thai khẩn cấp không thay thế cho các biện pháp ngăn ngừa bệnh lây truyền qua đường tình dục.</p><p>- Nếu bạn lo lắng về việc có thể mắc phải các bệnh lây truyền qua đường tình dục</p><p>- Thuốc này không bảo vệ bạn khỏi các bệnh lây truyền qua đường tình dục; chỉ có bao cao su mới có tác dụng này. Hãy trao đổi mối lo lắng của bạn với bác sĩ, dược sĩ, các y sĩ thực hành hay tư vấn tại các phòng khám kế hoạch hóa gia đình.</p><p><strong>Bảo quản:</strong> Bảo quản nơi khô ráo, nhiệt độ dưới 30°C trong bao bì gốc, tránh ánh sáng.</p><p><strong>Hạn dùng:</strong>&nbsp;4 năm kể từ ngày sản xuất. Không dùng thuốc sau hạn sử dụng ghi trên bao bì.</p><p><strong>Đóng gói:</strong> Mỗi hộp thuốc chứa 1 vỉ x 1 viên nén.</p><p><strong>Thương hiệu: </strong>Postinor</p><p><strong>Nơi sản xuất:</strong> Hungary</p><p><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i></p><p><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 96, 1, '2024-04-27 08:43:38', '2024-05-01 14:41:37'),
(3, 1, 2, 3, 4, 'P01189', 'Siro Aerius 0.5mg/ml trị viêm mũi dị ứng, mày đay, ngứa (chai 60ml)', 'Siro Aerius 0.5mg/ml', 'siro-aerius-05mgml', 90000, 'Desloratadin', 0, 'Chai', 'Chai 60ml', '24', 'Điều trị Viêm mũi dị ứng, mày đay, ngứa', 'khang-di-ung/siro-aerius-05mgml.jpg', '<p><strong>Thành phần</strong></p><p>Hoạt chất: mỗi ml chứa 0.5mg desloratadine.</p><p>Tá dược: Propylene glycol, dung dịch sorbitol, acid citric khan, natri citrate dihydrate, natri benzoate, dinatri edetate, sucrose, hương vị tự nhiên và nhân tạo, Color E100 và nước tinh khiết.</p><p><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)</p><p>Aerius được chỉ định để giảm nhanh các triệu chứng liên quan đến viêm mũi dị ứng, như hắt hơi, sổ mũi và ngứa mũi, sung huyết/nghẹt mũi, cũng như ngứa, chảy nước mắt và đỏ mắt, ngứa họng và ho.</p><p>Aerius cũng được chỉ định để giảm các triệu chứng liên quan đến mày đay như giảm ngứa, giảm kích cỡ và số lượng ban.</p><p><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)</p><p>Quá mẫn với hoạt chất hoặc với bất kỳ thành phần nào của thuốc.</p><p><strong>Liều dùng</strong></p><p>Người lớn và thanh thiếu niên (&gt; 12 tuổi): Một viên nén bao film Aerius 5mg hoặc 10ml (5mg) Aerius sirô, uống 1 lần/ngày uống cùng hoặc không cùng bữa ăn, để giảm các triệu chứng liên quan đến viêm mũi dị ứng (bao gồm viêm mũi dị ứng không liên tục và viêm mũi dị ứng kéo dài) và mày đay. Chỉ dùng đường uống.</p><p><strong>Bảo quản</strong></p><p>Bảo quản dưới 30°C. Giữ thuốc trong bao bì gốc.</p><p>Để xa tầm tay trẻ em.</p><p><strong>Đóng gói:</strong> Hộp 1 chai 60ml</p><p><strong>Thương hiệu:</strong> Merck Sharp &amp; Dohme</p><p><strong>Nơi sản xuất:</strong> Schering-Plough Labo N.V., (Thái Lan)</p><p><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i></p><p><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 98, 1, '2024-04-27 12:15:33', '2024-05-01 14:41:37'),
(4, 1, 2, 4, 4, 'P14329', 'Viên nang Loreze 10mg trị viêm mũi dị ứng, mày đay, ngứa (5 vỉ x 10 viên)', 'Loreze 10mg', 'loreze-10mg', 200000, 'Loratadin Micronized', 0, 'Hộp', '5 vỉ x 10 viên', '24', 'Điều trị dị ứng', 'khang-di-ung/loreze-10mg.webp', '<p><strong>Thành phần&nbsp;</strong><br>-&nbsp;Mỗi viên nang mềm chứa Loratadin micronized 10mg.<br>- Tá dược: Polyethylen glycol 400, propylen glycol, polysorbat 80.<br>- Tá dược nang mềm: Gelatin, glycerin, màu xanh brilliant, nước tinh khiết.</p><p><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)<br>-&nbsp;Chỉ định điều trị triệu chứng viêm mũi dị ứng:<br>+ Chảy nước mũi<br>+ Hắt hơi<br>+ Ngứa mũi hoặc họng<br>- Chỉ định điều trị triệu chứng mề đay mạn tính tự phát.</p><p><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)<br>-&nbsp;Mẫn cảm với bất kỳ thành phần nào của thuốc.</p><p><strong>Liều dùng</strong><br>-&nbsp;Người lớn và trẻ em trên 12 tuổi:&nbsp;1 viên uống một lần/ngày hoặc theo sự hướng dẫn của bác sĩ.<br>- Trẻ em 2-12 tuổi:&nbsp;Liều được tính theo thể trọng:<br>+ Cân nặng &gt;30kg: 1 viên (10mg) uống một lần/ngày.<br>+ Cân nặng ≤30kg: Loreze Clearcap không thích hợp cho trẻ có cân nặng ≤30kg.<br>- Đối với bệnh nhân suy gan, độ thanh thải loratadin giảm, do đó dùng liều 1 viên (10mg) mỗi hai ngày.</p><p><strong>Tác dụng phụ</strong><br>-&nbsp;Các tác dụng không mong muốn thông thường bao gồm mệt mỏi, nhức đầu, buồn ngủ, khô miệng, rối loạn tiêu hóa như buồn nôn, viêm dạ dày, và các triệu chứng dị ứng như phát ban.<br>Hiếm thấy trường hợp rụng tóc, sốc phản vệ, chức năng gan bất thường, nhịp tim nhanh, đánh trống ngực.<br>- Thông báo cho bác sỹ những tác dụng không mong muốn gặp phải khi dùng thuốc</p><p><strong>Thận trọng </strong>(Những lưu ý khi dùng thuốc)<br>-&nbsp;Những bệnh nhân suy gan hoặc suy thận (độ thanh thải &lt;30mL/phút), bao gồm những bệnh lớn tuổi nên dùng liều ban đầu thấp hơn do giảm thanh thải loratadin.<br>- Chưa khẳng định được tính an toàn và hiệu lực cùa loratadin khi dùng cho trè dưới 02 tuổi.<br>- Ngừng dùng thuốc hoặc thông báo với bác sĩ khi xuất hiện phản ứng dị ứng.&nbsp;<br><strong>Bảo quản:</strong>&nbsp;Bảo quản dưới 30°C ở nơi khô ráo, tránh ánh sáng.</p><p><strong>Đóng gói:</strong>&nbsp;Hộp 5 vỉ x10 viên.</p><p><strong>Thương hiệu:</strong>&nbsp;Mega Lifesciences</p><p><strong>Nơi sản xuất:</strong>&nbsp;Mega Lifesciences Public Company Limited (Thái Lan)</p><p><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 99, 1, '2024-04-27 12:23:30', '2024-05-02 05:14:36'),
(5, 1, 2, 3, 4, 'P01429', 'Viên nén Aerius 5mg trị viêm mũi dị ứng, mày đay, ngứa (1 vỉ x 10 viên)', 'Aerius 5mg', 'aerius-5mg', 100000, 'Desloratadin', 0, 'Hộp', '1 vỉ x 10 viên', '12', 'Điều trị Viêm mũi dị ứng, mày đay, ngứa, …', 'khang-di-ung/aerius-5mg.webp', '<p><strong>Thành phần</strong><br><span style=\"color:rgb(43,43,43);\">Hoạt chất: desloratadine 5mg</span><br><span style=\"color:rgb(43,43,43);\">Tá dược: Aerius viên nén: dibasic calcium phosphate dihydrate, microcrystalline cellulose, tinh bột ngô, bột talc, lactose monohydrate, hydroxypropyl methylcellulose, titanium dioxide, polyethylene glycol, FD và Blue No 2 aluminium lake, carnauba wax và white wax.</span><br><strong>Chỉ định</strong><span style=\"color:rgb(43,43,43);\"> (Thuốc dùng cho bệnh gì?)</span><br><span style=\"color:rgb(43,43,43);\">Aerius được chỉ định để giảm nhanh các triệu chứng liên quan đến viêm mũi dị ứng, như hắt hơi, sổ mũi và ngứa mũi, sung huyết/nghẹt mũi, cũng như ngứa, chảy nước mắt và đỏ mắt, ngứa họng và ho.</span><br><span style=\"color:rgb(43,43,43);\">Aerius cũng được chỉ định để giảm các triệu chứng liên quan đến mày đay như giảm ngứa, giảm kích cỡ và số lượng ban.</span><br><strong>Chống chỉ định</strong><span style=\"color:rgb(43,43,43);\"> (Khi nào không nên dùng thuốc này?)</span><br><span style=\"color:rgb(43,43,43);\">Quá mẫn với hoạt chất hoặc với bất kỳ thành phần nào của thuốc.</span><br><strong>Liều dùng</strong><br><span style=\"color:rgb(43,43,43);\">Người lớn và thanh thiếu niên (&gt; 12 tuổi): Một viên nén bao film Aerius 5mg hoặc 10ml (5mg) Aerius sirô, uống 1 lần/ngày uống cùng hoặc không cùng bữa ăn, để giảm các triệu chứng liên quan đến viêm mũi dị ứng (bao gồm viêm mũi dị ứng không liên tục và viêm mũi dị ứng kéo dài) và mày đay. Chỉ dùng đường uống.</span><br><span style=\"color:rgb(43,43,43);\">Trẻ từ 6 đến 11 tuổi: 5ml (2.5mg) Aerius sirô, uống 1 lần/ngày cùng hoặc không cùng bữa ăn, để giảm các triệu chứng liên quan đến viêm mũi dị ứng (bao gồm viêm mũi dị ứng không liên tục và viêm mũi dị ứng kéo dài) và mày đay.</span><br><span style=\"color:rgb(43,43,43);\">Trẻ từ 1 đến 5 tuổi: 2.5ml (1.25mg) Aerius sirô, uống 1 lần/ngày cùng hoặc không cùng bữa ăn, để giảm các triệu chứng liên quan đến viêm mũi dị ứng (bao gồm viêm mũi dị ứng không liên tục và viêm mũi dị ứng kéo dài) và mày đay.</span><br><span style=\"color:rgb(43,43,43);\">Trẻ từ 6 tháng đến 11 tháng tuổi: 2ml (1mg) Aerius sirô, uống 1 lần/ngày cùng hoặc không cùng bữa ăn, để giảm các triệu chứng liên quan đến viêm mũi dị ứng (bao gồm viêm mũi dị ứng không liên tục và viêm mũi dị ứng kéo dài) và mày đay.</span><br><span style=\"color:rgb(43,43,43);\">Viêm mũi dị ứng không liên tục (triệu chứng xuất hiện &lt; 4 ngày/tuần hoặc &lt; 4 tuần) nên được điều trị phù hợp dựa trên đánh giá tiền sử bệnh của bệnh nhân và nên ngừng điều trị khi hết triệu chứng và tái điều trị khi tái xuất hiện triệu chứng. Trong viêm mũi dị ứng kéo dài (triệu chứng xuất hiện &gt; 4 ngày/tuần và kéo dài &gt; 4 tuần), có thể điều trị liên tục trong thời gian tiếp xúc với dị nguyên.</span><br><strong>Tác dụng phụ</strong><br><span style=\"color:rgb(43,43,43);\">Trong các thử nghiệm lâm sàng trên bệnh nhi, Aerius sirô được dùng cho 246 trẻ từ 6 tháng đến 11 tuổi. Nhìn chung tỷ lệ tác dụng bất lợi ở trẻ 2 đến 11 tuổi tương tự ở cả hai nhóm dùng Aerius sirô và placebo. Ở trẻ em và trẻ nhỏ từ 6 đến 23 tháng, những tác dụng bất lợi thường gặp nhất được báo cáo nhiều hơn so với placebo là tiêu chảy (3.7%), sốt (2.3%) và mất ngủ (2.3%).</span><br><span style=\"color:rgb(43,43,43);\">Trong những thử nghiệm lâm sàng với các chỉ định về viêm mũi dị ứng và mày đay tự phát mạn tính, với liều đề nghị 5mg/ngày, những tác dụng ngoại ý do Aerius viên nén được báo cáo ở 3% bệnh nhân và cao hơn so với bệnh nhân dùng placebo. Những tác dụng bất lợi thường gặp nhất với tần xuất cao hơn placebo là mệt mỏi (1.2%), khô miệng (0.8%), và nhức đầu (0.6%).</span><br><span style=\"color:rgb(43,43,43);\">Trong quá trình lưu hành desloratadine trên thị trường, rất hiếm có báo cáo về phản ứng quá mẫn (kể cả phản vệ và phát ban), nhanh nhịp tim, đánh trống ngực, tăng hoạt động tâm thần vận động, cơn động kinh, buồn ngủ, tăng các men gan, viêm gan và tăng bilirubin.</span><br><i>Xin thông báo cho bác sĩ những biểu hiện bất lợi trong thời gian dùng thuốc.</i><br><strong>Thận trọng</strong><span style=\"color:rgb(43,43,43);\"> (Những lưu ý khi dùng thuốc)</span><br><span style=\"color:rgb(43,43,43);\">Chưa đánh giá tính an toàn và hiệu quả của Aerius viên nén ở trẻ dưới 12 tuổi.</span><br><strong>Phụ nữ có thai và cho con bú</strong><br><span style=\"color:rgb(43,43,43);\">Nhìn chung không thấy ảnh hưởng đến khả năng sinh sản ở chuột với liều desloratadine cao gấp 34 lần liều lâm sàng đề nghị cho người.</span></p><p><strong>Bảo quản</strong><span style=\"color:rgb(43,43,43);\">: Bảo quản từ 2 đến 30°C. Tránh ẩm</span><br><strong>Đóng gói</strong><span style=\"color:rgb(43,43,43);\">: Hộp 1 vỉ x 10 viên</span><br><strong>Thương hiệu:</strong><span style=\"color:rgb(43,43,43);\"> Merck Sharp &amp; Dohme</span><br><strong>Nơi sản xuất:</strong><span style=\"color:rgb(43,43,43);\"> Schering-Plough Labo N.V., (Thái Lan)</span><br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-04-27 12:31:19', '2024-05-13 14:56:56'),
(6, 2, 9, 5, 5, 'P21806', 'Nước uống Welson Beauty 10x Water Boost hỗ trợ đẹp da (Hộp 6 chai x 50ml)', 'Welson Beauty 10x Water Boost', 'welson-beauty-10x-water-boost', 595000, 'Không có', 0, 'Hộp', 'Hộp 6 chai x 50ml', '12', 'Sản phẩm giúp cung cấp nước và độ ẩm, tăng độ đàn hồi tốt và cải thiện các sắc tố da một cách hiệu quả.', 'danh-cho-phu-nu/welson-beauty-10x-water-boost.webp', '<h3><strong>Mô tả Nước uống bổ sung collagen Welson Beauty 10x Water Boost</strong></h3><p>Sở hữu một làn da căng bóng, mướt mát chuẩn \"glass skin\" luôn là ước mơ của mọi chị em. Da đẹp giúp nàng luôn tỏa sáng, tự tin \"cân\" mọi góc camera thường lẫn mặt mộc. Thế nên, trong tủ đồ skincare không thể thiếu sản phẩm dưỡng và cấp ẩm hiệu quả để giữ cho làn da luôn ẩm mịn, căng mướt. Đặc biệt, những sản phẩm cấp ẩm từ bên trong bổ trợ cùng các bước dưỡng da từ bên ngoài còn giúp nàng chăm da hiệu quả, tiện lợi, dùng được cho mọi loại da. Tiêu biểu phải kể đến nước uống collagen cấp ẩm Welson Beauty 10X Water Boost - sản phẩm hot hit dạo gần đây đã nhận được nhiều đánh giá tích cực từ phái đẹp.</p><h3><strong>Thành phần giàu dưỡng chất cho da</strong></h3><p>Với công thức vượt trội, dây chuyền sản xuất khép kín và được nghiên cứu, thử nghiệm kỹ lưỡng và nghiêm ngặt từ những chuyên gia hàng đầu của xứ sở kim chi, sản phẩm được đánh giá là đem lại hiệu quả tốt trên da.</p><p>Trong 1 chai dung tích 50ml chứa collagen peptide (collagen da cá) 5000mg, nước lê cô đặc 3500mg, nước lựu cô đặc 2500mg, nước chanh cô đặc 500mg, vitamin C (Acid L-ascorbic) 200mg, axit hyaluronic 200mg, elastin thủy phân 50mg, biotin (D-biotin) 0.5mg, vitamin E (D-alpha-tocopherol) 0.5mg và các chất điều chỉnh độ acid, bảo quản và tạo ngọt tổng hợp.</p><p>Mỗi chai nước uống có dung tích 50ml và được đóng gói thành 6 chai trong một hộp.</p><p>&nbsp;</p><h3><strong>Công dụng của sản phẩm nước uống collagen Welson Beauty 10X Water Boost</strong></h3><p>Sản phẩm nước uống collagen Welson Beauty 10X Water Boost mang đến nhiều công dụng tuyệt vời cho người dùng như:</p><p>Cung cấp hàm lượng Hyaluronic Acid cao, giúp da căng bóng và ẩm mịn từ sâu bên trong.</p><p>Hỗ trợ thúc đẩy sản sinh collagen tự nhiên bên trong cơ thể, làm gia tăng độ đàn hồi cho da.</p><p>Cung cấp và duy trì độ ẩm cần thiết cho da, giảm thiểu tình trạng da khô ráp hay sần sùi.</p><p>Hỗ trợ tăng cường hệ miễn dịch và giúp mang lại giấc ngủ ngon.</p><h3><strong>Cách sử dụng nước uống bổ sung collagen Welson Beauty 10x Water Boost</strong></h3><p><strong>Đối tượng nào nên sử dụng sản phẩm?</strong></p><p>Sản phẩm hướng tới những đối tượng sau:</p><ul><li>Dành cho người từ 18 tuổi trở lên</li><li>Những người có làn da khô, thiếu ẩm, xỉn màu</li><li>Những người mong muốn sở hữu làn da khỏe đẹp</li></ul><p><strong>Hướng dẫn sử dụng</strong></p><p>Hãy sử dụng nước uống bổ sung collagen Welson Beauty 10x Water Boost theo hướng dẫn sau để phát huy hiệu quả tốt nhất:</p><p>Mỗi ngày uống 1 chai sau bữa ăn, nên uống sau khi ăn 3 tiếng</p><p>Nên sử dụng sản phẩm vào buổi tối, trước khi đi ngủ vì đây là tời điểm “vàng” để collagen phát huy công dụng</p><p>Lắc nhẹ chai trước khi uống</p><p>Ngon hơn khi uống lạnh</p><p>Bạn nên uống Collagen Welson liên tục trong vòng 3 tháng, sau đó ngưng lại 1 tháng để cơ thể tự hấp thu trọn vẹn lượng Collagen rồi dùng lại với liều uống duy trì. Đây là cách sử dụng sản phẩm sao cho hiệu quả cao nhất.</p><h3><strong>Bảo quản sản phẩm như thế nào?</strong></h3><p>Sản phẩm này được bảo quản nơi khô ráo, tránh ánh nắng trực tiếp, nhiệt độ ẩm và nhiệt độ cao. Sử dụng ngay sau khi mở bao bì và để xa tầm tay trẻ em.</p><p>Những lưu ý cần biết khi sử dụng sản phẩm</p><p>Không nên uống collagen khi đói vì sẽ giảm lượng collagen. Ở thời điểm này, cơ thể cũng khó hấp thu collagen</p><p>Chống chỉ định với những người mẫn cảm với các thành phần trong Collagen Welson.</p><p>Ngưng sử dụng ngay khi xuất hiện những triệu chứng bất thường như dị ứng, mẩn đỏ, buồn nôn,…</p><h3><strong>Thông tin sản xuất nước uống bổ sung collagen Welson Beauty 10x Water Boost</strong></h3><p><strong>Quy cách đóng gói:</strong> 50ml x 6 chai</p><p><strong>Xuất xứ thương hiệu:</strong> Hàn Quốc</p><p><strong>Cơ sở phân phối:&nbsp;</strong>Công ty TNHH Faroson<br>Địa chỉ: 163 Trần Huy Liệu, Phường 8, Quận Phú Nhuận, Thành phố Hồ Chí Minh, Việt Nam</p><p><strong>Sản xuất bởi:&nbsp;</strong>Naturetech Co., Ltd.<br>Địa chỉ: 29-8, Yongjeong-gil, Chopyeong-myeon, Jincheon-gun, Chungcheongbuk-do, Hàn Quốc.<br>&nbsp;</p>', 100, 1, '2024-04-27 12:41:51', '2024-04-27 12:41:51'),
(7, 2, 27, 5, 5, 'P26079', 'Viên uống WELSON BEAUTY Hyaluron Vita Boost 240mg hỗ trợ cấp ẩm đẹp da (Hộp 60 viên)', 'WELSON BEAUTY Hyaluron Vita Boost 240mg', 'welson-beauty-hyaluron-vita-boost-240mg', 795000, 'Không có', 0, 'Hộp', 'Hộp 60 viên', '12', 'Với cơ chế 2 tầng cấp ẩm đặc biệt, cấp ẩm sâu vào từng lớp tế bào, khiến làn da bừng sáng rạng rỡ, tươi tắn chuẩn Hàn. Tăng độ ẩm cho da, giúp làm đẹp da. Hỗ trợ chống oxy hoá', 'lam-dep/welson-beauty-hyaluron-vita-boost-240mg.png', '<p><strong>Thành phần</strong></p><p>Hàm lượng Trong 2 viên nang mềm (không bao gồm vỏ nang) có chứa:</p><p>Hyaluronic acid 240 mg</p><p>Vitamin E (D- α-Tocopherol) 5,5 mg α-TE</p><p>Vitamin A (Retinyl palmitate) 500 μg RE</p><p>Vitamin C (ascorbic acid) 4,8 mg</p><p>Dầu cám gạo 1216 mg</p><p>Chiết xuất nấm men (có chứa L-Glutathione) 3,2 mg</p><p>Chiết xuất khoai nưa (có chứa Glucosylceramide) 1 mg</p><p>Phụ liệu: Chất làm dày ( Sáp ong), chất nhũ hóa (lecithin),vỏ nang [Gelatin, chất làm ẩm (glycerin), nước tinh khiết, men gạo đỏ].\"</p><p><strong>Công dụng</strong></p><p>Với cơ chế 2 tầng cấp ẩm đặc biệt, cấp ẩm sâu vào từng lớp tế bào, khiến làn da bừng sáng rạng rỡ, tươi tắn chuẩn Hàn.</p><p>Tầng 1: 240mg HA: Hàm lượng tối ưu giúp cấp ẩm toàn diện.</p><p>Tầng 2: Ceramides (Chiết xuất Konjac &amp; dầu cám gạo): Giúp phục hồi hàng rào da cho làn da được cấp ẩm và khoá ẩm hiệu quả.</p><p>Ngoài ra còn có chứa các thành phần bổ sung nuôi dưỡng làn da toàn diện từ:</p><p>+ Vitamin A và Vitamin E: Hỗ trợ chống oxy hoá/ lão hoá da</p><p>+ Glutathione (Chiết xuất nấm men) và Vitamin C: Hỗ trợ chống sạm da</p><p>Tăng độ ẩm cho da, giúp làm đẹp da. Hỗ trợ chống oxy hoá</p><p><strong>Đối tượng sử dụng</strong></p><p>Dùng cho người trưởng thành, da khô, thiếu ẩm, muốn làm đẹp da.</p><p><strong>Cách sử dụng</strong></p><p>Uống 2 viên mỗi ngày một lần với nước</p><p>Lưu ý: Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</p><p><strong>Chống chỉ định</strong></p><p>Không sử dụng cho người có mẫn cảm, kiêng kỵ với bất kỳ thành phần nào của sản phẩm.</p><p>Người đang dùng thuốc, hỏi ý kiến chuyên gia y tế trước khi sử dụng. Không dùng cho phụ nữ có thai hoặc đang cho con bú. Sản phẩm này không phải là thuốc để phòng ngừa hoặc điều trị bệnh.</p><p><strong>Bảo quản:</strong> Lưu trữ và phân phối ở nơi mát mẻ, tránh ánh nắng trực tiếp và để xa tầm tay trẻ em.</p><p><strong>Số Giấy công bố Số: </strong>4666/2023/ĐKSP</p><p><strong>Công ty chịu trách nhiệm về SP:</strong>&nbsp;CÔNG TY TNHH HANAMIA</p><p>Địa chỉ: 99 đường 44, Phường 10, Quận 6, Thành phố Hồ Chí Minh, Việt Nam.\"</p><p><strong>Công ty phân phối: </strong>CÔNG TY TNHH PROFA</p><p>Địa chỉ: 163 Trần Huy Liệu, phường 8, quận Phú Nhuận, Thành phố Hồ Chí Minh, Việt Nam.</p><p><strong>Thương hiệu: </strong>Welson Beauty</p><p><strong>Nơi sản xuất: </strong>Hàn Quốc</p><p><strong>Tên Nhà sản xuất: </strong>CNS Pharm Korea CO., LTD</p><p><i>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</i></p>', 99, 1, '2024-04-27 12:50:04', '2024-05-02 05:12:40'),
(8, 2, 17, 6, 5, 'P26086', 'Viên uống BLISSBERRY Purehealth Cholesterol Care K22 hỗ trợ hạn chế quá trình oxy hóa và giúp giảm cholesterol', 'BLISSBERRY Purehealth Cholesterol Care K22', 'blissberry-purehealth-cholesterol-care-k22', 483000, 'Không có', 0, 'Hộp', 'Hộp 60 viên', '12', 'Hỗ trợ hạn chế quá trình oxy hóa, giúp giảm cholesterol trong máu', 'tim-mach-huyet-ap/blissberry-purehealth-cholesterol-care-k22.jpg', '<p><strong>Thành phần</strong></p><p>Trong 2 viên nang mềm chứa:</p><p>Bột chiết xuất gạo đỏ lên men 133.34 mg</p><p>(tương đương Monacolin K 4mg)</p><p>Dầu cá tinh luyện (EPA, DHA 70%) 714.28 mg</p><p>(tương đương EPA, DHA 500mg)</p><p>D-alpha tocopherol 7.65mg α-TE</p><p>(tương đương Vitamin E 4.1mg α-TE)</p><p>Chiết xuất sáp mía 22.22 mg</p><p>(tương đương Policosanol 20mg)</p><p>Phụ liệu: Chất nhũ hóa (Lecithin đậu nành), Dầu hạt nho, Chất nhũ hóa (Sáp ong). Vỏ viên nang: Nước tinh khiết, Phẩm màu nhân tạo (Titanium Dioxide), Gelatin, Chất nhũ hóa (Glycerin), Phẩm màu tự nhiên (Màu Cacao), Phẩm màu đỏ nhân tạo số 40 (Allura Red, Số CAS: 25956-17-6).</p><p><strong>Công dụng:</strong> Hỗ trợ hạn chế quá trình oxy hóa, giúp giảm cholesterol trong máu.</p><p><strong>Đối tượng sử dụng: </strong>Người trưởng thành.</p><p><strong>Cách sử dụng:</strong> Ngày 1 lần, mỗi lần uống 2 viên với nước. Không vượt quá liều khuyến nghị.</p><p><strong>Lưu ý:</strong></p><p>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh. Không sử dụng cho người có mẫn cảm, kiêng kỵ với bất kỳ thành phần nào của sản phẩm. Nếu bạn có cơ địa cụ thể hoặc cơ địa dị ứng, hãy kiểm tra các thành phần trước khi dùng. Vui lòng kiểm tra ngày hết hạn và dùng theo số lượng và phương pháp sử dụng. Tham khảo ý kiến bác sĩ chuyên khoa khi dùng thuốc (thuốc chống đông máu, thuốc chống kết tập tiểu cầu, thuốc hạ huyết áp, thuốc khác)</p><p><strong>Chống chỉ định:</strong> Người mẫn cảm, kiêng kỵ với bất kỳ thành phần nào của sản phẩm.</p><p><strong>Thận trọng:</strong> Cơ địa cụ thể hoặc cơ địa dị ứng. Người đang sử dụng thuốc.</p><p><strong>Bảo quản:</strong> Bảo quản kín. Tránh xa nơi ẩm thấp, nơi có nhiệt độ cao và để xa tầm tay trẻ em. Bảo quản nơi khô ráo và thoáng mát. Tránh ánh nắng mặt trời trực tiếp.</p><p><strong>Hạn sử dụng:</strong> 24 tháng kể từ ngày sản xuất. NSX và HSD được in trên bao bì sản phẩm.</p><p><strong>Quy cách đóng gói:</strong> Hộp 60 viên</p><p><strong>Thương hiệu:</strong> BLISSBERRY HEALTH &amp; BEAUTY</p><p><strong>Nhà sản xuất: </strong>CNS PHARM KOREA CO., LTD</p><p><strong>Nơi sản xuất:</strong> HÀN QUỐC</p><p><strong>Công ty chịu trách nhiệm sản phẩm: </strong>CÔNG TY TNHH MỸ PHẨM MBB</p><p><strong>Công ty phân phối sản phẩm: </strong>CÔNG TY CỔ PHẦN MBB RETAIL</p><p><strong>Số Giấy công bố:</strong> 1284/2022/ĐKSP</p><p><strong>Số Giấy XNQC: </strong>1719/2022/XNQC-ATTP</p><p><i>Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</i></p><p><i>Để xa tầm tay trẻ em. Đọc kỹ hướng dẫn sử dụng trước khi dùng.</i></p>', 99, 1, '2024-04-27 13:31:11', '2024-05-13 04:05:44'),
(9, 2, 17, 7, 6, 'P24909', 'Viên uống Blackmores Cholesterol Health hỗ trợ giảm cholesterol (Hộp 60 viên)', 'Blackmores Cholesterol Health', 'blackmores-cholesterol-health', 683400, 'Không có', 0, 'Hộp', 'Hộp 60 viên', '12', 'Hỗ trợ hạn chế quá trình oxy hóa, giúp giảm cholesterol trong máu', 'tim-mach-huyet-ap/blackmores-cholesterol-health.webp', '<h3><strong>Thành phần của Blackmores Cholesterol Health</strong></h3><p>Blackmores Cholesterol Health là một sản phẩm tự nhiên được chiết xuất từ các thành phần thiên nhiên như dầu cá, vitamin B3, canxi và magie. Các thành phần này đã được chứng minh là có tác dụng giúp giảm mức độ cholesterol trong máu và hỗ trợ sức khỏe tim mạch.</p><h3><strong>Công dụng</strong></h3><p>Hỗ trợ giảm cholesterol trong máu, giảm nguy cơ bệnh tim mạch.</p><h3><strong>Cách thức hoạt động của Blackmores Cholesterol Health</strong></h3><p>Blackmores Cholesterol Health có tác dụng làm giảm mức độ cholesterol trong máu bằng cách ức chế sự hấp thụ cholesterol từ thực phẩm vào máu và kích thích quá trình tiêu hóa và loại bỏ cholesterol dư thừa. Ngoài ra, các thành phần trong sản phẩm còn có tác dụng làm giảm lượng cholesterol được sản xuất bởi gan, giúp duy trì mức độ cholesterol trong máu ở mức an toàn.</p><h3><strong>Hướng dẫn sử dụng và lưu ý</strong></h3><p><strong>Hướng dẫn sử dụng</strong></p><p>Người lớn: Uống 1 viên/lần x 2 lần/ngày cùng bữa ăn hoặc theo chỉ dẫn bác sĩ.</p><p>Trẻ em dưới 12 tuổi: Chỉ sử dụng nếu có chỉ định của bác sĩ.</p><p><strong>Lưu ý</strong></p><p>Không nên sử dụng khi mang thai hoặc cho con bú.</p><p>Không khuyến cáo bổ sung quá 3g phytosterol/ngày từ tất cả các nguồn.</p><p>Sản phẩm không dùng điều trị cholesterol cao, cần tham khảo lời khuyên của bác sĩ.</p><p>Không dùng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.</p><p><strong>Bảo quản</strong></p><p>Dưới 30 độ C, nơi khô ráo, tránh ánh sáng trực tiếp.</p><h3><strong>Cholesterol và tác động của nó đến sức khỏe tim mạch</strong></h3><p><strong>Cholesterol là gì?</strong></p><p>Cholesterol là một loại chất béo không tan trong nước, được tạo ra bởi gan và cũng có thể được hấp thụ từ thực phẩm chúng ta ăn. Nó là một thành phần quan trọng của tế bào và được sử dụng để sản xuất các hormone quan trọng như estrogen và testosterone. Tuy nhiên, khi lượng cholesterol trong máu tăng cao, nó có thể gây ra các vấn đề về sức khỏe tim mạch.</p><p><strong>Tác động của cholesterol đến sức khỏe tim mạch</strong></p><p>Khi mức độ cholesterol trong máu tăng, nó có thể bám vào thành mạch và hình thành các cặn bã, gây tắc nghẽn và làm giảm lưu lượng máu đi qua. Điều này có thể dẫn đến các vấn đề về sức khỏe tim mạch như bệnh động mạch và đột quỵ. Ngoài ra, một số loại cholesterol có thể gây tổn thương cho mao mạch và gây ra các vấn đề về sức khỏe tim mạch khác.</p><h2><strong>Các câu hỏi thường gặp về Blackmores Cholesterol Health</strong></h2><h3><strong>Blackmores Cholesterol Health có phù hợp cho những người nào?</strong></h3><p>Sản phẩm này phù hợp cho những người có mức độ cholesterol trong máu cao hoặc muốn duy trì mức độ cholesterol trong máu ở mức an toàn để bảo vệ sức khỏe tim mạch.</p><h3><strong>Có cần kết hợp với chế độ ăn uống và lối sống lành mạnh khi sử dụng Blackmores Cholesterol Health?</strong></h3><p>Để đạt hiệu quả tối đa, việc kết hợp với chế độ ăn uống lành mạnh và lối sống tích cực sẽ giúp cho quá trình giảm cholesterol trong máu diễn ra nhanh chóng và hiệu quả hơn.</p><h3><strong>Có tác dụng phụ nào khi sử dụng Blackmores Cholesterol Health?</strong></h3><p>Sản phẩm này được chiết xuất từ các thành phần tự nhiên và không gây tác dụng phụ đáng kể. Tuy nhiên, nếu bạn có bất kỳ vấn đề sức khỏe nào hoặc đang dùng thuốc điều trị, nên tham khảo ý kiến ​​của bác sĩ trước khi sử dụng sản phẩm.</p><h3><strong>Có thể sử dụng Blackmores Cholesterol Health trong thời gian dài không?</strong></h3><p>Có thể sử dụng sản phẩm này trong thời gian dài để duy trì mức độ cholesterol trong máu ở mức an toàn. Tuy nhiên, nên tham khảo ý kiến ​​của bác sĩ nếu bạn muốn sử dụng sản phẩm trong thời gian dài.</p><h3><strong>Sản phẩm có phù hợp cho những người đang dùng thuốc điều trị cholesterol cao?</strong></h3><p>Nên tham khảo ý kiến ​​của bác sĩ trước khi sử dụng sản phẩm nếu bạn đang dùng thuốc điều trị cholesterol cao để đảm bảo không có tương tác nào giữa sản phẩm và thuốc.</p><p>Blackmores Cholesterol Health là một giải pháp tự nhiên hiệu quả để giúp giảm mức độ cholesterol trong máu và bảo vệ sức khỏe tim mạch. Với các thành phần chiết xuất từ thiên nhiên và không gây tác dụng phụ đáng kể, sản phẩm này là lựa chọn lý tưởng cho những người muốn duy trì mức độ cholesterol trong máu ở mức an toàn. Tuy nhiên, việc kết hợp với chế độ ăn uống lành mạnh và lối sống tích cực sẽ giúp cho quá trình giảm cholesterol trong máu diễn ra hiệu quả hơn. Nếu bạn có bất kỳ thắc mắc nào về sản phẩm, hãy tham khảo ý kiến ​​của bác sĩ để được tư vấn cụ thể. Hãy chăm sóc sức khỏe tim mạch của bạn bằng cách duy trì mức độ cholesterol trong máu ở mức an toàn với Blackmores Cholesterol Health.</p>', 100, 1, '2024-04-27 13:37:47', '2024-04-27 13:37:47'),
(10, 3, 20, 8, 7, 'P03833', 'Lăn khử mùi Nivea Extra Whitening Roll On (50ml)', 'Nivea Extra Whitening Roll On', 'nivea-extra-whitening-roll-on', 75600, 'Không có', 0, 'Chai', '50ml', '24', 'Sản phẩm khử mùi dùng cho vùng da dưới cánh tay, giúp giảm tiết mồ hôi và giảm mùi mồ hôi cơ thể, cho vùng da dưới cánh tay trắng mịn.', 'khu-mui/nivea-extra-whitening-roll-on.png', '<p><strong>Thành phần</strong></p><p>Aqua, Aluminum Chlorohydrate, PPG-15 Stearyl Ether, Steareth-2, Steareth-21, Parfum, Trisodium EDTA, Persea Gratissima Oil...</p><p><strong>Công dụng</strong></p><p>Sản phẩm khử mùi dùng cho vùng da dưới cánh tay, giúp giảm tiết mồ hôi và giảm mùi mồ hôi cơ thể, cho vùng da dưới cánh tay trắng mịn.</p><p><strong>Cách sử dụng</strong></p><p>Lăn đều lên vùng da dưới cánh tay sau khi tắm hoặc trước khi ra đường.</p><p><strong>Bảo quản&nbsp;</strong></p><p>Nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp.</p><p><strong>Dung tích: </strong>Chai 50ml</p><p><strong>Xuất xứ thương hiệu: </strong>Đức</p><p><strong>Sản xuất tại:</strong> Thái Lan</p><p><strong>Nhà sản xuất:</strong> BEIERSDORF CO.,LTD</p><p><strong>Công ty chịu trách nhiệm về SP:</strong>&nbsp;Công ty TNHH BEIERSDORF Việt Nam</p><p>Lầu 18, số 72-74, Đường Nguyễn Thị Minh Khai, phường 6, quận 3, thành phố Hồ Chí Minh</p><p><strong>Số Giấy công bố: </strong>109036/15/CBMP-QLD</p><p><i>*cam kết chỉ bán sản phẩm còn dài hạn sử dụng.</i></p>', 99, 1, '2024-04-27 13:43:23', '2024-05-13 04:20:42'),
(11, 3, 20, 8, 7, 'P03828', 'Xịt ngăn mùi Nivea Anti-Perspirant Extra Whitening (150ml)', 'Nivea Anti-Perspirant Extra Whitening', 'nivea-anti-perspirant-extra-whitening', 928000, 'Không có', 0, 'Chai', '150ml', '12', 'Xịt ngăn mùi dùng cho vùng da dưới cánh tay, giúp da khô thoáng, dưỡng ẩm và dưỡng trắng da.', 'khu-mui/nivea-anti-perspirant-extra-whitening.webp', '<p><strong>Thành phần</strong></p><p>Propane, Butane, Isobutane, Cyclomethicone, Aluminum Chlorohydrate, Isopropyl Palmitate, Parfum, Disteardimonium Hectorite, Dimethicone...</p><p><strong>Công dụng</strong></p><p>Xịt ngăn mùi dùng cho vùng da dưới cánh tay, giúp da khô thoáng, dưỡng ẩm và dưỡng trắng da.</p><p><strong>Cách sử dụng</strong></p><p>Lắc chai và xịt đều lên vùng da dưới cánh tay mỗi ngày.</p><p><strong>Bảo quản</strong></p><p>Nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp.</p><p><strong>Dung tích:&nbsp;</strong>150ml</p><p><strong>Xuất xứ thương hiệu:</strong> Đức</p><p><strong>Sản xuất tại: </strong>Thái Lan</p><p><strong>Nhà sản xuất:</strong>&nbsp;CYBERPAX CO.,LTD</p><p><strong>Công ty chịu trách nhiệm về SP:</strong>&nbsp;Công ty TNHH BEIERSDORF Việt Nam</p><p>Lầu 18, số 72-74, Đường Nguyễn Thị Minh Khai, phường 6, quận 3, thành phố Hồ Chí Minh</p><p><strong>Số Giấy công bố:</strong> 35285/17/CBMP-QLD</p>', 100, 1, '2024-04-27 13:48:03', '2024-04-27 13:48:03'),
(12, 3, 20, 8, 7, 'P16681', 'Xịt khử mùi dưỡng trắng hương hoa hồng Nivea Whitening Deep Serum Hokkaido Rose Spray (150ml)', 'Nivea Whitening Deep Serum Hokkaido Rose Spray', 'nivea-whitening-deep-serum-hokkaido-rose-spray', 131000, 'Không có', 0, 'Chai', '150ml', '12', 'Xịt khử mùi dùng cho vùng da dưới cánh tay, giúp giảm mùi cơ thể, mang lại làn da trắng mịn và khô thoáng.', 'khu-mui/nivea-whitening-deep-serum-hokkaido-rose-spray.webp', '<p><strong>Thành phần</strong><br>Butane, Isobutane, Propane, Cyclomethicone, Rose Extract, Isopropyl Palmitate,..</p><p><strong>Công dụng</strong><br>Xịt khử mùi dùng cho vùng da dưới cánh tay, giúp giảm mùi cơ thể, mang lại làn da trắng mịn và khô thoáng.</p><p><strong>Hướng dẫn sử dụng</strong><br>Lắc kỹ trước khi sử dụng, giữ đầu xịt cách vùng da dưới cánh tay 15cm và xịt đều nhẹ. Đợi sản phẩm khô hoàn toàn. Không dùng cho vùng da bị trầy xước hay kích ứng</p><p><strong>Bảo quản</strong><br>Tránh xa những nơi có nhiệt độ cao, bề mặt nóng, có tia lửa, ngọn lửa đang cháy và các nguồn gây cháy khác.<br>Tránh ánh nắng trực tiếp. Tránh xa tầm tay trẻ em</p><p><strong>Dung tích:</strong> 150ml</p><p><strong>Xuất xứ thương hiệu:</strong> Đức</p><p><strong>Sản xuất tại:</strong> Thái Lan</p><p><strong>Số giấy công bố:</strong>&nbsp;92623/19/CBMP-QLD</p>', 100, 1, '2024-04-27 13:50:56', '2024-04-27 13:50:56'),
(13, 3, 20, 8, 7, 'P07609', 'Lăn khử mùi ngọc trai sáng mịn Nivea Pearl & Beauty (25ml)', 'Nivea Pearl & Beauty', 'nivea-pearl-beauty', 49500, 'Không có', 0, 'Chai', '25ml', '12', 'Lăn khử mùi dùng cho vùng da dưới cánh tay, giúp giảm tiết mồ hôi và giảm mùi mồ hôi cơ thể, đồng thời dưỡng ẩm cho da, mang lại làn da mịn màng.', 'khu-mui/nivea-pearl-beauty.png', '<p><strong>Thành phần</strong></p><p>Aqua, Aluminum Chlorohydrate, PPG-15 Stearyl Ether, Steareth-2, Steareth-21, Parfum, Trisodium EDTA, Persea Gratissima Oil, Hydrolyzed Pearl</p><p><strong>Công dụng</strong></p><p>Lăn khử mùi dùng cho vùng da dưới cánh tay, giúp giảm tiết mồ hôi và giảm mùi mồ hôi cơ thể, đồng thời dưỡng ẩm cho da, mang lại làn da mịn màng.</p><p><strong>Cách sử dụng:&nbsp;</strong>Lăn đều lên vùng da dưới cánh tay sau khi tắm hoặc trước khi ra đường.</p><p><strong>Bảo quản:</strong>&nbsp;Nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp.</p><p><strong>Dung tích: </strong>Chai 25ml</p><p><strong>Xuất xứ thương hiệu:</strong> Đức</p><p><strong>Sản xuất tại:</strong> BEIERSDORF (THAILAND) CO.,LTD</p><p><strong>Công ty chịu trách nhiệm về SP:&nbsp;</strong>Công ty TNHH Beiersdorf Việt Nam</p><p><strong>Số giấy công bố:</strong>&nbsp;11301/16/CBMP-QLD</p>', 100, 1, '2024-04-27 13:53:22', '2024-04-27 13:53:22'),
(14, 4, 21, 9, 8, 'P00169', 'Dầu mát-xa và dưỡng ẩm Johnson Baby Oil (200ml)', 'Johnson Baby Oil', 'johnson-baby-oil', 115000, 'Không có', 0, 'Chai', '200ml', '12', 'Sản phẩm dùng thoa lên da, giúp giữ ẩm, làm giảm và phòng chống nứt nẻ da.', 'em-be/johnson-baby-oil.webp', '<p><strong>Thành phần</strong></p><p>Mineral Oil, Fragrance.</p><p><strong>Công dụng</strong></p><p>Sản phẩm dùng thoa lên da, giúp giữ ẩm, làm giảm và phòng chống nứt nẻ da.</p><p><strong>Cách dùng</strong></p><p>Xoa bóp nhẹ nhàng trên da trước khi tắm để làm ấm bé, hoặc ngay sau khi tắm để làm ấm cho bé.</p><p><strong>Bảo quản</strong></p><p>Nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp.</p><p><strong>Dung tích</strong>: 200ml</p><p><strong>Xuất xứ thương hiệu: </strong>Hoa Kỳ</p><p><strong>Sản xuất tại: </strong>Thái Lan</p><p><strong>Sản xuất tại</strong>: JOHNSON &amp; JOHNSON (Thailand) LIMITED</p><p><strong>Công ty chịu trách nhiệm về SP:</strong> Công ty TNHH Johnson &amp; Johnson Việt Nam</p><p><strong>Số GPCB:</strong> 82543/13/CBMP-QLD</p>', 99, 1, '2024-04-27 13:57:50', '2024-05-13 04:07:10'),
(15, 4, 21, 9, 4, 'P27206', 'Kem dưỡng da chứa sữa và gạo Johnson baby (Tuýp 50g)', 'Johnson baby', 'johnson-baby', 66000, 'Không có', 0, 'Tuýp', 'Tuýp 50g', '36', 'Kem giữ ẩm, giúp cho da mềm mịn, chống da khô, nứt nẻ', 'em-be/johnson-baby.jpg', '<p><strong>Thành phần</strong></p><p>Water, Isopropyl Palmitate, Glycerin, Glyceryl Stearate, Cetyl Alcohol, Cetearyl Alcohol, Cocos Nucifera (Coconut) Oil, Dimethicone, Palmitic Acid, Stearic Acid, Phenoxyethanol, Polysorbate 20, Magnesium Aluminum Silicate, Fragrance, Carbomer, p-Anisic Acid, Xanthan Gum, Sodium Hydroxide, Ethylhexylglycerin, Panthenol, Sodium Ascorbyl Phosphate, Tocopheryl Acetate, Hydrolyzed Rice Bran Protein, Milk Protein, Magnesium Aspartate, Zinc Gluconate, Copper Gluconate</p><p><strong>Công dụng:</strong> Kem giữ ẩm, giúp cho da mềm mịn, chống da khô, nứt nẻ</p><p><strong>Đối tượng sử dụng:</strong> mẹ và bé</p><p><strong>Giới tính sử dụng:</strong> Nam,Nữ,Em Bé</p><p><strong>Độ tuổi sử dụng: </strong>Người Lớn và Trẻ Em</p><p><strong>Loại da: </strong>Da thường, da nhạy cảm</p><p><strong>Dạng bào chế:</strong> Lotion</p><p><strong>Cách sử dụng: </strong>Thoa lên da</p><p><strong>Bảo quản: </strong>Nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp.</p><p><strong>Quy cách đóng gói: </strong>Tuýp 50g</p><p><strong>Hạn sử dụng:</strong> 3 năm</p><p><strong>Thương hiệu:</strong> Johnson Baby</p><p><strong>Nơi sản xuất:</strong> Thailand</p><p><strong>Tên Nhà sản xuất: </strong>Johnson Baby</p><p><strong>Công ty chịu trách nhiệm về SP:</strong> CÔNG TY TNHH JNTL CONSUMER HEALTH</p><p><strong>Công ty phân phối:</strong> DKSH Việt Nam</p><p><strong>Số Giấy công bố:</strong> 206213/23</p>', 100, 1, '2024-04-27 14:06:00', '2024-04-27 14:06:00'),
(16, 4, 21, 9, 8, 'P06799', 'Nước hoa em bé hương ngày hè Johnson Baby (125ml)', 'Johnson Baby 125ml', 'johnson-baby-125ml', 76544, 'Không có', 0, 'Chai', '125ml', '36', 'Sản phẩm dùng để làm thơm thân thể', 'em-be/johnson-baby-125ml.webp', '<p><strong>Thành phần:</strong>&nbsp;Water, Alcohol Denat. (Denatured Ethyl Alcohol), Fragrance, Denatonium Benzoate.</p><p><strong>Công dụng</strong><br>Sản phẩm dùng để làm thơm thân thể</p><p><strong>Hướng dẫn sử dụng: </strong>Thoa nước hoa lên quần áo bé thường xuyên cho bé luôn thơm tho suốt ngày.</p><p><strong>Bảo quản:</strong> Nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp.</p><p><strong>Dung tích:</strong> 125ml</p><p><strong>Xuất xứ thương hiệu:</strong> Mỹ</p><p><strong>Sản xuất tại: </strong>JOHNSON &amp; JOHNSON (CHINA) LTD. (Trung Quốc)</p><p><strong>Số Giấy công bố: </strong>110401/17/CBMP-QLD</p>', 100, 1, '2024-04-27 14:09:58', '2024-04-27 14:09:58'),
(17, 4, 21, 9, 8, 'P03632', 'Sữa tắm gội toàn thân Johnson\'s Top To Toe Baby Wash (500ml)', 'Johnson\'s Top To Toe Baby Wash', 'johnsons-top-to-toe-baby-wash', 171000, 'Không có', 0, 'Chai', '500ml', '36', 'Sữa tắm gội toàn thân, làm sạch tóc và thân thể.', 'em-be/johnsons-top-to-toe-baby-wash.webp', '<p><strong>Thành phần</strong></p><p>Water, PEG-80 Sorbitan Laurate, Cocamidopropyl Betaine, Sodium Trideceth Sulfate, PEG-150 Distearate, Citric Acid...</p><p><strong>Công dụng</strong></p><p>Sữa tắm gội toàn thân, làm sạch tóc và thân thể.</p><p><strong>Cách sử dụng</strong></p><p>Cho một ít sữa tắm vào lòng bàn tay của bạn, thoa trực tiếp lên tóc, toàn thân hoặc có thể hòa tan vào thau tắm cho bé. Tắm nhẹ nhàng cho bé bằng nước sạch.</p><p><strong>Bảo quản</strong></p><p>Nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp.</p><p><strong>Dung tích:</strong> 500ml</p><p><strong>Xuất xứ thương hiệu:</strong>&nbsp;Hoa Kỳ</p><p><strong>Sản xuất tại:</strong> Malaysia</p><p><strong>Công ty chịu trách nhiệm về SP:</strong> Công ty TNHH Johnson &amp; Johnson (Việt Nam)</p><p><strong>Số GPCB:</strong> 12955/16/CBMP-QLD</p>', 98, 1, '2024-04-27 14:14:25', '2024-05-13 04:07:10'),
(18, 5, 23, 10, 9, 'P24081', 'Nước tẩy trang làm sạch sâu Garnier Micellar Oil-Infused Cleansing Water 400ml', 'Garnier Micellar Oil-Infused Cleansing Water 400ml', 'garnier-micellar-oil-infused-cleansing-water-400ml', 219000, 'Không có', 0, 'Chai', '400ml', '24', 'Giúp nhẹ nhàng làm sạch da và lấy đi bụi bẩn, cặn trang điểm và dầu thừa sâu bên trong lỗ chân lông mà không gây khô da.', 'mat/garnier-micellar-oil-infused-cleansing-water-400ml.png', '<p><strong>Thành phần</strong></p><p>Thành phần chính:</p><ul><li>Công nghệ Micelles (Micellar Technology):&nbsp;phân tử Micelles lấy đi bụi bẩn sâu bên trong lỗ chân lông theo cơ chế hoạt động của nam châm khi lau nhẹ trên da mà không cần chà xát.</li><li>Dầu hạt Argan thiên nhiên:&nbsp;lấy đi cặn bẩn trang điểm và&nbsp;dưỡng ẩm cho da.</li><li>Công thức&nbsp;không chứa cồn, không gây kích ứng da.</li></ul><p>Thành phần đầy đủ:</p><p>Aqua / Water, Cyclopentasiloxane, Isohexadecane, Argania Spinosa Oil / Argania Spinosa Kernel Oil, Benzyl Alcohol, Benzyl Salicylate, Butyl Methoxydibenzoylmethane, Ci 60725 / Violet 2, Decyl Glucoside, Dipotassium Phosphate, Disodium Edta, Ethylhexyl Methoxycinnamate, Geraniol, Haematococcus Pluvialis / Haematococcus Pluvialis Extract, Hexylene Glycol, Limonene, Linalool, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Polyaminopropyl Biguanide, Potassium Phosphate, Sodium Chloride, Parfum / Fragrance.</p><p><strong>Công dụng</strong></p><p>Giúp nhẹ nhàng làm sạch da và lấy đi bụi bẩn, cặn&nbsp;trang điểm và dầu thừa sâu bên trong lỗ chân lông mà không gây khô da.</p><p><strong>Đối tượng sử dụng:</strong> Nam và nữ.</p><p><strong>Cách sử dụng&nbsp;</strong></p><p>Đổ&nbsp;Nước Tẩy Trang Garnier&nbsp;thấm ướt vừa đủ lên miếng bông tẩy trang (đối với sản phẩm&nbsp;Nước Tẩy Trang Garnier&nbsp;Micellar Oil Infused Cleansing Wate&nbsp;bạn cần lắc đều để 2 lớp dầu và dung dịch nước tẩy trang hoà vào nhau trước khi thấm ra miếng bông).</p><p>Nhẹ nhàng lau từ trong ra ngoài, từ dưới lên trên để tránh chảy xệ da mặt, hãy nhớ lau cả vùng cổ.</p><p>Riêng đối với vùng mắt, bạn hãy giữ miếng bông tẩy trang trên mắt vài giây để nước tẩy trang thấm sâu và cuốn đi lớp make-up dễ dàng hơn.</p><p>Sau khi tẩy trang bạn không cần thiết phải rửa lại với nước. Tuy nhiên, bạn cũng có thể&nbsp;dùng sản phẩm sữa rửa mặt dịu nhẹ yêu thích của bạn để nhẹ nhàng làm sạch da một lần nữa.</p><p>Tiếp tục các bước dưỡng da tiếp theo trong chu trình skincare của bạn.</p><p>Vì sản phẩm&nbsp;Micellar Cleansing Water&nbsp;an toàn và lành tính cho da nên dùng hằng ngày ngay cả khi không trang điểm.</p><p><strong>Quy cách đóng gói:</strong> Chai 400ml</p><p><strong>Thương hiệu:</strong>&nbsp;GARNIER</p><p><strong>Nơi sản xuất:</strong>&nbsp;China</p><p>Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</p><p>Để xa tầm tay trẻ em. Đọc kỹ hướng dẫn sử dụng trước khi dùng.</p>', 100, 1, '2024-04-27 14:21:55', '2024-04-27 14:21:55'),
(19, 5, 23, 10, 9, 'P25466', 'Tinh chất giảm mụn sáng da GARNIER (Chai 30ml)', 'GARNIER 30ml', 'garnier-30ml', 297000, 'Không có', 0, 'Chai', 'Chai 30ml', '24', 'Tinh chất giảm mụn sáng da Garnier Skin Naturals Bright Complete AntiAcne Booster Serum có công thức 4% [Vitamin C + BHA Salicylic + Niacinamide + AHA] giúp giảm mụn và làm giảm vết thâm sau mụn.', 'mat/garnier-30ml.png', '<p><strong>Thành phần</strong></p><p>Salicylic acid, Glycerin, PEG-60 Hydrogenated castor oil, Propanediol, Phytic Acid, Ascorbyl Glucoside, Hydroxypropyl guar, Hydroxyacetophenone, Niacinamide, Fragrance, Lactic Acid, Aqua/ Water, Sodium hydroxide, Alcohol Denat, Citrus Limon Fruit Extract.</p><p><strong>Công dụng</strong></p><p>Tinh chất giảm mụn sáng da Garnier Skin Naturals Bright Complete Anti-Acne Booster Serum với công thức 4% [Vitamin C + BHA Salicylic +&nbsp;Niacinamide&nbsp;+ AHA] giúp giảm mụn và làm giảm vết thâm sau mụn.&nbsp;</p><p><strong>Cách dùng</strong></p><p>Dùng sau khi làm sạch da bằng sữa rửa mặt.</p><p>Thoa lượng vừa đủ lên mặt, massage nhẹ nhàng để sản phẩm thẩm thấu. Dùng hàng ngày trước bước sử dụng&nbsp;kem dưỡng ẩm.</p><p>Khuyến nghị sử dụng thêm&nbsp;kem chống nắng&nbsp;vào buổi sáng để bảo vệ da.Lưu ý sử dụng: Chỉ dùng ngoài da, để xa tầm tay trẻ em, Ngưng sử dụng nếu xảy ra kích ứng.</p><p><strong>Loại da phù hợp</strong></p><p>Sản phẩm trị mụn cho da dầu, da hỗn hợp.</p><p>Da dầu thừa, lỗ chân lông to. Thường gặp các vấn đề về mụn.</p><p><strong>Bảo quản: </strong>Nơi khô ráo thoáng mát</p><p><strong>Đóng gói: </strong>30ml</p><p><strong>Thương hiệu:</strong> Garnier</p><p><strong>Nhà sản xuất: </strong>L\'OREAL</p><p><strong>Nơi sản xuất: </strong>Indonesia</p>', 100, 1, '2024-04-27 14:27:17', '2024-04-27 14:27:17');
INSERT INTO `thuoc` (`id`, `danhmuc_id`, `nhomthuoc_id`, `hangsanxuat_id`, `quocgia_id`, `sodangky`, `tenthuoc`, `tenbietduoc`, `tenbietduoc_slug`, `dongiaban`, `hoatchat`, `thuockedon`, `donvitinh`, `donggoi`, `thang`, `congdung`, `hinhanh`, `motathuoc`, `soluong`, `trangthai`, `created_at`, `updated_at`) VALUES
(20, 5, 24, 11, 6, 'P25518', 'Kem chống nắng Cancer Council Everyday Value Sunscreen SPF50 (Chai 110ml)', 'Cancer Council Everyday Value Sunscreen SPF50', 'cancer-council-everyday-value-sunscreen-spf50', 197500, 'Không có', 0, 'Chai', 'Chai 110ml', '24', 'Kem chống nắng cho da hàng ngày, đồng thời giúp cung cấp độ ẩm cho da.', 'chong-nang/cancer-council-everyday-value-sunscreen-spf50.webp', '<p><strong>Thành phần</strong></p><p>AQUA, ISOPROPYL PALMITATE, OCTOCRYLENE, HOMOSALATE, BUTYL METHOXYDIBENZOYLMETHANE, ALCOHOL DENAT, GLYCERIN, SILICA, POLYGLYCERYL-3 DIISOSTEARATE, PVP/HEXADECENE COPOLYMER, CETEARYL ALCOHOL, PHENOXYETHANOL</p><p><strong>Công dụng</strong></p><p>Kem chống nắng cho da hàng ngày, đồng thời giúp cung cấp độ ẩm cho da. Sản phẩm</p><p>thích hợp cho da nhạy cảm</p><p><strong>Cách sử dụng</strong></p><p>Dùng cho vùng da khô sạch 20 phút trước khi ra ngoài. Để đảm bảo hiệu quả của kem chống nắng, hãy sử dụng lại sau mỗi 2 giờ hoặc sau khi bơi, đổ mồ hôi hoặc lau khô bằng khăn.</p><p>Đóng gói: Chai 110ml</p><p>Bảo quản: Nơi khô ráo thoáng mát</p><p><strong>Sản xuất tại:</strong> Australia</p><p><strong>Số giấy phép công bố: </strong>162809/21/CBMP-QLD</p>', 99, 1, '2024-04-27 14:37:39', '2024-05-13 04:07:10'),
(21, 5, 24, 11, 6, 'P18812', 'Kem chống nắng trẻ em Cancer Council (110ml)', 'Cancer Council 110ml', 'cancer-council-110ml', 292000, 'Không có', 0, 'Chai', '110ml', '24', 'Giúp chống nắng phổ rộng, tránh các tác hại của các các tia cực tím UVA và UVB lên làn da của bé.', 'chong-nang/cancer-council-110ml.jpg', '<p><strong>Thành phần</strong></p><p>Aqua, C12-15 Alkyl Benzoate, 4-Methylbenzylidene Camphor, Octocrylene, Butyl Methoxydibenzoylmethane, Ethylhexyl Triazone, Cera Alba, Hydrogenated Vegetable Oil, Ozokerite, PEG-15 Cocamine, Caprylhydroxamic Acid,…</p><p><strong>Công dụng</strong></p><p>Giúp chống nắng phổ rộng, tránh các tác hại của các các tia cực tím UVA và UVB lên làn da của bé.</p><p><strong>Đối tượng sử dụng:</strong> Thích hợp cho người có da nhạy cảm. Sử dụng cho trẻ từ 6 tháng tuổi trở lên.</p><p><strong>Hướng dẫn sử dụng: </strong>Dùng trên vùng da khô sạch 20 phút trước khi ra ngoài. Để đảm bảo hiệu quả của kem chống nắng, hãy sử dụng lại mỗi 2 giờ hoặc sau khi bơi, mồ hôi hoặc lau khô bằng khăn.</p><p><i>Lưu ý khi sử dụng:</i> Không dùng cho trẻ em dưới 6 tháng. Tránh bôi vùng mắt, miệng và các vùng da bị tổn thương. Nếu bị phản ứng hãy rửa sạch với nước, ngừng sử dụng và tư vấn bác sỹ nếu cần.</p><p><strong>Bảo quản:</strong> Nơi khô ráo, nhiệt độ dưới 30 độ C, tránh ánh nắng trực tiếp. Đặt sản phẩm ở tầng thấp.</p><p><strong>Quy cách đóng gói:&nbsp;</strong>Tuýp 110ml</p><p><strong>Hạn sử dụng:</strong> 36 tháng kể từ ngày sản xuất</p><p><strong>Thương hiệu:&nbsp;</strong>Cancer Council</p><p><strong>Tên nhà sản xuất:&nbsp;</strong>Baxter Laboratories PTY LTD</p><p><i>1019 Mountain Highway, Boronia Victoria 3155</i></p><p><strong>Công ty phân phối và chịu trách nhiệm về SP</strong></p><p>Công ty TNHH Oceania Việt Nam</p><p><i>Số 124 Đường 3.3 khu đô thị Gamuda Garden, Phường Trần Phú, Quận Hoàng Mai, Thành phố Hà Nội, Việt Nam</i></p><p><strong>Số giấy công bố:</strong> 158068/21/CBMP-QLD</p>', 100, 1, '2024-04-27 14:44:40', '2024-04-27 14:44:40'),
(22, 6, 25, 12, 10, 'P21654', 'Nhiệt kế hồng ngoại Kachi JXB-315', 'Kachi JXB-315', 'kachi-jxb-315', 790, 'Không có', 0, 'Khác', '1 cái', '60', 'Nhiệt kế điện tử hồng ngoại Kachi JXB315 giúp kiểm tra nhanh các trường hợp nhiệt độ cao, giảm nguy cơ dịch lan rộng tối đa.', 'nhiet-ke/kachi-jxb-315.jpg', '<p><strong>Công dụng</strong></p><p>- Nhiệt kế điện tử hồng ngoại Kachi JXB-315 là sản phẩm vô cùng cấn thiết của mỗi gia đình, không gây ồn, nên nếu đối tượng sử dụng đo là trẻ nhỏ, nhiệt kế sẽ không làm ảnh hưởng đến giấc ngủ của trẻ. Đặc biệt, trong thời điểm dịch bệnh, giúp kiểm tra nhanh các trường hợp nhiệt độ cao, giảm nguy cơ dịch lan rộng tối đa. Là một chiếc nhiệt kế cực kỳ thông minh, nhờ cảm biến cực nhạy được trang bị ngay trên sản phẩm với độ chính xác cực cao, tốc độ cho kết quả cực kỳ nhanh chỉ từ 1 đến 2 giây.</p><p>- Không cần sự tiếp xúc giữa vật cần đo và nhiệt kế nên có thể ứng dụng trong rất nhiều lĩnh vực của đời sống.</p><p>- Có thể đo nhiệt độ của những vật có kích thước lớn.</p><p>- Rất hữu ích khi đo nhiệt độ tại những vị trí nguy hiểm: chứa chất độc hại, điều kiện khắc nghiệt, thiết bị điện…</p><p>- Máy đo nhiệt kế Kachi JXB-315 cảm biến hồng ngoại còn được thiết kế góc 15.5 độ vốn được xem là góc đo lý tưởng nhất để đem lại hiệu quả cao nhất. Bạn hoàn toàn không cần đặt nhiệt kế chạm vào cơ thể mà vẫn thu được kết quả đo chính xác đến từng con số.</p><p><strong>Đặc điểm nổi bật</strong></p><p>- Thiết kế đặc biệt để giúp đo nhiệt độ cơ thể con người với khoảng cách 0 ~ 3cm (0 ~ 1,2 in) từ thái dương.</p><p>- Đo lường ổn định và chính xác, nhờ vào Hệ thống cảm biến nhiệt độ hồng ngoại.</p><p>- Báo động nếu nhiệt độ lớn hơn 38°C (100,4°F).</p><p>- Bộ nhớ lưu trữ lên đến 32 lần các phép đo nhiệt độ gần nhất.</p><p>- Màn hình kỹ thuật số LED màu sắc.</p><p>- Đơn vị nhiệt độ có thể được hiển thị bằng độ C hoặc độ F.</p><p>- Tắt nguồn tự động (&lt;30 giây) để tiết kiệm năng lượng.</p><p>- Sử dụng lâu dài (100.000 lần).</p><p><strong>Thông số kĩ thuật</strong></p><p>- Trọng lượng sản phẩm: 66gram.</p><p>- Trọng lượng đóng hộp: 120gram.</p><p>- Kích thước sản phẩm: 14.5 x 4 x 3.2cm.</p><p>- Kích thước đóng hộp: 17.3 x 7.5 x 4.5cm.</p><p>- Công nghệ: Cảm biến hồng ngoại.</p><p>- Điện áp: DC 3V (2 pin AAA).</p><p>- Màu sắc: Trắng.</p><p>- Chất liệu phía ngoài: Nhựa ABS.<br>- Sử dụng pin hay điện? Pin<br>- Lưu ý loại pin/ nguồn điện: 2 pin AAA<br>- Có kèm pin/ không kèm pin: Không</p><p><strong>Hướng dẫn sử dụng: </strong>Sử dụng rất dễ dàng, bạn chỉ cần hướng về vật cần đo sau đó bấm nút và đọc kết quả trên màn hình.</p><p><strong>Lưu ý khi sử dụng:</strong></p><p>- Đối với lần sử dụng đầu tiên sau khi lắp pin, cần đợi khoảng 10 - 15 phút để nhiệt kế ấm lên bằng nhiệt độ phòng</p><p>- Nhiệt kế hồng ngoại cần được bảo quản nhiệt kế ở nơi khô ráo, thoáng mát, tránh để nhiệt kế ở những nơi có nhiệt độ cao hoặc ẩm ướt.</p><p>- Trong quá trình sử dụng, tránh làm va đập hay giẫm đạp lên nhiệt kế hồng ngoại.</p><p>- Những vùng cần đo (ví dụ trán, tai) cần được vệ sinh sạch sẽ, không bị ướt. Ngoài ra, để đảm bảo an toàn, nên tránh để nhiệt kế hồng ngoại chiếu trực tiếp vào mắt.</p><p>- Để có được kết quả chính xác nhất, không nên đo nhiệt độ trong một khoảng cách quá xa và cần thực hiện theo hướng dẫn sử dụng và khuyến cáo của nhà sản xuất.</p><p>- Không nên sử dụng liên tục với thời gian sát nhau bởi vì lúc này nhiệt kế chưa kịp trở về trạng thái bình thường sau lần đo trước đó. Khoảng thời gian cách nhau sau mỗi lần sử dụng nhiệt kế tốt nhất nên là từ 2 đến 3 phút.</p><p><strong>Hạn sử dụng:</strong>&nbsp;5 năm</p><p><strong>Xuất xứ thương hiệu: </strong>Trung Quốc</p><p><strong>Bảo hành:&nbsp;</strong>24 tháng</p><p><strong>Hotline bảo hành:&nbsp;</strong>19001738</p>', 100, 1, '2024-04-27 14:59:18', '2024-04-27 14:59:18'),
(23, 6, 26, 12, 1, 'P19794', 'Máy đo huyết áp Kachi MK167', 'Kachi MK167', 'kachi-mk167', 790000, 'Không có', 0, 'Khác', '1 cái', '60', 'Đo huyết áp, có giọng nói thông báo quá trình đo.', 'do-huyet-ap/kachi-mk167.png', '<p><strong>Công dụng</strong><br>Đo huyết áp, có giọng nói thông báo quá trình đo.</p><p>Các tính năng nổi bật của Máy đo huyết áp Kachi MK167<br>- Máy hiển thị đèn chỉ dẫn quấn vòng bít cho người dùng dễ dàng thao tác khi sử dụng máy. Máy đo huyết áp tự động Kachi MK-167 có bộ nhớ lưu lại kết quả đo trước 99 lần/người.<br>- Màn hình LCD hiển thị cực rộng &amp; lớn, giúp bạn đọc được các chỉ số đo một cách rõ ràng nhất, phù hợp cho mọi đối tượng sử dụng kể cả người già mắt kém. Các nút điều khiển cũng được thiết kế lớn, điều chỉnh nhẹ nhàng cho bạn thao tác trên máy một cách thoải mái nhất.<br>- Máy đo huyết áp tự động Kachi MK167 có biểu tượng báo huyết áp cao hiển thị sau quá trình đo giúp người bệnh biết được mức huyết áp và uống thuốc kịp thời. Máy hiển thị biểu tượng vòng bít đúng cho kết quả thêm chính xác.<br>- Máy đo huyết áp tự động Kachi MK167 sử dụng 4 pin AAA, có cổng nguồn DC-6V dùng trực tiếp khi cần (tiết kiệm pin). Máy có nút chuyển đổi người dùng, có thể sử dụng cho 2 đối tượng riêng biệt.<br>- Máy có ống dẫn khí để lắp ống khí bơm nhả khí lớp vải đo huyết áp. Đi kèm lớp vải đo huyết áp chất lượng, mềm &amp; chắn chắn.</p><p><strong>Thông tin kỹ thuật</strong><br>Chất liệu: Nhựa ABS<br>Kích thước sản phẩm: 13.6 x 9.8 x 7.15 cm<br>Kích thước đóng gói: 16.5 x 19 x 8.5 cm<br>Khối lượng (N.w): 288gr<br>Khối lượng (G.w): 480gr<br>Sử dụng pin hay điện: Pin<br>Loại pin:&nbsp;4 pin AAA<br>Không kèm pin</p><p><strong>Hướng dẫn sử dụng</strong><br>1. Giữ cơ thể thư giãn &amp; ngồi yên tĩnh một lúc trước khi đo.<br>2. Đặt lòng bàn tay ngửa hướng lên, đặt dây đeo cổ tay song song với vị trí tim.<br>3. Giữ tư thế lòng bàn tay ngửa hướng lên, giữ cho ống dẫn và các động mạch nằm vị trí song song.<br>4. Quấn băng đeo tay xung quanh bắp tay của bạn thật kỹ lưỡng, chặt chẽ theo hướng vòng ngược, cài lại với nhau.<br>5. Băng quấn có độ chặt hợp lý là khi bạn có thể đặt một ngón tay vào sau khi quấn, đó là hợp lý nhất.<br>6. Giữ cho cổ tay song song với vị trí tim của bạn, lòng bàn tay vẫn giữ hướng lên.<br>7. Nhấn nút biểu tượng On/Off, giữ tư thế thoải mái và máy sẽ bắt đầu tự động đo.<br>8. Huyết áp tâm trương, tâm thu &amp; nhịp tim hiển thị trên màn hình chỉ sau khoảng 30 giây.</p><p><strong>Những lưu ý khi sử dụng Máy đo huyết áp Kachi MK167</strong></p><p>- Khi bạn sử dụng xong nên đặt máy huyết áp vào tủ để chống ẩm, tránh độ ẩm trực tiếp từ bên ngoài.</p><p>– Không đặt máy đo huyết áp tiếp xúc trực tiếp dưới nền nhà,nơi ẩm ướt,hoặc gần tường.</p><p>– Trong thời tiết ẩm ướt kéo dài,khi có nắng đột ngột không để ánh nắng chiếu trực tiếp lên máy.</p><p>– Nếu lâu ngày không sử dụng máy,nên tháo pin ra khỏi máy.</p><p>– Khi vô tình để máy huyết áp bị ẩm, dính nước thì không nên mở nguồn ngay trở lại, mà phải sấy khô trước, vì nếu mở ngay hơi nước ở vi mạch sẽ gây cháy, chập.</p><p>– Dùng vải mềm, khô lau vỏ máy, không dùng bất kì chất tẩy rửa, ăn mòn nào, không vệ sinh vòng bit.</p><p>– Chỉ sử dụng linh kiện của máy chính hãng.</p><p>– Không gập vòng bit, ống dẫn khí quá chặt sau khi sử dụng.</p><p><i>Lưu ý:</i> Cởi áo bó ở phần cánh tay<br>- Không giao máy cho trẻ em hoặc những người không có khả năng điều khiển hành động bản thân khi tự sử dụng máy.<br>- Không được tháo rời máy hoặc vòng bít.<br>- Chỉ sử dụng máy để đo huyết áp, không sử dụng máy cho bất kỳ mục đích nào khác. Không tự bơm khí cho vòng bít vượt ngưỡng 299Hg.<br>- Khi đo không thể các thiết bị điện tử ở gần máy vì có thể các thiết bị này sẽ phát ra từ trường làm ảnh hưởng đến kết quả đo.<br>- Khi đi xe hơi hoặc máy bay không nên sử dụng máy đo huyết áp điện tử.<br>- Nếu huyết áp tâm thu hoặc tâm trương cao nằm ngoài phạm vi cho phép, biểu tượng nhịp tim sẽ nhấp nháy khi kết quả đo được hiển thị. Nghiên cứu gần đây cho thấy các giá trị dưới đây được xem là huyết áp cao khi đo huyết áp tại nhà.</p><p>- Huyết áp tâm thu (HA tối đa): Trên 135 mmHg<br>- Huyết áp tâm trương (HA tối thiểu): Trên 85 mmHg<br>- Máy đo huyết áp này có tính năng phát hiện nhịp tim không đều. Nhịp tim không đều có thể ảnh hưởng tới kết quả đo.<br>- Nếu kết quả đo bị ảnh hưởng bởi nhịp tim không đều nhưng kết quả có giá trị, kết quả sẽ hiển thị cùng với biểu tượng báo nhịp tim không đều. Nếu nhịp tim không đều làm cho kết quả đo không có giá trị, kết quả không hiển thị.<br>- Nếu biểu tượng nhịp tim không đều xuất hiện thường xuyên, hãy hỏi bác sĩ để biết thêm thông tin về nhịp tim của bạn.<br>- Nếu bạn cử động trong quá trình đo, biểu tượng báo sẽ xuất hiện trên màn hình. Giữ nguyên tư thế và đo lại.</p><p><strong>Hạn sử dụng:</strong> 5 năm</p><p><strong>Xuất xứ thương hiệu:</strong> Việt Nam</p><p><strong>Sản xuất tại:</strong> Trung Quốc</p><p><strong>Bảo hành: </strong>24 tháng</p><p><strong>Hotline bảo hành</strong>:&nbsp;19001738</p>', 100, 1, '2024-04-27 15:02:07', '2024-04-27 15:02:07'),
(24, 1, 3, 13, 1, 'P15323', 'Dung dịch Dentanalgi điều trị đau răng, viêm nướu răng, nha chu (chai 7ml)', 'Dentanalgi', 'dentanalgi', 19000, 'Camphor; Methol; Tinh dầu Hương nhu; Procain hydroclrid; Sao đen; Tạo giác; Thông bạch', 0, 'Chai', '7ml', '12', 'Điều trị đau răng, Viêm nướu răng, nha chu', 'khang-viem/dentanalgi.webp', '<p><strong>Thành phần:</strong><br>Hoạt chất: Camphor 420mg, Menthol 280mg,&nbsp;Procaine hydroclorid 35mg,&nbsp;Tinh dầu đinh hương 439mg, Sao đen 700mg, Tạo giác 140mg, Thông bạch 140mg.<br>Tá dược vừa đủ 7ml: Ethanol 96%, nước tinh khiết.</p><p><strong>Chỉ định</strong><br>Ðiều trị đau răng, viêm nướu răng, nha chu.</p><p><strong>Chống chỉ định</strong><br>Trẻ em dưới 5 tuổi, trẻ em có tiền sử động kinh hoặc co giật do sốt cao.&nbsp;<br>Bệnh nhân mẫn cảm với bất kỳ thành phần nào của thuốc.</p><p><strong>Liều dùng</strong><br>Tẩm thuốc vào bông đặt nơi đau, 3 - 4 lần/ngày.<br>Nhỏ 1 ml thuốc (30 giọt) vào khoảng 60 ml nước chín, khuấy đều, ngậm và súc miệng 3 lần/ngày.<br>Hoặc dùng theo chỉ dẫn của bác sĩ.</p><p><strong>Tác dụng phụ</strong><br>Chưa ghi nhận được báo cáo về phản ứng có hại của thuốc.&nbsp;<br><i>* Thông báo ngay cho bác sĩ hoặc dược sĩ những phản ứng có hại gặp phải khi sử dụng thuốc.</i></p><p><strong>Thận trọng</strong><br>Cho đến nay chưa có thông tin báo cáo về các trường hợp cần thận trọng khi dùng thuốc.<br>*Khả năng lái xe và vận hành máy móc<br>Chưa có bằng chứng về ảnh hưởng của thuốc lên khả năng lái xe, vận hành máy móc.<br>*Thời kỳ mang thai: Thuốc sử dụng được cho phụ nữ mang thai.<br>*Thời kỳ cho con bú: Thuốc sử dụng được cho phụ nữ cho con bú.</p><p><strong>Tương tác thuốc</strong><br>Tương tác của thuốc: cho đến nay chưa có thông tin báo cáo về tương tác thuốc.&nbsp;<br>Tương kỵ của thuốc: do không có các nghiên cứu về tính tương kỵ của thuốc, không trộn lẫn thuốc này với các thuốc khác.</p><p><strong>Bảo quản: </strong>Nơi khô mát, nhiệt độ dưới 30°C</p><p><strong>Đóng gói:</strong> Hộp 1 chai nhỏ giọt 7ml</p><p><strong>Thương hiệu:&nbsp;</strong>&nbsp;OPC</p><p><strong>Nhà sản xuất:</strong>&nbsp;Công ty Cổ phần dược phẩm OPC (Việt Nam)</p><p>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.<br>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</p>', 100, 1, '2024-05-01 15:44:26', '2024-05-01 15:44:26'),
(25, 1, 3, 14, 11, 'P01421', 'Gel Voltaren Emulgel Gel 1% giảm triệu chứng đau và viêm tại chỗ (tuýp 20g)', 'Voltaren Emulgel Gel 1%', 'voltaren-emulgel-gel-1', 69000, 'DICLOFENAC', 0, 'Tuýp', 'Tuýp 20g', '12', 'Giảm triệu chứng đau và Viêm tại chỗ', 'khang-viem/voltaren-emulgel-gel-1.webp', '<p><strong>Thành phần</strong></p><p>Hoạt chất:&nbsp;100g Voltaren Emulgel chứa diclofenac diethylamine 1.16g (tương ứng với diclofenac natri 1g).</p><p>Tá dược: Carbomer, ether macrogol cetostearyl, cocoyl caprylocaprate, diethylamine, alcd isopropyl, paraffin lỏng, dầu khoáng, kem thơm 45, propylene glycol, nước tinh khiết.</p><p><strong>Chỉ định </strong>(Thuốc dùng cho bệnh gì?)</p><p>Để điều trị bên ngoài về đau, viêm và sưng trong các trường hợp:</p><p>- Tổn thương gân, dây chằng, cơ và khớp, ví dụ bong gân, vết bầm tím, căng cơ quá mức và đau lưng sau khi chơi thể thao hoặc bị tai nạn.</p><p>- Các dạng bệnh thấp khu trú ở mô mềm như viêm gân (đau khuỷu tay ở người chơi tennis), hội chứng vai - bàn tay, viêm bao hoạt dịch, bệnh viêm quanh khớp.</p><p>- Điều trị triệu chứng viêm xương khớp ở các khớp nhỏ và trung bình nằm gần với da như khớp ngón tay hoặc khớp gối.</p><p><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)</p><p>Quá mẫn cảm với diclofenac hoặc bất cứ thành phần nào của thuốc (như isopropanol hoặc propylene glycol).</p><p>Chống chỉ định dùng Voltaren Emulgel trên những bệnh nhân có thể bị hen, nổi mề đay hoặc viêm mũi cấp do acid acetylsalicylic và các thuốc kháng viêm không steroid khác như Ibuprofen.</p><p>Chống chỉ định dùng Voltaren Emulgel trong 3 tháng cuối của thai kỳ (xem phần PHỤ NỮ CÓ THAI VÀ CHO CON BÚ).</p><p><strong>Tương tác thuốc </strong>(Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)</p><p>Do sự hấp thu toàn thân thấp khi được bôi tại chỗ, xác suất tương tác rất thấp.</p><p><strong>Bảo quản:</strong> Không bảo quản trên 30°C. Tránh nhiệt.</p><p><strong>Đóng gói: </strong>Hộp 1 tuýp 20g</p><p><strong>Thương hiệu</strong>: Novartis</p><p><strong>Nơi sản xuất</strong>: Novartis Consumer Health SA (Thuỵ Sĩ)</p><p><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i></p><p><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 15:51:16', '2024-05-01 15:51:16'),
(26, 1, 4, 13, 1, 'P00579', 'Siro Ho Astex trị ho, tiêu đờm, viêm họng, viêm phế quản (chai 90ml)', 'Siro Ho Astex', 'siro-ho-astex', 38000, 'Tần dày lá; Núc nác; Cineol', 0, 'Chai', 'Chai 90ml', '24', 'Điều trị ho, tiêu đờm, Viêm họng, Viêm phế quản', 'cam-lanh/siro-ho-astex.webp', '<p><strong>Thành phần</strong><br>Chai 90ml:<br>- Hoạt chất: Húng chanh (Folium Plectranthi amboinici) 45.00g, Núc nác (Cortex Oroxyli) 11.25g, Cineol (Cineolum) 83.70mg.<br>- Tá dược: đường trắng, natri benzoat, polysorbat 80 vừa đủ 90ml.<br><br><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)<br>Trị ho. Giảm ho trong viêm họng, viêm phế quản, viêm khí quản... (viêm đường hô hấp).<br><br><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)<br>Bệnh nhân đái tháo đường. Bệnh nhân mẫn cảm với bất kỳ thành phần nào của thuốc. Trẻ em có tiền sử động kinh hoặc co giật do sốt cao.<br><br><strong>Liều dùng</strong><br>Trẻ sơ sinh đến dưới 2 tuổi: mỗi lần uống 2 - 5ml hoặc ½ gói - 1 gói 5ml, ngày uống 3 lần.<br>Trẻ em từ 2 đến dưới 6 tuổi: mỗi lần uống 5 - 10ml hoặc 1 - 2 gói 5ml, ngày uống 3 lần.<br>Trẻ em từ 6 tuổi trở lên và người lớn: mỗi lần uống 15ml hoặc 3 gói 5ml, ngày uống 3 lần.<br><br><strong>Tác dụng phụ</strong><br>Cho đến nay, chưa có thông tin báo cáo về tác dụng không mong muốn.<br>Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.</p><p>* QUÁ LIỀU:<br>Cho đến nay chưa có thông tin báo cáo về dùng thuốc quá liều.<br><br><strong>Thận trọng</strong> (Những lưu ý khi dùng thuốc)<br>Không có.</p><p>* THAI KÌ:<br>Được sử dụng.</p><p>* LÁI XE:<br>Không.<br><br><strong>Tương tác thuốc</strong> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)<br>Cho đến nay, chưa có thông tin báo cáo về tương tác thuốc.<br><br><strong>Bảo quản</strong>: Nơi khô mát, nhiệt độ dưới 30°C.<br><br><strong>Đóng gói</strong>: Hộp 1 chai thủy tinh 90ml</p><p><strong>Thương hiệu</strong>: Công ty cổ phần Dược phẩm OPC (Việt Nam)<br><br><strong>Nơi sản xuất</strong>: Việt Nam<br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 15:56:02', '2024-05-01 15:56:02'),
(27, 1, 4, 13, 1, 'P14905', 'Siro Ho người lớn OPC trị viêm nhiễm đường hô hấp, ho cảm, ho có đờm, đau họng (chai 90ml)', 'Siro Ho người lớn OPC', 'siro-ho-nguoi-lon-opc', 38000, 'Tỳ bà lá , Cát cánh', 0, 'Hộp', 'Chai 90ml', '24', 'Điều trị Viêm nhiễm đường hô hấp, ho cảm, ho có đờm, đau họng', 'cam-lanh/siro-ho-nguoi-lon-opc.webp', '<p><strong>Thành phần</strong> &nbsp;<br>Cho 1 chai 90ml<br>Cao lỏng dược liệu 1:2 63,00ml&nbsp;<br>Tương ứng với&nbsp;<br>- Tỳ bà diệp (Folium Eriobotryae) 16,20g<br>- Cát cánh (Radix Platycodi grandiflori) 1,80g<br>- Bách bộ (Radix Stemonae tuberosae) 2,79g<br>- Tiền hồ (Radix Peucedani) 1,80g<br>- Tang bạch bì (Cortex Mori albae radicis) 1,80g<br>- Thiên môn (Radix Asparagi cochinchinensis) 2,70g<br>- Phục linh/Bạch linh (Poria) 1,80g<br>- Cam thảo (Radix Glycyrrhizae) 0,90g<br>- Hoàng cầm (Radix Scutellariae) 1,80g<br>- Menthol 18,00mg<br>- Cineol 18,00mg&nbsp;<br>Tá dược vừa đủ 90ml (đường trắng, natri benzoat, polysorbat 80, nước tinh khiết)</p><p><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)<br>- Trị các bệnh viêm nhiễm đường hô hấp, các chứng ho gió, họ cảm, ho có đờm, đau họng.<br>&nbsp; &nbsp;<br><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)<br>- Bệnh nhân mẫn cảm với bất kỳ thành phần nào của thuốc. Trẻ em dưới 15 tuổi.<br>- Trẻ em có tiền sử động kinh hay co giật do sốt cao. Bệnh nhân ho do phong hàn.<br>- Người bệnh đái tháo đường do trong thành phần thuốc có chứa đường trắng.<br>- Người tỳ vị hư hàn với các biểu hiện: đau bụng, bụng đầy trướng, kém ăn, nôn mửa, tiêu chảy hoặc lỵ kéo dài.&nbsp;</p><p><strong>Liều dùng</strong><br>Người lớn: Uống mỗi lần 1 muỗng canh (15ml), ngày uống 3 lần. Lắc kỹ trước khi dùng.&nbsp;</p><p><strong>Tác dụng phụ</strong><br>Cho đến nay chưa có thông tin báo cáo về tác dụng không mong muốn của thuốc. Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.<br>&nbsp;<br><strong>Thận trọng</strong> (Những lưu ý khi dùng thuốc)<br>Phụ nữ có thai và cho con bú<br>Sử dụng cho phụ nữ mang thai và cho con bú: Cho đến nay chưa có dữ liệu nghiên cứu trên phụ nữ có thai và cho con bú nên thận trọng khi dùng thuốc cho đối tượng này.&nbsp;<br><br>Tác dụng lên lái xe và vận hành máy móc: Không.&nbsp;<br>&nbsp;<br><strong>Tương tác thuốc</strong> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)<br>Cho đến nay chưa có thông tin báo cáo về trường hợp tương tác thuốc.&nbsp;<br><br>Quá liều và xử trí: Cho đến nay chưa có thông tin báo cáo về trường hợp quá liều của thuốc.<br><strong>&nbsp;</strong><br><strong>Bảo quản:</strong> Nơi khô mát, nhiệt độ dưới 30°C</p><p><strong>Đóng gói:</strong> Hộp 1 chai thủy tinh 90ml<br>&nbsp;<br><strong>Thương hiệu:</strong> OPC<br>&nbsp;<br><strong>Nơi sản xuất:</strong> Công ty Cổ phần Dược phẩm OPC (Việt Nam)<br>&nbsp; &nbsp;<br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 15:59:32', '2024-05-01 15:59:32'),
(28, 1, 9, 13, 1, 'P00191', 'Cao lỏng Cao Ích Mẫu - OPC điều hòa kinh nguyệt, giảm triệu chứng tiền mãn kinh (chai 180ml)', 'ao lỏng Cao Ích Mẫu - OPC', 'ao-long-cao-ich-mau-opc', 48000, 'Ích mẫu; Hương phụ; Ngải cứu', 0, 'Chai', 'Chai 180ml', '24', 'Điều hòa kinh nguyệt, giảm triệu chứng tiền mãn kinh', 'danh-cho-phu-nu/ao-long-cao-ich-mau-opc.webp', '<p><strong>Thành phần</strong><br>- Hoạt chất: Ích mẫu (Herba Leonuri japonici) 72.0g; Hương phụ (Rhizoma Cyperi) 22.5g; Ngải cứu (Herba Artemisiae vulgaris) 18.0g.<br>- Tá dược: đường trắng, ethanol 96%, nước tinh khiết vừa đủ 90ml.</p><p><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)<br>- Kinh nguyệt không đều (bao gồm vòng kinh dài, vòng kinh ngắn hay vòng kinh dài ngắn không đều), đau bụng kinh.<br>- Rối loạn kinh nguyệt trong thời kỳ mới có kinh và tiền mãn kinh (bao gồm vòng kinh dài, vòng kinh ngắn hay vòng kinh dài ngắn không đều).<br>- Các triệu chứng trong giai đoạn tiền mãn kinh như cảm giác nóng bừng mặt, nhức đầu, cáu gắt, đau bụng.</p><p><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)<br>Phụ nữ có thai. Bệnh nhân mẫn cảm với bất kỳ thành phần nào của thuốc.<br><br><strong>Liều dùng</strong><br>Ngày uống 2 lần. Mỗi lần 1 muỗng canh (15ml).<br><br><strong>Tác dụng phụ</strong><br>- Cho đến nay chưa có thông tin báo cáo về tác dụng không mong muốn của thuốc.<br>- Thông báo cho Bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.</p><p><strong>Thận trọng</strong> (Những lưu ý khi dùng thuốc)<br>Cho đến nay chưa có thông tin báo cáo về các trường hợp cần thận trọng khi dùng thuốc.<br>*Phụ nữ có thai và cho con bú<br>- Không dùng cho phụ nữ có thai<br>- Phụ nữ đang cho con bú có thể sử dụng<br>*Lái xe và vận hành máy móc:&nbsp;Không có ảnh hưởng.<br><br><strong>Tương tác thuốc</strong> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)<br>Cho đến nay chưa có thông tin báo cáo về tương tác thuốc.<br><br><strong>Bảo quản:</strong> Nơi khô mát, nhiệt độ dưới 30oC.<br><br><strong>Đóng gói:</strong> Hộp 1 chai 180ml<br><br><strong>Thương hiệu:</strong> CTCP Dược Phẩm OPC<br><br><strong>Nơi sản xuất:</strong> CTCP Dược Phẩm OPC (Việt Nam)<br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 16:02:44', '2024-05-01 16:02:44'),
(29, 1, 11, 13, 1, 'P09466', 'Dung dịch Cồn 90 OPC sát trùng ngoài da, vật dụng (chai 60ml)', 'Cồn 90 OPC', 'con-90-opc', 5200, 'Xanh Methylen; Ethanol', 0, 'Chai', 'Chai 60ml', '24', 'Sát trùng ngoài da, vật dụng', 'da-lieu/con-90-opc.png', '<p><strong>Thành phần</strong><br>Cho 1 chai 60ml: Ethanol 96% 56.25ml, xanh methylen 0.20mg, nước tinh khiết vừa đủ 60ml.</p><p><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)<br>- Sát trùng ngoài da, vật dụng.<br>- Đốt tiệt trùng dụng cụ bằng kim loại.</p><p><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)<br>Người mẫn cảm với bất kỳ thành phần nào của thuốc.</p><p><strong>Liều dùng</strong><br>Dùng băng gòn sạch tẩm thuốc bôi sạch vết thương nhẹ nhàng, vật dụng cần sát trùng.<br>Chú ý: Hạn chế bôi lên vết thương hở vì sẽ gây xót.</p><p><strong>Tác dụng phụ</strong><br>Chưa có báo cáo<br>Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.</p><p><strong>Thận trọng</strong> (Những lưu ý khi dùng thuốc)<br>Hạn chế bôi lên vết thương hở vì sẽ gây xót.</p><p><strong>Tương tác thuốc&nbsp;</strong>(Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)<br>Chưa có báo cáo</p><p><strong>Bảo quản:&nbsp;</strong>Nơi khô mát, nhiệt độ dưới 30 độ C, tránh xa lửa. Đóng nắp sau khi sử dụng.</p><p><strong>Đóng gói:&nbsp;</strong>Chai 60ml</p><p><strong>Thương hiệu: </strong>OPC</p><p><strong>Nơi sản xuất:&nbsp;</strong>Công Ty Cổ Phần Dược Phẩm OPC (Bình Dương)</p><p><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 16:05:42', '2024-05-01 16:05:42'),
(30, 1, 14, 13, 1, 'P12033', 'Cồn xoa bóp Eagle điều trị thấp khớp, nhức mỏi, bong gân (chai 50ml)', 'Cồn xoa bóp Eagle', 'con-xoa-bop-eagle', 30000, 'Ô đầu; Địa liền; Đại hồi; Quế nhục; Thiên niên kiện; Uy linh tiên; Mã tiền; Huyết giác; Xuyên khung; Methyl Salicylat', 0, 'Chai', 'Chai 50ml', '24', 'Điều trị thấp khớp, nhức mỏi, bong gân', 'dau-gio-dau-cu-la/con-xoa-bop-eagle.webp', '<p><strong>Thành phần</strong><br>- Hoạt chất: Địa liền (Rhizoma Kaempferiae galangae) 4,50g, Riềng (Rhizoma Alpiniae officinarum) 4,50g, Thiên niên kiện (Rhizoma homalomenae) 2,70g, Huyết giác (Lignum Dracaenae cambodianae) 2,70g, Đại hồi (Fructus Illicii veri) 1,80g, Quế chi (Ramulus Cinnamomi) 1,80g, Ô đầu (Radix Aconiti) 0,90g.Camphora 0,90g.<br>- Tá dược: (Ethanol 96%, nước) vừa đủ 90ml.</p><p><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)<br>Chữa các chứng đau nhức do nhiều nguyên nhân: thấp khớp, nhức mỏi gân xương, bị thương, bị ngã, bong gân.<br><br><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)<br>- Không dùng cho phụ nữ có thai.<br>- Không bôi lên mắt, không dùng cho vết thương hở, không dùng cho trẻ em dưới 2 tuổi.<br>- Không dùng cho bệnh nhân mẫn cảm với bất kỳ thành phần nào của thuốc.<br><br><strong>Liều dùng</strong><br>Mỗi lần dùng khoảng 2-5ml, xoa bóp các chỗ đau nhiều lần trong ngày.<br><br><strong>Tác dụng phụ</strong><br>Không có dữ liệu.<br><br><strong>Thận trọng</strong> (Những lưu ý khi dùng thuốc)<br>Không có dữ liệu.<br><br><strong>Tương tác thuốc</strong> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)<br>Không có dữ liệu.<br><br><strong>Bảo quản:</strong> Nơi khô mát, nhiệt độ dưới 30 độ C.<br><br><strong>Đóng gói:</strong> Chai xịt 50ml<br><br><strong>Thương hiệu:</strong> Công ty CP Dược Phẩm OPC<br><br><strong>Nơi sản xuất:</strong> Công ty CP Dược Phẩm OPC (Việt Nam)<br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 16:08:08', '2024-05-01 16:08:08'),
(31, 1, 11, 13, 1, 'P11030', 'Dung dịch dùng ngoài Milian trị bệnh ngoài da như herpes simplex, chốc đầu, viêm da (chai 20ml)', 'Dung dịch dùng ngoài Milian', 'dung-dich-dung-ngoai-milian', 12000, 'Xanh Methylen', 0, 'Chai', 'Chai 20ml', '12', 'Điều trị Bệnh ngoài da như herpes simplex, chốc đầu, lở loét, Viêm da mủ', 'da-lieu/dung-dich-dung-ngoai-milian.webp', '<p><strong>Thành phần</strong><br><span style=\"color:rgb(43,43,43);\">Xanh methylen 400mg</span><br><span style=\"color:rgb(43,43,43);\">Tím gentian 50mg</span><br><span style=\"color:rgb(43,43,43);\">Nước tinh khiết vừa đủ 20ml</span><br><br><strong>Chỉ định</strong><span style=\"color:rgb(43,43,43);\"> (Thuốc dùng cho bệnh gì?)</span><br><span style=\"color:rgb(43,43,43);\">Dùng tại chỗ để điều trị nhiễm virus ngoài da như eczema (thông thường do virus Herpes simplex), chốc lở, viêm da mủ, nhiễm khuẩn da (hăm bẹn).</span><br><br><strong>Chống chỉ định</strong><span style=\"color:rgb(43,43,43);\"> (Khi nào không nên dùng thuốc này?)</span><br><span style=\"color:rgb(43,43,43);\">Vết thương hở, vết loét rộng hoặc tổn thương loét ở mặt. Người mẫn cảm với bất kỳ thành phần nào của thuốc.</span><br><br><strong>Liều dùng</strong><br><span style=\"color:rgb(43,43,43);\">Rửa sạch vết thương, bôi tại chỗ 2-3 lần/ngày, trong 3 ngày.</span><br><br><strong>Tác dụng phụ</strong><br><span style=\"color:rgb(43,43,43);\">Thuốc có thể gây kích ứng hoặc gây những phản ứng mẫn cảm và loét niêm mạc.</span><br><span style=\"color:rgb(43,43,43);\">Khi bôi da có màu xanh tím.</span><br><span style=\"color:rgb(43,43,43);\">Thông báo cho Bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.</span><br><br><strong>Thận trọng</strong><span style=\"color:rgb(43,43,43);\"> (Những lưu ý khi dùng thuốc)</span><br><span style=\"color:rgb(43,43,43);\">Tím gentian có thể gây kích ứng và loét niêm mạc khi bôi. Tránh tiếp xúc trực tiếp với mắt. Phụ nữ có thai và cho con bú.</span><br><br><strong>Bảo quản:</strong><span style=\"color:rgb(43,43,43);\"> Nơi khô, nhiệt độ không quá 30 độ C, tránh ánh sáng</span><br><br><strong>Đóng gói:</strong><span style=\"color:rgb(43,43,43);\"> Hộp 1 chai 20ml</span><br><br><strong>Thương hiệu:</strong><span style=\"color:rgb(43,43,43);\"> OPC (Việt Nam)</span><br><br><strong>Nơi sản xuất:</strong><span style=\"color:rgb(43,43,43);\"> Việt Nam</span><br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 16:11:59', '2024-05-01 16:11:59'),
(32, 1, 14, 13, 1, 'P04957', 'Cao sao vàng trị cảm cúm, sổ mũi, nghẹt mũi, chóng mặt, say tàu xe (hộp 10g)', 'Cao sao vàng', 'cao-sao-vang', 16000, 'Camphor; Menthol; Tinh dau Bac ha; Tinh dau Tram; Tinh dau huong nhu', 0, 'Hộp', 'Hộp 10g', '24', 'Điều trị cảm cúm, sổ mũi, nghẹt mũi, chóng mặt, say tàu xe', 'dau-gio-dau-cu-la/cao-sao-vang.webp', '<p><strong>Thành phần</strong><br><span style=\"color:rgb(43,43,43);\">Camphor 849,20mg</span><br><span style=\"color:rgb(43,43,43);\">Menthol 425,20mg</span><br><span style=\"color:rgb(43,43,43);\">Tinh dầu Bạc hà 525,20mg</span><br><span style=\"color:rgb(43,43,43);\">Tinh dầu Tràm 210,80mg</span><br><span style=\"color:rgb(43,43,43);\">Tinh dầu Hương nhu 130,80mg</span><br><span style=\"color:rgb(43,43,43);\">Tinh dầu Quế 53,20mg</span><br><span style=\"color:rgb(43,43,43);\">Tá dược vừa đủ 10g</span><br><span style=\"color:rgb(43,43,43);\">(Dầu parafin, sáp ong vàng, lanolin, vaselin, parafin rắn)</span><br><br><strong>Chỉ định</strong><span style=\"color:rgb(43,43,43);\"> (Thuốc dùng cho bệnh gì?)</span><br><span style=\"color:rgb(43,43,43);\">Cảm cúm, nhức đầu, sổ mũi, buồn nôn, đau bụng, say tàu xe; bị muỗi và các côn trùng khác đốt.</span><br><br><strong>Chống chỉ định</strong><span style=\"color:rgb(43,43,43);\"> (Khi nào không nên dùng thuốc này?)</span><br><span style=\"color:rgb(43,43,43);\">Không dùng cho trẻ em dưới 2 tuổi. Không bôi vào mắt.</span><br><span style=\"color:rgb(43,43,43);\">Không dùng cho người mẫn cảm với bất kỳ thành phần nào của thuốc.</span><br><br><strong>Liều dùng</strong><br><span style=\"color:rgb(43,43,43);\">Nhức đầu, chóng mặt, cảm cúm, say tàu xe: Xoa dầu cao vào hai bên thái dương và gáy, xoa vào lỗ mũi.</span><br><span style=\"color:rgb(43,43,43);\">Khi bị muỗi và các côn trùng khác đốt: Xoa dầu cao vào chỗ bị đốt.</span><br><span style=\"color:rgb(43,43,43);\">Có thể xông: Cho khoảng 1 – 2 đầu đũa dầu cao vào nước sôi để xông khi bị cảm cúm.</span><br><br><strong>Tác dụng phụ</strong><br><span style=\"color:rgb(43,43,43);\">Chưa có báo cáo.</span><br><i>Thông báo cho Bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.</i><br><br><strong>Tương tác thuốc</strong><span style=\"color:rgb(43,43,43);\"> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)</span><br><span style=\"color:rgb(43,43,43);\">Chưa tìm thấy tài liệu về tương tác thuốc.</span><br><br><strong>Bảo quản</strong><span style=\"color:rgb(43,43,43);\">: Nơi khô mát, nhiệt độ dưới 30 độ C.</span><br><br><strong>Đóng gói</strong><span style=\"color:rgb(43,43,43);\">: Hộp 10g</span><br><br><strong>Thương hiệu</strong><span style=\"color:rgb(43,43,43);\">: OPC</span><br><br><strong>Nơi sản xuất</strong><span style=\"color:rgb(43,43,43);\">: Công ty Cổ phần Dược phẩm OPC (Việt Nam)</span><br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 16:22:06', '2024-05-01 16:22:06'),
(33, 1, 14, 13, 1, 'P00303', 'Dầu nóng Mặt Trời điều trị nhức mỏi, tê thấp, đau lưng, cảm mạo, cúm (chai 60ml)', 'Dầu nóng Mặt Trời', 'dau-nong-mat-troi', 48000, 'Methyl Salicylat; Tinh dầu bạc hà; Camphor; Tinh dầu quế; Dầu paraffin', 0, 'Chai', 'Chai 60ml', '12', 'Methyl Salicylat; Tinh dầu bạc hà; Camphor; Tinh dầu quế; Dầu paraffin', 'dau-gio-dau-cu-la/dau-nong-mat-troi.png', '<p><strong>Thành phần</strong></p><p>- Hoạt chất: Methyl salicylat 6,21g, Camphor 2,10g, tinh dầu Quế (Oleum Cinnamomi) 0,11g, tinh dầu Bạc hà (Oleum Menthae arvensis) 2,48g, gừng (Rhizoma Zingiberis) 0,63g</p><p>- Tá dược: dầu parafin, ethanol 96% vừa đủ 20ml</p><p><strong>Chỉ định </strong>(Thuốc dùng cho bệnh gì?)</p><p>Dùng trong trường hợp nhức mỏi, tê thấp, đau lưng, cảm mạo, cúm, dùng để đánh lưng và ngực khi bị cảm ho. Dùng ngoài để xoa bóp, chà lên nơi đau.</p><p><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)</p><p>- Không xoa vào vùng mắt, vú khi cho con bú, vết thương hở. Không dùng cho trẻ sơ sinh, phụ nữ có thai.</p><p>- Không dùng cho bệnh nhân mẫn cảm với bất cứ thành phần nào của thuốc.</p><p><strong>Liều dùng</strong></p><p>Lấy một lượng dầu khoảng 2 - 5ml để xoa bóp chỗ sưng đau 2 - 4 lần/ngày hoặc để đánh gió khi bị cảm.</p><p><strong>Tác dụng phụ</strong></p><p>Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.</p><p><strong>Thận trọng </strong>(Những lưu ý khi dùng thuốc)</p><p>Chưa có báo cáo.</p><p><strong>Tương tác thuốc</strong> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)</p><p>Chưa tìm thấy tài liệu về tương tác thuốc.</p><p><strong>Bảo quản:</strong> Nơi khô mát, nhiệt độ dưới 30°C</p><p><strong>Đóng gói:</strong> Hộp 1 chai 60ml</p><p><strong>Thương hiệu:</strong> OPC</p><p><strong>Nơi sản xuất:</strong> Công ty Cổ phần Dược phẩm OPC (Việt Nam)</p><p><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i></p><p><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 16:24:55', '2024-05-01 16:24:55'),
(34, 1, 11, 13, 1, 'P12032', 'Gel Picado trị viêm và nhiễm trùng niêm mạc miệng (tuýp 10g)', 'Gel Picado', 'gel-picado', 25000, 'Đại Hoàng; Acid Salicylic', 0, 'Tuýp', 'Tuýp 10g', '24', 'Điều trị Viêm và nhiễm trùng niêm mạc miệng', 'da-lieu/gel-picado.png', '<p><br><strong>Thành phần</strong><br>- Hoạt chất:<br>+ Dịch chiết cồn thân rễ Đại hoàng 3,8ml<br>+ Tương ứng với Đại hoàng (Rhizoma Rhei) 500mg<br>+ Acid salicylic 100mg<br>- Tá dược vừa đủ (Natricarboxymethylcellulose, Natri Saccarin, Glycerin, tinh dầu bạc hà, nước tinh khiết) vđ 1 tuýp 10g<br><br><strong>Chỉ định</strong> <i>(Thuốc dùng cho bệnh gì?)</i><br>- Điều trị tại chỗ các chứng viêm và nhiễm trùng niêm mạc miệng như: aptơ, viêm miệng, viêm nướu, kích thích do mang răng giả, các vết thương và vết loét vùng miệng.<br><br><strong>Chống chỉ định</strong> <i>(Khi nào không nên dùng thuốc này?)</i><br>- Trẻ em dưới 6 tuổi.<br>- Trẻ em có tiền sử động kinh hoặc co giật do sốt cao.<br>- Người có tiền sử loét dạ dày.<br>- Không dung nạp các dẫn xuất salicylate.<br>- Bệnh nhân mẫn cảm với bất kỳ thành phần nào của thuốc.<br><br><strong>Liều dùng</strong><br>- Thoa thuốc Picado 2 - 4 lần mỗi ngày lên vùng tổn thương và xoa nhẹ để thuốc bám dính vào niêm mạc miệng.<br>- Không nên đánh răng, súc miệng ngay sau khi thoa thuốc.<br><br><strong>Tác dụng phụ</strong><br>- Răng có thể bị nhuộm vàng nhưng màu này sẽ biến mất nhanh chóng.<br>- Cảm giác nóng rát thoáng qua tại nơi thoa thuốc.<br>- Phản ứng quá mẫn (mề đay hay phát ban) rất hiếm khi xảy ra.<br><i>Thông báo cho bác sĩ các tác dụng không mong muốn gặp phải khi sử dụng.</i><br><br><strong>Thận trọng</strong> <i>(Những lưu ý khi dùng thuốc)</i><br>- Trong trường hợp có biểu hiện nhiễm khuẩn toàn thân, phải điều trị bằng kháng sinh.<br>- Thận trọng khi dùng cho phụ nữ có thai và cho con bú.<br>- Không nên dùng thời gian dài nồng độ cao thoa thuốc trên diện rộng để tránh hấp thu quá mức gây tác dụng phụ toàn thân.<br><br><strong>Tương tác thuốc</strong> <i>(Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)</i><br>- Cho đến nay chưa có thông tin báo cáo về tương tác thuốc.</p><p><strong>Sử dụng cho phụ nữ có thai</strong><br>- Hỏi ý kiến bác sĩ trước khi sử dụng. Chưa có báo cáo đối với thuốc điều trị tại chỗ chứa Đại hoàng như Picado đối với phụ nữ có thai nhưng cần hết sức thận trọng khi chỉ định. Anthranoid glycoside từ đại hoàng có thể bài xuất qua sữa mẹ nhưng chưa có nghiên cứu cụ thể trên liều điều trị của Picado, vì vậy chỉ sử dụng khi thuốc có nhiều lợi ích với người mẹ hơn việc nuôi con bằng sữa.</p><p><strong>Quá liều</strong><br>- Biểu hiện: Trường hợp nuốt phải quá nhiều thuốc, có thể có triệu chứng tiêu chảy cấp do tác dụng nhuận tràng của Đại hoàng và triệu chứng ngộ độc của acid salicylic: thường biểu hiện khác nhau tùy từng người như thở sâu, nhanh, ù tai, điếc, giãn mạch, ra mồ hôi.<br>- Điều trị: Nên uống thật nhiều nước, bù nước và điện giải trong trường hợp tiêu chảy cấp. Trường hợp ngộ độc acid salicylic cần rửa dạ dày và theo dõi pH huyết tương, nồng độ salicylat trong huyết tương và các chất điện giải.</p><p><strong>Bảo quản:</strong> Nơi khô mát, nhiệt độ dưới 30oC, tránh ánh sáng</p><p><strong>Hạn dùng:</strong> 36 tháng kể từ ngày sản xuất.</p><p><strong>Đóng gói:</strong><br>- Gel dùng tại chỗ.<br>- Hộp 1 tuýp 10g.<br><br><strong>Thương hiệu:</strong> Dược phẩm OPC<br><br><strong>Nơi sản xuất:</strong> Việt Nam<br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 16:29:18', '2024-05-01 16:29:18');
INSERT INTO `thuoc` (`id`, `danhmuc_id`, `nhomthuoc_id`, `hangsanxuat_id`, `quocgia_id`, `sodangky`, `tenthuoc`, `tenbietduoc`, `tenbietduoc_slug`, `dongiaban`, `hoatchat`, `thuockedon`, `donvitinh`, `donggoi`, `thang`, `congdung`, `hinhanh`, `motathuoc`, `soluong`, `trangthai`, `created_at`, `updated_at`) VALUES
(35, 1, 5, 15, 1, 'P14147', 'Viên nang Odistad 120mg hỗ trợ giảm nhẹ calo trong điều trị béo phì, thừa cân (2 vỉ x 21 viên)', 'Viên nang Odistad 120mg', 'vien-nang-odistad-120mg', 415000, 'Orlistat 120mg', 0, 'Hộp', '2 vỉ x 21 viên', '36', 'Hỗ trợ giảm nhẹ calo trong Điều trị cho Bệnh nhân béo phì, thừa cân', 'giam-can/vien-nang-odistad-120mg.webp', '<p><strong>Thành phần</strong><br>- Hoạt chất: Orlistat 120 mg (dưới dạng orlistat pellets 50%).<br>- Tá dược: Lactose, croscarmellose natri, natri stearat, natri lauryl sulfat povidon K30.</p><p><strong>Chỉ định</strong>&nbsp;(Thuốc dùng cho bệnh gì?)<br>Orlistat được chỉ định kết hợp cùng với chế độ ăn giảm nhẹ calo trong điều trị béo phì và ngừa tăng cân trở lại ở bệnh nhân có chỉ số khối cơ thể (BMI) ≥ 30 kg/m2 hoặc bệnh nhân thừa cân (BMI ≥ 28kg/m2) kèm theo các yếu tố nguy cơ (như tăng huyết áp, đái tháo đường, tăng lipid huyết).</p><p><strong>Chống chỉ định&nbsp;</strong>(Khi nào không nên dùng thuốc này?)<br>- Quá mẫn với orlistat hoặc bất cứ thành phần nào của thuốc.<br>- Hội chứng kém hấp thu mạn tính hoặc bệnh ứ mật.<br>- Điều trị đồng thời với ciclosporin.<br>- Phụ nữ có thai và cho con bú.<br>- Điều trị đồng thời với warfarin hoặc các thuốc chống đông đường uống khác.</p><p><strong>Liều dùng và cách dùng</strong><br>Liều dùng:<br><i>Điều trị béo phì và ngừa tăng cân trở lại ở người lớn:</i><br>Liều khuyến cáo của&nbsp;Orlistat 120 là 1 viên 120 mg x 3 lần/ngày trong mỗi bữa ăn chính có chất béo.<br>Cách dùng:<br>- Nên uống thuốc với nước ngay trước, trong khi ăn hoặc cho đến 1 giờ sau mỗi bữa ăn chính. Nếu bỏ lỡ một bữa ăn hoặc bữa ăn không có chất béo thì không cần dùng orlistat.<br>- Liều dùng quá 3 lần/ngày không tăng thêm lợi ích.<br>- Nếu bệnh nhân không thể giảm cân sau 12 tuần điều trị với orlistat, nên tham khảo ý kiến bác sĩ hoặc dược sĩ. Nếu cần có thể ngưng điều trị.<br>Lưu ý:<br>- Chế độ ăn kiêng và tập thể dục là những phần quan trọng của chương trình giảm cân. Khuyến cáo nên bắt đầu chương trình ăn kiêng và tập thể dục trước khi bắt đầu điều trị với orlistat.<br>- Bệnh nhân nên thực hiện chế độ cân bằng dinh dưỡng và giảm nhẹ calo, chứa khoảng 30% calo từ chất béo. Nên phân bố lượng chất béo, carbohydrat và protein hàng ngày vào 3 bữa ăn chính.<br>- Nên tiếp tục chương trình ăn kiêng và tập thể dục sau khi ngưng điều trị với orlistat.<br>- Tính an toàn và hiệu quả của thuốc dùng trên 4 năm chưa được đánh giá.<br>- Trẻ em: Tính an toàn và hiệu quả ở trẻ em dưới 12 tuổi chưa được thiết lập.<br>- Dữ liệu về việc dùng orlistat cho người cao tuổi còn hạn chế. Tác dụng của orlistat trên những người bị suy gan và/hoặc suy thận chưa được nghiên cứu. Tuy nhiên, do orlistat được hấp thu rất ít nên không cần điều chỉnh liều ở người cao tuổi và những người suy gan và/hoặc suy thận.</p><p><strong>Tác dụng phụ</strong><br>Rất thường gặp (ADR ≥ 1/10), thường gặp (1/100 ≤ ADR &lt; 1/10), ít gặp (1/1.000 ≤ ADR &lt; 1/100), hiếm gặp (1/10.000 ≤ ADR &lt; 1/1.000), rất hiếm gặp (ADR &lt; 1/10.000) và chưa rõ tần suất (không thể ước tính từ các dữ liệu có sẵn).<br><strong>- </strong>Nhiễm trùng và ký sinh trùng<br><i>Rất thường gặp:</i>&nbsp;Cúm.<br><strong>- </strong>Chuyển hóa và dinh dưỡng<br><i>Rất thường gặp:</i>&nbsp;Hạ glucose huyết.<br><strong>- </strong>Tâm thần<br><i>Thường gặp:</i>&nbsp;Lo lắng.<br><strong>- </strong>Thần kinh<br><i>Rất thường gặp:</i>&nbsp;Đau đầu.<br><strong>-</strong> Hô hấp, ngực và trung thất<br><i>+ Rất thường gặp:</i>&nbsp;Nhiễm trùng đường hô hấp trên.<br><i>+ Thường gặp:</i>&nbsp;Nhiễm trùng đường hô hấp dưới.<br><strong>- </strong>Tiêu hóa<br><i>+ Rất thường gặp:</i>&nbsp;Khó chịu/đau bụng, đờm nhày ở trực tràng, trung tiện, tiêu chảy cấp, phân có mỡ, đầy hơi, phân lỏng, đi tiêu ra mỡ, tăng đại tiện.<br><i>+&nbsp; Thường gặp:&nbsp;</i>Khó chịu/đau trực tràng, phân mềm, đi tiêu không tự chủ, đày bụng, rối loạn về răng và nướu.<br><i>+ Chưa rõ tần suất:</i>&nbsp;Chảy máu trực tràng, viêm ruột thừa, viêm tụy.<br><strong>- </strong>Thận và tiết niệu<br><i>+ Thường gặp:</i>&nbsp;Nhiễm trùng đường tiết niệu.<br><i>+ Chưa rõ tần suất:&nbsp;</i>Bệnh thận oxalat có thể dẫn đến suy thận.<br><strong>-</strong> Sinh sản và ngực<br><i>Thường gặp:</i>&nbsp;Kinh nguyệt không đều.<br>- Rối loạn chung<br><i>Thường gặp:</i>&nbsp;Mệt mỏi.<br>- Miễn dịch<br><i>Chưa rõ tần suất:&nbsp;</i>Phản ứng quá mẫn (như ngứa, phát ban, mày đay, phù mạch, co thắt phế quản và phản ứng phản vệ).<br>- Gan mật<br><i>Chưa rõ tần suất:&nbsp;</i>sỏi mật, viêm gan nghiêm trọng. Một số trường hợp tử vong hoặc phải cấy ghép gan đã được báo cáo.<br><strong>-</strong> Da và mô dưới da<br><i>Chưa rõ tần suất:&nbsp;</i>Nổi mụn nước.<br><strong>-</strong> Các nghiên cứu liên quan<br><i>Chưa rõ tần suất:</i><br>+ Tăng transaminase gan và phosphat kiềm.<br>+ Giảm prothrombin, tăng INR và mất cân bằng điều trị của các thuốc chống đông máu dẫn đến thay đổi các thông số cầm máu đã được báo cáo ở những bệnh nhân được điều trị bằng thuốc chống đông máu cùng với orlistat.</p><p><strong>Thận trọng</strong> (Những lưu ý khi dùng thuốc)<br><i>- Các triệu chứng về đường tiêu hóa:&nbsp;</i>Bệnh nhân nên có chế độ dinh dưỡng phù hợp. Khả năng xảy ra các triệu chứng rối loạn tiêu hóa có thể tăng khi đang điều trị orlistat với bữa ăn riêng lẻ hoặc giàu chất béo.<br><i>- Vitamin tan trong dầu:</i>&nbsp;Khi điều trị với orlistat có khả năng làm giảm sự hấp thu các vitamin tan trong dầu (A, D, E và K). Vì vậy cần bổ sung vitamin tổng hợp lúc đi ngủ.<br><i>- Thuốc trị đái tháo đường:&nbsp;</i>Do giảm cân có thể đi kèm với kiểm soát chuyến hóa được cải thiện trong bệnh đái tháo đường, bệnh nhân đang điều trị với thuốc trị đái tháo đường nên tham khảo ý kiến bác sĩ trước khi bắt đầu điều trị với orlistat, trong trường hợp cần thiết có thể điều chỉnh liều của thuốc trị đái tháo đường<br><i>- Thuốc trị tăng huyết áp hoặc tăng cholesterol huyết:&nbsp;</i>Giảm cân có thể kèm với sự cải thiện tình trạng tăng huyết áp và mức cholesterol huyết. Bệnh nhân đang điều trị với các thuốc này nên tham khảo ý kiến bác sĩ khi bắt đầu điều trị với orlistat, trong trường hợp cần thiết có thể điều chỉnh liều của các thuốc này.<br><i>- Amiodaron:</i>&nbsp;Bệnh nhân đang điều trị với amiodaron nên tham khảo ý kiến bác sĩ trước khi bắt đầu điều trị với orlistat.<br><i>- Chảy máu trực tràng:&nbsp;</i>Tình trạng chảy máu trực tràng được báo cáo ở những bệnh nhân dùng orlistat. Nếu điều này xảy ra, bệnh nhân nên tham khảo ý kiến bác sĩ.<br><i>- Thuốc tránh thai đường uống:</i>&nbsp;Khuyến cáo sử dụng biện pháp tránh thai bổ sung để ngăn ngừa khả năng thất bại có thể xảy ra của thuốc tránh thai đường uống, trong trường hợp tiêu chảy nặng.<br><i>- Bệnh thận:&nbsp;</i>Bệnh nhân bệnh thận nên tham khảo ý kiến bác sĩ trước khi điều trị với orlistat. Do dùng orlistat liên quan đến oxalat niệu hoặc bệnh thận oxalat có khi dẫn đến suy thận. Nguy cơ này tăng lên ở những bệnh nhân mắc bệnh thận mạn tính và/hoặc mất dịch.<br><i>- Levothyroxin:</i>&nbsp;Suy giảm tuyến giáp và/hoặc giảm kiểm soát suy giảm tuyến giáp có thể xảy ra khi dùng phối hợp orlistat và levothyroxin. Bệnh nhân đang uống levothyroxin nên tham khảo ý kiến bác sĩ trước khi điều trị với orlistat, dùng orlistat và levothyroxin ở các thời điểm khác nhau và liều levothyroxin có thể được điều chỉnh.<br><i>- Các thuốc chống động kinh:</i>&nbsp;Bệnh nhân đang điều trị với thuốc chống động kinh, nên tham khảo ý kiến bác sĩ trước khi bắt đầu điều trị với orlistat, cần theo dõi tần suất và mức độ nghiêm trọng của các cơn co giật. Nếu điều này xảy ra, cần xem xét sử dụng thuốc chống động kinh và orlistat ở các thời điểm khác nhau.<br><i>- Thuốc kháng retrovirus HIV:&nbsp;</i>Bệnh nhân nên tham khảo ý kiến bác sĩ trước khi dùng đồng thời orlistat với thuốc kháng retrovirus HIV. Orlistat có thể làm giảm sự hấp thu của thuốc kháng retrovirus HIV, ảnh hưởng tiêu cực đến hiệu quả của thuốc kháng retrovirus HIV.<br>- <i>Odistad 120</i> chứa lactose. Không nên dùng thuốc này cho bệnh nhân có các vấn đề về di truyền hiếm gặp không dung nạp galactose, thiếu hụt enzym lactase toàn phần hay kém hấp thu glucose-galactose.<br><i><u>Lái xe</u></i><br>Orlistat không ảnh hưởng trên khả năng lái xe và vận hành máy móc.<br><i><u>Thai kỳ</u></i><br>- Phụ nữ có thai<br>Chưa có nghiên cứu nào đày đủ và chặt chẽ về sử dụng orlistat trên phụ nữ có thai. Khuyến cáo không sử dụng orlistat trong thời gian mang thai.<br>- Phụ nữ cho con bú<br>Chưa biết orlistat có phân bố vào sữa mẹ hay không. Vì vậy, orlistat không được dùng cho phụ nữ đang cho con bú.</p><p><strong>Tương tác thuốc</strong> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)<br><i>Tương tác của thuốc</i><br><i>- Ciclosporin:</i>&nbsp;Một nghiên cứu về tương tác thuốc đã thãy có sự giảm nồng độ trong huyết tương của ciclosporin khi dùng đồng thời orlistat với ciclosporin.<br><i>- Acarbose:</i>&nbsp;Chưa có nghiên cứu tương tác về dược động học, nên tránh dùng đồng thời orlistat với acarbose.<br><i>- Thuốc chống đông đường uống:</i>&nbsp;Khi dùng đồng thời warfarin hay Các thuốc chống đông khác cùng với orlistat, nên theo dõi tỷ số chuẩn hóa quốc tế (INR).<br><i>- Vitamin tan trong dầu:</i>&nbsp;Điều trị với orlistat có khả năng làm giảm sự hấp thu của các vitamin tan trong dầu (A, D, E và K).<br><i>- Levothyroxin:</i>&nbsp;Giảm năng tuyến giáp đã được báo cáo ở những bệnh nhân dùng đồng thời orlistat và levothyróxin. Nên theo dõi những thay đổi về chức năng tuyến giáp ở những bệnh nhân dùng đồng thời orlistat và levothyroxin. Nên dùng levothyroxin và orlistat cách nhau ít nhất 4 giờ.<br><i>- Amiodaron:</i>&nbsp;Giảm nồng độ trong huyết tương của amiodaron, khi dùng đồng thời với liều duy nhất orlistat. Sự liên quan lâm sàng của tác dụng này ở bệnh nhân điều trị với amiódaron vẫn chưa được biết. Bệnh nhân đang dùng amiodaron nên tham khảo ý kiẽn bác sĩ trước khi bắt đằu điều trị với orlistat. Liều amiodaron có thể cần phải được điều chỉnh trong quá trình điều trị với orlistat.<br><i>- Thuốc chống động kinh:&nbsp;</i>Co giật đã được báo cáo ở những bệnh nhân dùng đồng thời orlistat với các thuốc chống động kinh như valproat, lamotrigin, không loại trừ nguyên nhân do tương tác thuốc. Orlistat làm giảm sự hấp thu của các thuốc chống động kinh, dẫn đến co giật.<br><i>- Thuốc tránh thai đường uống:&nbsp;</i>Thiếu dữ liệu nghiên cứu vè sự tương tác giữa thuốc tránh thai và orlistat. Tuy nhiên, orlistat có thể làm giảm tác dụng của thuốc tránh thai, trong một số ít trường hợp có thể dẫn đến có thai không mong muốn. Một số phương pháp tránh thai bổ sung cần được sử dụng trong trường hợp xảy ra tiêu chảy nặng khi dùng thuốc này.<br><i>- Thuốc kháng retrovirus HIV, thuốc chống trầm cảm, thuốc loạn thần và các benzodiazepin:&nbsp;</i>Làm giảm hiệu quả của các thuốc kháng retrovirus HIV, thuốc chống trầm cảm, thuốc loạn thần (bao gồm lithi) và các benzodiazepin đã được báo cáo khi dùng chung với orlistat ở những bệnh nhân được kiểm soát tốt trước đó. Vì vậy bắt đàu điều trị với orlistat, sau khi cân nhắc cẩn thận ảnh hưởng có thể trên những bệnh nhân này.<br><i>Tương kỵ của thuốc</i><br>Do không có các nghiên cứu về tính tương kỵ của thuốc, không trộn lẫn thuốc này với các thuốc khác.</p><p><strong>Bảo quản</strong>: Bảo quản trong bao bì kín, nơi khô. Nhiệt độ không quá 30oC</p><p><strong>Đóng gói:</strong> Vỉ 21 viên. Hộp 2 vỉ</p><p><strong>Thương hiệu:</strong> Stella</p><p><strong>Nơi sản xuất</strong>: Công ty TNHH LD Stellapharm - Chi nhánh 1 (Việt Nam)</p><p><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 100, 1, '2024-05-01 16:35:44', '2024-05-01 16:35:44'),
(36, 1, 5, 16, 1, 'P03068', 'Viên nang Orlistat Stada 120mg hỗ trợ giảm calo trong điều trị béo phì, thừa cân (2 vỉ x 21 viên)', 'Viên nang Orlistat Stada 120mg', 'vien-nang-orlistat-stada-120mg', 345000, 'Orlistat', 0, 'Hộp', '2 vỉ x 21 viên', '36', 'Hỗ trợ giảm nhẹ calo trong Điều trị cho Bệnh nhân béo phì, thừa cân', 'giam-can/vien-nang-orlistat-stada-120mg.webp', '<p><strong>Thành phần</strong><br>- Thành phần hoạt chất: Orlistat 120 mg (dưới dạng orlistat pellets 50%)<br>- Thành phần tá dược: Lactose, croscarmellose natri, natri stearat, natri lauryl sulfat povidon K30.</p><p><strong>Chỉ định</strong> (Thuốc dùng cho bệnh gì?)<br>Orlistat được chỉ định kết hợp cùng với chế độ ăn giảm nhẹ calo trong điều trị béo phì và ngừa tăng cân trở lại ở bệnh nhân có chỉ số khối cơ thể (BMI) ≥ 30 kg/m2 hoặc bệnh nhân thừa cân (BMI ≥ 28kg/m2) kèm theo các yếu tố nguy cơ (như tăng huyết áp, đái tháo đường, tăng lipid huyết).<br><br><strong>Chống chỉ định</strong> (Khi nào không nên dùng thuốc này?)<br>- Quá mẫn với orlistat hoặc bất cứ thành phần nào của thuốc.<br>- Hội chứng kém hấp thu mạn tính hoặc bệnh ứ mật.<br>- Điều trị đồng thời với ciclosporin.<br>- Phụ nữ có thai và cho con bú.<br>- Điều trị đồng thời với warfarin hoặc các thuốc chống đông đường uống khác.</p><p><strong>Liều dùng</strong><br>* Liều dùng<br>- Điều trị béo phì và ngừa tăng cân trở lại ở người lớn:<br>- Liều khuyến cáo củaOrlistat 120là 1 viên 120 mg x 3 lần/ngày trong mỗi bữa ăn chính có chất béo.<br>* Cách dùng<br>- Nên uống thuốc với nước ngay trước, trong khi ăn hoặc cho đến 1 giờ sau mỗi bữa ăn chính. Nếu bỏ lỡ một bữa ăn hoặc bữa ăn không có chất béo thì không cần dùng orlistat.<br>- Liều dùng quá 3 lần/ngày không tăng thêm lợi ích.<br>- Nếu bệnh nhân không thể giảm cân sau 12 tuần điều trị với orlistat, nên tham khảo ý kiến bác sĩ hoặc dược sĩ. Nếu cần có thể ngưng điều trị.<br>* Lưu ý<br>- Chế độ ăn kiêng và tập thể dục là những phần quan trọng của chương trình giảm cân. Khuyến cáo nên bắt đầu chương trình ăn kiêng và tập thể dục trước khi bắt đầu điều trị với orlistat.<br>- Bệnh nhân nên thực hiện chế độ cân bằng dinh dưỡng và giảm nhẹ calo, chứa khoảng 30% calo từ chất béo. Nên phân bố lượng chất béo, carbohydrat và protein hàng ngày vào 3 bữa ăn chính.<br>- Nên tiếp tục chương trình ăn kiêng và tập thể dục sau khi ngưng điều trị với orlistat.<br>- Tính an toàn và hiệu quả của thuốc dùng trên 4 năm chưa được đánh giá.<br>- Trẻ em: Tính an toàn và hiệu quả ở trẻ em dưới 12 tuổi chưa được thiết lập.<br>- Dữ liệu về việc dùng orlistat cho người cao tuổi còn hạn chế. Tác dụng của orlistat trên những người bị suy gan và/hoặc suy thận chưa được nghiên cứu. Tuy nhiên, do orlistat được hấp thu rất ít nên không cần điều chỉnh liều ở người cao tuổi và những người suy gan và/hoặc suy thận.</p><p><strong>Tác dụng phụ</strong><br>Nhiễm trùng và ký sinh trùng<br>- Rất thường gặp: Cúm.<br>Chuyển hóa và dinh dưỡng<br>- Rất thường gặp: Hạ glucose huyết.<br>Tâm thần<br>- Thường gặp: Lo lắng.<br>Thần kinh<br>- Rất thường gặp: Đau đầu.<br>Hô hấp, ngực và trung thất<br>- Rất thường gặp: Nhiễm trùng đường hô hấp trên.<br>- Thường gặp: Nhiễm trùng đường hô hấp dưới.<br>Tiêu hóa<br>- Rất thường gặp: Khó chịu/đau bụng, đờm nhày ở trực tràng, trung tiện, tiêu chảy cấp, phân có mỡ, đầy hơi, phân lỏng, đi tiêu ra mỡ, tăng đại tiện.<br>- Thường gặp: Khó chịu/đau trực tràng, phân mềm, đi tiêu không tự chủ, đày bụng, rối loạn về răng và nướu.<br>- Chưa rõ tần suất: Chảy máu trực tràng, viêm ruột thừa, viêm tụy.<br>Thận và tiết niệu<br>- Thường gặp: Nhiễm trùng đường tiết niệu.<br>- Chưa rõ tần suất: Bệnh thận oxalat có thể dẫn đến suy thận.<br>Sinh sản và ngực<br>- Thường gặp: Kinh nguyệt không đều.<br>Rối loạn chung<br>- Thường gặp: Mệt mỏi.<br>Miễn dịch<br>- Chưa rõ tần suất: Phản ứng quá mẫn (như ngứa, phát ban, mày đay, phù mạch, co thắt phế quản và phản ứng phản vệ).<br>Gan mật<br>- Chưa rõ tần suất: sỏi mật, viêm gan nghiêm trọng. Một số trường hợp tử vong hoặc phải cấy ghép gan đã được báo cáo.<br>Da và mô dưới da<br>- Chưa rõ tần suất: Nổi mụn nước.<br>Các nghiên cứu liên quan<br>- Chưa rõ tần suất:<br>- Tăng transaminase gan và phosphat kiềm.<br>- Giảm prothrombin, tăng INR và mất cân bằng điều trị của các thuốc chống đông máu dẫn đến thay đổi các thông số cầm máu đã được báo cáo ở những bệnh nhân được điều trị bằng thuốc chống đông máu cùng với orlistat.</p><p><strong>Thận trọng</strong> (Những lưu ý khi dùng thuốc)<br>- Các triệu chứng về đường tiêu hóa: Bệnh nhân nên có chế độ dinh dưỡng phù hợp. Khả năng xảy ra các triệu chứng rối loạn tiêu hóa có thể tăng khi đang điều trị orlistat với bữa ăn riêng lẻ hoặc giàu chất béo.<br>- Vitamin tan trong dầu: Khi điều trị với orlistat có khả năng làm giảm sự hấp thu các vitamin tan trong dầu (A, D, E và K). Vì vậy cần bổ sung vitamin tổng hợp lúc đi ngủ.<br>- Thuốc trị đái tháo đường: Do giảm cân có thể đi kèm với kiểm soát chuyến hóa được cải thiện trong bệnh đái tháo đường, bệnh nhân đang điều trị với thuốc trị đái tháo đường nên tham khảo ý kiến bác sĩ trước khi bắt đầu điều trị với orlistat, trong trường hợp cần thiết có thể điều chỉnh liều của thuốc trị đái tháo đường<br>- Thuốc trị tăng huyết áp hoặc tăng cholesterol huyết: Giảm cân có thể kèm với sự cải thiện tình trạng tăng huyết áp và mức cholesterol huyết. Bệnh nhân đang điều trị với các thuốc này nên tham khảo ý kiến bác sĩ khi bắt đầu điều trị với orlistat, trong trường hợp cần thiết có thể điều chỉnh liều của các thuốc này.<br>- Amiodaron: Bệnh nhân đang điều trị với amiodaron nên tham khảo ý kiến bác sĩ trước khi bắt đầu điều trị với orlistat.<br>- Chảy máu trực tràng: Tình trạng chảy máu trực tràng được báo cáo ở những bệnh nhân dùng orlistat. Nếu điều này xảy ra, bệnh nhân nên tham khảo ý kiến bác sĩ.<br>- Thuốc tránh thai đường uống: Khuyến cáo sử dụng biện pháp tránh thai bổ sung để ngăn ngừa khả năng thất bại có thể xảy ra của thuốc tránh thai đường uống, trong trường hợp tiêu chảy nặng.<br>- Bệnh thận: Bệnh nhân bệnh thận nên tham khảo ý kiến bác sĩ trước khi điều trị với orlistat. Do dùng orlistat liên quan đến oxalat niệu hoặc bệnh thận oxalat có khi dẫn đến suy thận. Nguy cơ này tăng lên ở những bệnh nhân mắc bệnh thận mạn tính và/hoặc mất dịch.<br>- Levothyroxin: Suy giảm tuyến giáp và/hoặc giảm kiểm soát suy giảm tuyến giáp có thể xảy ra khi dùng phối hợp orlistat và levothyroxin. Bệnh nhân đang uống levothyroxin nên tham khảo ý kiến bác sĩ trước khi điều trị với orlistat, dùng orlistat và levothyroxin ở các thời điểm khác nhau và liều levothyroxin có thể được điều chỉnh.<br>- Các thuốc chống động kinh: Bệnh nhân đang điều trị với thuốc chống động kinh, nên tham khảo ý kiến bác sĩ trước khi bắt đầu điều trị với orlistat, cần theo dõi tần suất và mức độ nghiêm trọng của các cơn co giật. Nếu điều này xảy ra, cần xem xét sử dụng thuốc chống động kinh và orlistat ở các thời điểm khác nhau.<br>- Thuốc kháng retrovirus HIV: Bệnh nhân nên tham khảo ý kiến bác sĩ trước khi dùng đồng thời orlistat với thuốc kháng retrovirus HIV. Orlistat có thể làm giảm sự hấp thu của thuốc kháng retrovirus HIV, ảnh hưởng tiêu cực đến hiệu quả của thuốc kháng retrovirus HIV.<br>-Odistad 120chứa lactose. Không nên dùng thuốc này cho bệnh nhân có các vấn đề về di truyền hiếm gặp không dung nạp galactose, thiếu hụt enzym lactase toàn phần hay kém hấp thu glucose-galactose.</p><p><strong>Tương tác thuốc</strong> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)<br>- Ciclosporin: Một nghiên cứu về tương tác thuốc đã thãy có sự giảm nồng độ trong huyết tương của ciclosporin khi dùng đồng thời orlistat với ciclosporin.<br>- Acarbose: Chưa có nghiên cứu tương tác về dược động học, nên tránh dùng đồng thời orlistat với acarbose.<br>- Thuốc chống đông đường uống: Khi dùng đồng thời warfarin hay Các thuốc chống đông khác cùng với orlistat, nên theo dõi tỷ số chuẩn hóa quốc tế (INR).<br>- Vitamin tan trong dầu: Điều trị với orlistat có khả năng làm giảm sự hấp thu của các vitamin tan trong dầu (A, D, E và K).<br>- Levothyroxin: Giảm năng tuyến giáp đã được báo cáo ở những bệnh nhân dùng đồng thời orlistat và levothyróxin. Nên theo dõi những thay đổi về chức năng tuyến giáp ở những bệnh nhân dùng đồng thời orlistat và levothyroxin. Nên dùng levothyroxin và orlistat cách nhau ít nhất 4 giờ.<br>- Amiodaron: Giảm nồng độ trong huyết tương của amiodaron, khi dùng đồng thời với liều duy nhất orlistat. Sự liên quan lâm sàng của tác dụng này ở bệnh nhân điều trị với amiódaron vẫn chưa được biết. Bệnh nhân đang dùng amiodaron nên tham khảo ý kiẽn bác sĩ trước khi bắt đằu điều trị với orlistat. Liều amiodaron có thể cần phải được điều chỉnh trong quá trình điều trị với orlistat.<br>- Thuốc chống động kinh: Co giật đã được báo cáo ở những bệnh nhân dùng đồng thời orlistat với các thuốc chống động kinh như valproat, lamotrigin, không loại trừ nguyên nhân do tương tác thuốc. Orlistat làm giảm sự hấp thu của các thuốc chống động kinh, dẫn đến co giật.<br>- Thuốc tránh thai đường uống: Thiếu dữ liệu nghiên cứu vè sự tương tác giữa thuốc tránh thai và orlistat. Tuy nhiên, orlistat có thể làm giảm tác dụng của thuốc tránh thai, trong một số ít trường hợp có thể dẫn đến có thai không mong muốn. Một số phương pháp tránh thai bổ sung cần được sử dụng trong trường hợp xảy ra tiêu chảy nặng khi dùng thuốc này.<br>- Thuốc kháng retrovirus HIV, thuốc chống trầm cảm, thuốc loạn thần và các benzodiazepin: Làm giảm hiệu quả của các thuốc kháng retrovirus HIV, thuốc chống trầm cảm, thuốc loạn thần (bao gồm lithi) và các benzodiazepin đã được báo cáo khi dùng chung với orlistat ở những bệnh nhân được kiểm soát tốt trước đó. Vì vậy bắt đàu điều trị với orlistat, sau khi cân nhắc cẩn thận ảnh hưởng có thể trên những bệnh nhân này.</p><p><strong>Bảo quản:</strong> Bảo quản trong bao bì kín, nơi khô. Nhiệt độ không quá 30oC.<br><br><strong>Đóng gói:</strong> Hộp 2 vỉ x 21 viên<br><br><strong>Thương hiệu:</strong> Stella Pharm<br><br><strong>Nơi sản xuất:</strong> Stella Pharm (Việt Nam)<br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 98, 1, '2024-05-01 16:38:46', '2024-05-13 14:51:50'),
(37, 1, 6, 17, 1, 'P17141', 'Thuốc nhỏ mắt Eyelight Cool làm mát, giữ ẩm cho mắt, ngăn ngừa cận thị tiến triển (chai 10ml)', 'Eyelight Cool', 'eyelight-cool', 20000, 'Natri chondroitin Sulfate; Pyridoxine; Borneol', 0, 'Chai', 'Chai 10ml', '24', 'Làm mát mắt, giữ ẩm cho mắt, ngăn ngừa cận thị tiến triển, nhức mỏi mắt', 'mattaimui/eyelight-cool.png', '<p><strong>Thành phần</strong><br><span style=\"color:rgb(43,43,43);\">Natri chondroitin sulfat...25mg</span><br><span style=\"color:rgb(43,43,43);\">Vitamin B6.....................10mg</span><br><span style=\"color:rgb(43,43,43);\">Borneol.............................2mg</span><br><span style=\"color:rgb(43,43,43);\">Tá dược vừa đủ...............10ml</span><br><span style=\"color:rgb(43,43,43);\">(Natri clorid, PEG 400, acid boric, natri borat, nipagin, nipasol, ethanol 95%, nước cất).</span><br><br><strong>Chỉ định</strong><span style=\"color:rgb(43,43,43);\"> (Thuốc dùng cho bệnh gì?)</span><br><span style=\"color:rgb(43,43,43);\">Eyelight Cool có tác dụng làm mát mắt, giữ ẩm cho mắt, ngăn ngừa cận thị tiến triển, hạn chế một số triệu chứng thường gặp như: nhức mắt, mỏi mắt, khô mắt, sưng mắt, đỏ mắt, hoa mắt khi làm việc trong môi trường máy lạnh, sử dụng máy vi tính, xem ti vi, đọc sách...</span><br><br><strong>Chống chỉ định </strong><span style=\"color:rgb(43,43,43);\">(Khi nào không nên dùng thuốc này?)</span><br><span style=\"color:rgb(43,43,43);\">Mẫn cảm với các thành phần của thuốc.</span><br><br><strong>Liều dùng</strong><br><span style=\"color:rgb(43,43,43);\">Nhỏ từ 1 đến 2 giọt vào mỗi mắt, dùng 3 - 4 lần/ ngày.</span><br><br><strong>Tác dụng phụ</strong><br><span style=\"color:rgb(43,43,43);\">Chưa tìm thấy tài liệu.</span><br><br><strong>Thận trọng</strong><span style=\"color:rgb(43,43,43);\"> (Những lưu ý khi dùng thuốc)</span><br><span style=\"color:rgb(43,43,43);\">- Không sử dụng nếu dung dịch thuốc đổi màu hoặc vẩn đục.</span><br><span style=\"color:rgb(43,43,43);\">- Không dùng thuốc sau khi mở nắp quá 30 ngày hoặc quá hạn sử dụng.</span><br><span style=\"color:rgb(43,43,43);\">- Để tránh nhiễm khuẩn hay làm hư thuốc, tránh sờ trên nắp và miệng chai, hoặc để mi mắt chạm vào miệng chai.</span><br><span style=\"color:rgb(43,43,43);\">- Đậy nắp kỹ sau mỗi lần sử dụng, không dùng chung chai thuốc với người khác.</span><br><br><strong>Tương tác thuốc</strong><span style=\"color:rgb(43,43,43);\"> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)</span><br><span style=\"color:rgb(43,43,43);\">Chưa tìm thấy tài liệu.</span><br><br><strong>Bảo quản:</strong><span style=\"color:rgb(43,43,43);\"> Nơi khô, nhiệt độ không quá 30 độ C.</span><br><br><strong>Đóng gói:</strong><span style=\"color:rgb(43,43,43);\"> Hộp 1 chai x 10ml</span><br><br><strong>Thương hiệu:</strong><span style=\"color:rgb(43,43,43);\"> Dược Hậu Giang (Việt Nam)</span><br><br><strong>Nơi sản xuất:</strong><span style=\"color:rgb(43,43,43);\"> Việt Nam</span><br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 98, 1, '2024-05-01 16:43:43', '2024-05-14 06:49:52'),
(38, 1, 6, 17, 1, 'P01324', 'Thuốc nhỏ mắt Eyelight vita cung cấp độ ẩm và dưỡng chất cho mắt, ngừa các bệnh về mắt (chai 10ml)', 'nhỏ mắt Eyelight vit', 'nho-mat-eyelight-vit', 24900, 'Thiamine; Riboflavin; Nicotinamide', 0, 'Hộp', 'Chai 10ml', '36', 'Cung cấp độ ẩm và dưỡng chất cho mắt, phòng ngừa các Bệnh về mắt', 'mattaimui/nho-mat-eyelight-vit.webp', '<p><strong>Thành phần</strong><br><span style=\"color:rgb(43,43,43);\">Vitamin B1 ....................................... 5mg</span><br><span style=\"color:rgb(43,43,43);\">Vitamin B2 .................................... 0,2mg</span><br><span style=\"color:rgb(43,43,43);\">Vitamin PP ..................................... 40mg</span><br><span style=\"color:rgb(43,43,43);\">Tá dược vừa đủ ............................... 10ml</span><br><span style=\"color:rgb(43,43,43);\">(Natri chondroitin sulfat, acid citric monohydrat, natri citrat, nipagin, nipasol, PEG 400, borneol, natri clorid, natri hydroxyd, nước cất, ethanol 96%).</span><br><br><strong>Chỉ định</strong><span style=\"color:rgb(43,43,43);\"> (Thuốc dùng cho bệnh gì?)</span><br><span style=\"color:rgb(43,43,43);\">Cung cấp vitamin cho mắt.</span><br><span style=\"color:rgb(43,43,43);\">Dùng trong các trường hợp: mỏi mắt, ngứa mắt, chảy nước mắt, đỏ mắt, khô mắt…</span><br><span style=\"color:rgb(43,43,43);\">Vệ sinh và giữ ẩm cho mắt.</span><br><span style=\"color:rgb(43,43,43);\">Phòng ngừa các tổn thương bề mặt giác mạc, viêm giác mạc.</span><br><br><strong>Chống chỉ định</strong><span style=\"color:rgb(43,43,43);\"> (Khi nào không nên dùng thuốc này?)</span><br><span style=\"color:rgb(43,43,43);\">Mẫn cảm với các thành phần của thuốc.</span><br><br><strong>Liều dùng</strong><br><span style=\"color:rgb(43,43,43);\">Nhỏ từ 1 đến 2 giọt vào mỗi mắt, dùng 3 - 4 lần/ ngày.</span><br><br><strong>Tác dụng phụ</strong><br><span style=\"color:rgb(43,43,43);\">Chưa tìm thấy tài liệu.</span><br><span style=\"color:rgb(43,43,43);\">Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.</span><br><br><strong>Thận trọng</strong><span style=\"color:rgb(43,43,43);\"> (Những lưu ý khi dùng thuốc)</span><br><span style=\"color:rgb(43,43,43);\">Chưa tìm thấy tài liệu.</span><br><br><strong>Tương tác thuốc</strong><span style=\"color:rgb(43,43,43);\"> (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)</span><br><span style=\"color:rgb(43,43,43);\">Chưa tìm thấy tài liệu.</span><br><br><strong>Bảo quản:</strong><span style=\"color:rgb(43,43,43);\"> Nơi khô, nhiệt độ không quá 30 độ C, tránh ánh sáng.</span><br><br><strong>Đóng gói:</strong><span style=\"color:rgb(43,43,43);\"> Hộp 1 chai x 10 ml.</span><br><br><strong>Thương hiệu:</strong><span style=\"color:rgb(43,43,43);\"> Dược Hậu Giang&nbsp;</span><br><br><strong>Nơi sản xuất:</strong><span style=\"color:rgb(43,43,43);\"> Việt Nam</span><br><br><i>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</i><br><i>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</i></p>', 98, 1, '2024-05-01 16:45:57', '2024-05-14 06:49:52'),
(39, 1, 7, 18, 9, 'P14338', 'Bột pha uống Smecta 3g Hương Dâu điều trị tiêu chảy, rối loạn tiêu hóa (hộp 12 gói)', 'Smecta 3g', 'smecta-3g', 53000, 'Diosmectit 3g', 0, 'Hộp', 'Hộp 12 gói', '24', 'Điều trị các triệu chứng tiêu chảy cấp ở trẻ em trên 2 tuổi và người lớn,,,,', 'tieu-hoa/smecta-3g.webp', '<p><strong>Hoạt chất&nbsp;</strong>Diosmectit…………………3,00 g</p><p>&nbsp;</p><p>Tá dược:</p><p>&nbsp;</p><p>Glucose monohydrat, natri saccharin, hương dâu*.</p><p>*Thành phần hương dâu: maltodextrin, propylen glycol, gôm arabic, chất tạo mùi tổng hợp và tự nhiên.</p><p>&nbsp;</p><p>Thành phần tá dược có tác dụng dược lý: Glucose, propylene glycol</p><p>&nbsp;</p><p><strong>Chỉ định (Thuốc dùng cho bệnh gì?)</strong></p><p>Điều trị tiêu chảy cấp ở trẻ em trên 2 tuổi và người lớn, kết hợp với việc bổ sung nước và các chất điện giải đường uống.</p><p>Điều trị triệu chứng trong tiêu chảy chức năng mạn tính ở người lớn.&nbsp;</p><p>Điều trị triệu chứng các chứng đau liên quan tới rối loạn chức năng ruột ở</p><p>Chống chỉ định (Khi nào không nên dùng thuốc này?)</p><p>Dị ứng với diosmectit hoặc bất cứ thành phần tá dược nào của thuốc.</p><p>&nbsp;</p><p><strong>Liều dùng và cách sử dụng</strong></p><p>Điều trị tiêu chảy cấp:</p><p>Trẻ trên 2 tuổi: 4 gói/ngày trong 3 ngày đầu. Sau đó 2 gói/ngày trong 4 ngày</p><p>Người lớn: trung bình 3 gói/ngày trong 7 ngày. Trên thực tế liều hằng ngày ó thể tăng gấp đôi trong những ngày đầu điều trị&nbsp;</p><p>Chỉ định khác:</p><p>Người lớn: Trung bình 3 gói/ngày.</p><p>- Cách sử dụng</p><p>Dùng đường uống. Khối lượng thuốc trong gói phải được pha thành hỗn dịch ngay trước khi sử dụng.&nbsp;</p><p>+ Trẻ em: khối lượng thuốc trong gói có thể pha với 50ml nước thành hỗn dịch đựng trong bình để cho trẻ uống dần trong ngày hoặc trộn với thức ăn lỏng, như nước dùng, mứt quả, rau củ nghiền, thức ăn trẻ em...</p><p>+ Người lớn: Thuốc có thể pha với nửa ly nước.</p><p>&nbsp;</p><p><strong>Tác dụng phụ</strong></p><p>-&nbsp;Những phản ứng bất lợi của thuốc đã được báo cáo trong các nghiên cứu lâm sàng ở trẻ em và người lớn. Các phản ứng bất lợi này thường nhẹ và thoáng qua và chủ yếu liên quan đến hệ tiêu hóa.</p><p>- Tần suất của phản ứng bất lợi được phân loại như sau: thường gặp (≥1/100, &lt;1/10), không thường gặp (≥1/1000, ≤1/100).</p><p>- Rối loạn dạ dày - ruột:</p><p>+ Thường gặp: Táo bón, thường được giải quyết bằng cách giảm liều, nhưng trong một số trường hợp hiếm gặp có thể cần ngưng điều trị.</p><p>+ Không thường gặp: Đầy hơi, nôn.</p><p>- Trong suốt quá trình thuốc lưu hành trên thị trường, một số trường hợp phản ứng quá mẫn (tần suất không rõ) được báo cáo, bao gồm mày đay, phát ban, ngứa và phù mạch.</p><p>- Có vài trường hợp táo bón tiến triển cũng được ghi nhận.</p><p>&nbsp;</p><p><strong>Thận trọng (Những lưu ý khi dùng thuốc)</strong></p><p>Diosmectit phải được dùng thận trọng ở bệnh nhân có tiền sử táo bón nặng.</p><p>Ở trẻ nhũ nhi và trẻ dưới 2 tuổi, nên tránh dùng SMECTA HƯƠNG DÂU. Điều trị khuyến cáo trong tiêu chảy cấp là bù nước điện giải đường uống (ORS)</p><p>Ở trẻ trên 2 tuổi, tiêu chảy cấp phải được điều trị phối hợp với việc dùng sớm dung dịch bù nước điện giải đường uống (ORS) nhằm tránh mất nước. Nên tránh dùng SMECTA HƯƠNG DÂU lâu dài.</p><p>Ở người lớn, nên kết hợp việc bù nước và các chất điện giải nếu điều này là cần thiết.</p><p>Lượng dịch cần bù bằng đường uống hoặc đường tĩnh mạch phải được điều chỉnh phù hợp với mức độ tiêu chảy, tuổi và đặc điểm của bệnh nhân.</p><p>Bệnh nhân nên được thông báo về việc cần thiết phải: Uống nhiều dịch mặn hoặc ngọt để bồi hoàn lượng dịch mất do tiêu chảy (nhu cầu lượng dịch trung bình hàng ngày ở người lớn là 2 lít)</p><p>Duy trì ăn uống khi bị tiêu chảy:</p><p>- Nên tránh một số thức ăn như: Rau sống, trái cây, rau xanh, các món ăn cay nóng, thức ăn đông lạnh.</p><p>- Món ăn thích hợp là thịt nướng và cơm.</p><p>Thuốc có chứa glucose, khuyến cáo không nên dùng cho bệnh nhân có hội chứng kém hấp thu glucose và galactose.</p><p>Thuốc chứa 0,128 mg propylene glycol trong mỗi gói.</p><p>&nbsp;</p><p><strong>Sử dụng thuốc cho phụ nữ có thai và cho con bú</strong></p><p>Phụ nữ có thai:</p><p>Không có dữ liệu hoặc có dữ liệu giới hạn (dưới 300 phụ nữ có thai) dùng SMECTA HƯƠNG DÂU trong quá trình mang thai.</p><p>Các nghiên cứu trên động vật không đủ để kết luận độc tính sinh sản.</p><p>SMECTA HƯƠNG DÂU không khuyến cáo sử dụng cho phụ nữ có thai.</p><p>&nbsp;</p><p>Cho con bú:</p><p>Dữ liệu giới hạn về việc dùng SMECTA HƯƠNG DÂU trên phụ nữ đang cho con bú.</p><p>SMECTA HƯƠNG DÂU không khuyến cáo sử dụng trong thời gian cho con bú.</p><p>Ảnh hưởng lên khả năng sinh sản:</p><p>&nbsp;</p><p>Chưa có nghiên cứu trên khả năng sinh sản ở người.</p><p>Ảnh hưởng của thuốc lên khả năng lái xe và vận hành máy móc:</p><p>&nbsp;</p><p>Chưa có nghiên cứu ảnh hưởng của thuốc này trên khả năng lái xe và vận hành máy móc. Tuy nhiên thuốc được cho là không có tác động hoặc tác động không đáng kể lên khả năng lái xe và vận hành máy móc.</p><p>&nbsp;</p><p><strong>Tương tác:</strong></p><p>Đặc tính hấp phụ của Smecta Hương Dâu có thể tác động vào thời gian và/hoặc tỉ lệ hấp thu các chất khác, vì vậy khuyến cáo không nên dùng cùng lúc với các thuốc khác (nên dùng cách xa 2 giờ).</p><p>&nbsp;</p><p><strong>Tương kỵ</strong>:&nbsp;Không có.</p><p>&nbsp;</p><p><strong>Bảo quản:</strong>&nbsp;Nhiệt độ không quá 30°C.</p><p>&nbsp;</p><p><strong>Đóng gói:&nbsp;</strong>Hộp 12 gói bột pha hỗn dịch uống.</p><p>&nbsp;</p><p><strong>Nơi sản xuất:</strong>&nbsp;PHARMATIS&nbsp;(Pháp)&nbsp;</p><p>&nbsp;</p><p>Mọi thông tin trên đây chỉ mang tính chất tham khảo. Việc sử dụng thuốc phải tuân theo hướng dẫn của bác sĩ, dược sĩ.</p><p>Vui lòng đọc kĩ thông tin chi tiết ở tờ rơi bên trong hộp sản phẩm.</p>', 0, 1, '2024-05-01 16:51:00', '2024-05-01 16:51:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinhtrang`
--

CREATE TABLE `tinhtrang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tinhtrang` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tinhtrang`
--

INSERT INTO `tinhtrang` (`id`, `tinhtrang`, `created_at`, `updated_at`) VALUES
(1, 'Đơn hàng mới', '2024-04-27 12:50:22', '2024-04-27 12:50:22'),
(2, 'Đang vận chuyển', '2024-04-27 12:51:00', '2024-04-27 12:51:00'),
(3, 'Đã giao', '2024-04-27 12:51:09', '2024-04-27 12:51:09');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluanthuoc`
--
ALTER TABLE `binhluanthuoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binhluanthuoc_thuoc_id_foreign` (`thuoc_id`),
  ADD KEY `binhluanthuoc_nguoidung_id_foreign` (`nguoidung_id`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donhang_nguoidung_id_foreign` (`nguoidung_id`),
  ADD KEY `donhang_tinhtrang_id_foreign` (`tinhtrang_id`);

--
-- Chỉ mục cho bảng `donhang_chitiet`
--
ALTER TABLE `donhang_chitiet`
  ADD KEY `donhang_chitiet_donhang_id_foreign` (`donhang_id`),
  ADD KEY `donhang_chitiet_thuoc_id_foreign` (`thuoc_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giohang_nguoidung_id_foreign` (`nguoidung_id`),
  ADD KEY `giohang_thuoc_id_foreign` (`thuoc_id`);

--
-- Chỉ mục cho bảng `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hinhanh_thuoc_id_foreign` (`thuoc_id`);

--
-- Chỉ mục cho bảng `khoiphucmatkhau`
--
ALTER TABLE `khoiphucmatkhau`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lienhe_nguoidung_id_foreign` (`nguoidung_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nguoidung_email_unique` (`email`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhaphang`
--
ALTER TABLE `nhaphang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nhaphang_manhap_unique` (`manhap`),
  ADD KEY `nhaphang_nhacungcap_id_foreign` (`nhacungcap_id`);

--
-- Chỉ mục cho bảng `nhomthuoc`
--
ALTER TABLE `nhomthuoc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `quocgia`
--
ALTER TABLE `quocgia`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thongtinnhaphang`
--
ALTER TABLE `thongtinnhaphang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thongtinnhaphang_thuoc_id_foreign` (`thuoc_id`),
  ADD KEY `thongtinnhaphang_nhaphang_id_foreign` (`nhaphang_id`);

--
-- Chỉ mục cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thuoc_danhmuc_id_foreign` (`danhmuc_id`),
  ADD KEY `thuoc_nhomthuoc_id_foreign` (`nhomthuoc_id`),
  ADD KEY `thuoc_hangsanxuat_id_foreign` (`hangsanxuat_id`),
  ADD KEY `thuoc_quocgia_id_foreign` (`quocgia_id`);

--
-- Chỉ mục cho bảng `tinhtrang`
--
ALTER TABLE `tinhtrang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluanthuoc`
--
ALTER TABLE `binhluanthuoc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `nhaphang`
--
ALTER TABLE `nhaphang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `nhomthuoc`
--
ALTER TABLE `nhomthuoc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `quocgia`
--
ALTER TABLE `quocgia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `thongtinnhaphang`
--
ALTER TABLE `thongtinnhaphang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `tinhtrang`
--
ALTER TABLE `tinhtrang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluanthuoc`
--
ALTER TABLE `binhluanthuoc`
  ADD CONSTRAINT `binhluanthuoc_nguoidung_id_foreign` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoidung` (`id`),
  ADD CONSTRAINT `binhluanthuoc_thuoc_id_foreign` FOREIGN KEY (`thuoc_id`) REFERENCES `thuoc` (`id`);

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_nguoidung_id_foreign` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoidung` (`id`),
  ADD CONSTRAINT `donhang_tinhtrang_id_foreign` FOREIGN KEY (`tinhtrang_id`) REFERENCES `tinhtrang` (`id`);

--
-- Các ràng buộc cho bảng `donhang_chitiet`
--
ALTER TABLE `donhang_chitiet`
  ADD CONSTRAINT `donhang_chitiet_donhang_id_foreign` FOREIGN KEY (`donhang_id`) REFERENCES `donhang` (`id`),
  ADD CONSTRAINT `donhang_chitiet_thuoc_id_foreign` FOREIGN KEY (`thuoc_id`) REFERENCES `thuoc` (`id`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_nguoidung_id_foreign` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoidung` (`id`),
  ADD CONSTRAINT `giohang_thuoc_id_foreign` FOREIGN KEY (`thuoc_id`) REFERENCES `thuoc` (`id`);

--
-- Các ràng buộc cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD CONSTRAINT `hinhanh_thuoc_id_foreign` FOREIGN KEY (`thuoc_id`) REFERENCES `thuoc` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  ADD CONSTRAINT `lienhe_nguoidung_id_foreign` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoidung` (`id`);

--
-- Các ràng buộc cho bảng `nhaphang`
--
ALTER TABLE `nhaphang`
  ADD CONSTRAINT `nhaphang_nhacungcap_id_foreign` FOREIGN KEY (`nhacungcap_id`) REFERENCES `nhacungcap` (`id`);

--
-- Các ràng buộc cho bảng `thongtinnhaphang`
--
ALTER TABLE `thongtinnhaphang`
  ADD CONSTRAINT `thongtinnhaphang_nhaphang_id_foreign` FOREIGN KEY (`nhaphang_id`) REFERENCES `nhaphang` (`id`),
  ADD CONSTRAINT `thongtinnhaphang_thuoc_id_foreign` FOREIGN KEY (`thuoc_id`) REFERENCES `thuoc` (`id`);

--
-- Các ràng buộc cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  ADD CONSTRAINT `thuoc_danhmuc_id_foreign` FOREIGN KEY (`danhmuc_id`) REFERENCES `danhmuc` (`id`),
  ADD CONSTRAINT `thuoc_hangsanxuat_id_foreign` FOREIGN KEY (`hangsanxuat_id`) REFERENCES `hangsanxuat` (`id`),
  ADD CONSTRAINT `thuoc_nhomthuoc_id_foreign` FOREIGN KEY (`nhomthuoc_id`) REFERENCES `nhomthuoc` (`id`),
  ADD CONSTRAINT `thuoc_quocgia_id_foreign` FOREIGN KEY (`quocgia_id`) REFERENCES `quocgia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
