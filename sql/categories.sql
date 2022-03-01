-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 06, 2021 lúc 04:23 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `pconlineweb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `cName` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cSlug` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cIcon` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cActive` tinyint(4) NOT NULL DEFAULT 1,
  `cTitleSeo` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cDescriptionSeo` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cKeywordSeo` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cHome` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Hiện trên trang chủ',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `cName`, `cSlug`, `cIcon`, `cActive`, `cTitleSeo`, `cDescriptionSeo`, `cKeywordSeo`, `cHome`, `createdAt`, `updatedAt`) VALUES
(10, 'MainBoard - Bo mạch chủ', 'mainboard-bo-mach-chu', '2021-06-07__020-motherboard.png', 1, 'MainBoard', NULL, NULL, 1, '2021-04-07 20:17:29', '2021-06-13 08:35:47'),
(11, 'CPU - Vi xử lý', 'cpu-vi-xu-ly', '2021-06-07__013-processor.png', 1, 'CPU', NULL, NULL, 1, '2021-04-07 20:18:06', '2021-06-13 08:35:49'),
(13, 'SSD - Ổ cứng thể rắn', 'ssd-o-cung-the-ran', '2021-06-07__006-ssd.png', 1, 'SSD - Ổ cứng thể rắn', NULL, NULL, 0, '2021-05-09 21:27:31', '2021-06-07 05:00:46'),
(14, 'HDD - Ổ cứng', 'hdd-o-cung', '2021-06-07__026-hard-drive.png', 1, 'HDD - Ổ cứng', NULL, NULL, 0, '2021-05-09 21:28:17', '2021-06-07 05:00:27'),
(15, 'PSU - Nguồn máy tính', 'psu-nguon-may-tinh', '2021-06-07__018-nas.png', 1, 'PSU - Nguồn máy tính', NULL, NULL, 0, '2021-05-09 21:29:12', '2021-06-07 05:01:38'),
(16, 'Case - Vỏ máy tính', 'case-vo-may-tinh', '2021-06-07__031-cpu-tower.png', 1, 'Case - Vỏ máy tính', NULL, NULL, 0, '2021-05-09 21:29:24', '2021-06-07 05:01:52'),
(18, 'Chuột', 'chuot', '2021-06-07__019-mouse.png', 1, 'Chuột', NULL, NULL, 0, '2021-05-09 21:30:25', '2021-06-07 05:02:08'),
(19, 'Bàn phím', 'ban-phim', '2021-06-07__025-keyboard.png', 1, 'Bàn phím', NULL, NULL, 0, '2021-05-09 21:30:31', '2021-06-07 05:02:23'),
(20, 'Màn hình', 'man-hinh', '2021-06-07__021-monitor.png', 1, 'Màn hình', NULL, NULL, 0, '2021-05-11 19:19:31', '2021-06-07 05:02:42'),
(22, 'Ram - Bộ nhớ phụ', 'ram-bo-nho-phu', '2021-06-07__memory.png', 1, 'Ram - Bộ nhớ phụ', NULL, NULL, 0, '2021-06-07 04:41:16', '2021-06-07 04:41:16'),
(23, 'test', 'test', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_cName_unique` (`cName`),
  ADD KEY `categories_cSlug_index` (`cSlug`),
  ADD KEY `categories_cActive_index` (`cActive`),
  ADD KEY `categories_cHome_index` (`cHome`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
