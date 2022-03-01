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
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users`
(
    `id`             int(10) UNSIGNED                        NOT NULL,
    `name`           varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email`          varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone`          char(191) COLLATE utf8mb4_unicode_ci             DEFAULT NULL,
    `avatar`         varchar(225) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `active`         tinyint(4)                              NOT NULL DEFAULT 1,
    `password`       varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
    `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `total_pay`      int(10)                               NOT NULL DEFAULT 0 COMMENT 'Thành viên hay mua',
    `address`        varchar(225) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT 'Địa chỉ gốc',
    `provider`       varchar(225) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `provider_id`    varchar(225) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `created_at`     timestamp                               NULL     DEFAULT NULL,
    `updated_at`     timestamp                               NULL     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `avatar`, `active`, `password`, `remember_token`, `created_at`,
                     `updated_at`, `total_pay`, `address`, `provider`, `provider_id`)
VALUES (4, 'nhi thieu phan', 'phangiatamthieu@gmail.com', NULL, NULL, 1, ' ', NULL, '2021-05-31 07:21:02',
        '2021-05-31 07:21:02', 0, NULL, 'google', '109759817659695674665'),
       (5, 'Phan Quoc Phu', 'phanquocphu1998@gmail.com', '0981805990', NULL, 1,
        '$2y$10$hPNkoNKdtrnf.2lUC72Lk.1aqW5Tl6sNSfp/QUYIxEvK7HVLG1L/.', NULL, '2021-05-31 20:03:26',
        '2021-06-01 20:14:05', 3, '47 đường 783 tạ quang bửu p4', 'google', '105984671964004971167'),
       (6, 'Phan Quoc Phu', '16110180@student.hcmute.edu.vn', NULL, NULL, 1, ' ', NULL, '2021-06-05 00:01:04',
        '2021-06-05 00:01:04', 0, NULL, 'google', '114615243600740308299'),
       (7, 'dai thieu phan', 'phangianhithieu@gmail.com', NULL, NULL, 1, ' ', NULL, '2021-06-07 03:17:22',
        '2021-06-07 03:17:22', 0, NULL, 'google', '108601473002403733010'),
       (13, 'Kiri Gaya', 'phanquocphu93@gmail.com', NULL, NULL, 1, ' ', NULL, '2021-06-13 19:17:32',
        '2021-06-13 19:17:32', 0, NULL, 'google', '100245910797596861093'),
       (15, 'Phan Trần Nguyên Phúc', 'phanquocphu19988@gmail.com', '0981805990', NULL, 1,
        '$2y$10$zXqyB5JtituO9deSa5WndOQMRjSoua8KWXIerAMAvvl16I0G9BESy', NULL, '2021-06-15 21:05:29',
        '2021-06-15 21:05:29', 0, NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `users_email_unique` (`email`),
    ADD KEY `users_active_index` (`active`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
