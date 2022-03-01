-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 25, 2021 lúc 03:04 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `pconline`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins`
(
    `id`             int(10) UNSIGNED                        NOT NULL,
    `name`           varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email`          varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone`          char(191) COLLATE utf8mb4_unicode_ci             DEFAULT NULL,
    `avatar`         varchar(225) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `active`         tinyint(4)                              NOT NULL DEFAULT 1,
    `password`       varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
    `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `address`        varchar(30) COLLATE utf8mb4_unicode_ci           DEFAULT NULL,
    `created_at`     timestamp                               NULL     DEFAULT NULL,
    `updated_at`     timestamp                               NULL     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `avatar`, `active`, `password`, `remember_token`, `created_at`,
                      `updated_at`, `address`)
VALUES (9, 'Phan Quốc Phú', 'phanquocphu1998@gmail.com', NULL, NULL, 1,
        '$2y$10$KYUXAUtM3KDm8xkpycfuouquE2mQZWAOJIm6FJ28WE5yJmO0u8SGS', NULL, NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `admins_email_unique` (`email`),
    ADD KEY `admins_active_index` (`active`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
