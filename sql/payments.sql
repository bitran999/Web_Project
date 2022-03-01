-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 25, 2021 lúc 03:05 PM
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
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments`
(
    `id`                  bigint(20) UNSIGNED NOT NULL,
    `pTransactionId`    int(10) UNSIGNED                        DEFAULT NULL,
    `pUserId`           int(10) UNSIGNED                        DEFAULT NULL,
    `pMoney`             int(10)                                 DEFAULT NULL COMMENT 'Số tiền thanh toán',
    `pNote`              varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nội dung thanh toán',
    `pVnpResponseCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã phản hồi',
    `pCodeVnp`          varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã giao dịch vnpay',
    `pCodeBank`         varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã ngân hàng',
    `pTime`              datetime                                DEFAULT NULL COMMENT 'Thời gian chuyển tiền',
    `pTransactionCode`  varchar(30) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `created_at`          timestamp           NULL                DEFAULT NULL,
    `updatedAt`          timestamp           NULL                DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `pTransactionId`, `pUserId`, `pMoney`, `pNote`, `pVnpResponseCode`, `pCodeVnp`,
                        `pCodeBank`, `pTime`, `created_at`, `updatedAt`, `pTransactionCode`)
VALUES (7, 74, 5, 3600500, 'Noi dung thanh toan', '00', '13523265', 'NCB', '2021-06-13 23:32:00', NULL, NULL,
        'bj0Lb5bmCRAZORx'),
       (9, 122, 5, 3600500, 'Thanh toán đơn hàng', '00', '13557406', 'NCB', '2021-08-03 20:01:00', NULL, NULL,
        '8pCcNLXLpo3tPiM'),
       (10, 123, 5, 3600500, 'Thanh toán đơn hàng', '00', '13558287', 'NCB', '2021-08-05 09:21:00', NULL, NULL,
        'I5mqVdU2n6Z2yBu'),
       (12, 126, 5, 3996100, 'Thanh toán đơn hàng', '00', '13558876', 'NCB', '2021-08-05 19:52:00', NULL, NULL,
        'PTFkeRzp5P6LeTB'),
       (13, 127, 5, 1690000, 'Thanh toán đơn hàng', '00', '13558987', 'NCB', '2021-08-06 08:46:00', NULL, NULL,
        'WO5rp82i4AwfpEe'),
       (14, 128, 5, 24980000, 'Thanh toán đơn hàng', '00', '13559016', 'NCB', '2021-08-06 09:32:00', NULL, NULL,
        'I2kr7ig39YVJ3HB');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
    ADD PRIMARY KEY (`id`),
    ADD KEY `pTransactionId` (`pTransactionId`),
    ADD KEY `pUserId` (`pUserId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
    ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`pTransactionId`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`pUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
