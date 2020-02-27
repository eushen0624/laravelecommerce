-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 27, 2020 at 09:13 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b55laravelecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dark', NULL, NULL),
(2, 'Light', NULL, NULL),
(3, 'Creamy', NULL, NULL),
(4, 'So Deli', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgPath` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `description`, `imgPath`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Wag ka magupdate', '100.00', 'abug bug berna kita!! tapos tulfo', 'images/1582270560.jpeg', 2, '2020-02-20 23:36:00', '2020-02-26 17:19:21', '2020-02-26 17:19:21'),
(4, 'Dark Coffee', '150.00', 'Pure Arabica beans', 'images/1582522022.webp', 1, '2020-02-23 21:27:02', '2020-02-23 21:27:02', NULL),
(5, 'Brown Coffee', '150.00', 'Mascuvado sugar', 'images/1582526377.jpg', 2, '2020-02-23 22:39:37', '2020-02-23 22:39:37', NULL),
(6, 'Chocolate Chip Cookie', '250.00', 'Best cookie in town', 'images/1582766815.jpg', 4, '2020-02-26 17:26:55', '2020-02-26 17:26:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_order`
--

CREATE TABLE `item_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_order`
--

INSERT INTO `item_order` (`id`, `order_id`, `item_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 3, '2020-02-24 00:34:54', '2020-02-24 00:34:54'),
(2, 1, 5, 1, '2020-02-24 00:34:54', '2020-02-24 00:34:54'),
(3, 1, 4, 1, '2020-02-24 00:34:54', '2020-02-24 00:34:54'),
(4, 3, 3, 1, '2020-02-25 16:54:37', '2020-02-25 16:54:37'),
(5, 3, 5, 1, '2020-02-25 16:54:37', '2020-02-25 16:54:37'),
(6, 4, 4, 2, '2020-02-25 17:25:21', '2020-02-25 17:25:21'),
(7, 4, 3, 1, '2020-02-25 17:25:21', '2020-02-25 17:25:21'),
(8, 4, 5, 2, '2020-02-25 17:25:21', '2020-02-25 17:25:21'),
(9, 5, 4, 1, '2020-02-25 17:27:44', '2020-02-25 17:27:44'),
(10, 5, 5, 1, '2020-02-25 17:27:44', '2020-02-25 17:27:44'),
(11, 6, 4, 2, '2020-02-25 17:31:13', '2020-02-25 17:31:13'),
(12, 6, 5, 1, '2020-02-25 17:31:13', '2020-02-25 17:31:13'),
(13, 7, 4, 1, '2020-02-25 17:34:44', '2020-02-25 17:34:44'),
(14, 8, 4, 2, '2020-02-25 17:36:03', '2020-02-25 17:36:03'),
(15, 9, 3, 3, '2020-02-25 21:04:05', '2020-02-25 21:04:05'),
(16, 9, 4, 4, '2020-02-25 21:04:05', '2020-02-25 21:04:05'),
(17, 10, 5, 2, '2020-02-25 21:04:21', '2020-02-25 21:04:21'),
(18, 10, 4, 2, '2020-02-25 21:04:21', '2020-02-25 21:04:21'),
(19, 11, 4, 2, '2020-02-25 21:05:33', '2020-02-25 21:05:33'),
(20, 11, 5, 2, '2020-02-25 21:05:33', '2020-02-25 21:05:33'),
(21, 12, 4, 2, '2020-02-25 21:08:13', '2020-02-25 21:08:13'),
(22, 12, 5, 2, '2020-02-25 21:08:13', '2020-02-25 21:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_02_21_002514_create_roles_table', 1),
(5, '2020_02_21_002530_create_categories_table', 1),
(6, '2020_02_21_002539_create_statuses_table', 1),
(7, '2020_02_21_002546_create_payments_table', 1),
(8, '2020_02_21_002558_create_items_table', 1),
(9, '2020_02_21_002603_create_orders_table', 1),
(10, '2020_02_21_003045_create_item_order_table', 1),
(11, '2020_02_21_004243_add_role_to_user', 1),
(12, '2020_02_26_080014_add_details_to_users', 2),
(13, '2020_02_27_003538_add_soft_delete_to_items', 3),
(14, '2020_02_27_005927_add_soft_delete_to_items', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `total`, `user_id`, `status_id`, `payment_id`, `created_at`, `updated_at`) VALUES
(1, '600.00', 2, 3, 1, '2020-02-24 00:34:54', '2020-02-25 17:22:46'),
(2, '0.00', 2, 4, 1, '2020-02-24 00:43:03', '2020-02-25 17:12:29'),
(3, '250.00', 2, 4, 1, '2020-02-25 16:54:37', '2020-02-25 17:17:00'),
(4, '700.00', 2, 3, 1, '2020-02-25 17:25:21', '2020-02-25 17:26:20'),
(5, '300.00', 2, 3, 1, '2020-02-25 17:27:44', '2020-02-25 17:27:58'),
(6, '450.00', 2, 3, 1, '2020-02-25 17:31:13', '2020-02-25 17:31:48'),
(7, '150.00', 2, 1, 1, '2020-02-25 17:34:44', '2020-02-25 17:34:44'),
(8, '300.00', 2, 1, 1, '2020-02-25 17:36:03', '2020-02-25 17:36:03'),
(9, '900.00', 5, 1, 1, '2020-02-25 21:04:05', '2020-02-25 21:04:05'),
(10, '600.00', 5, 3, 1, '2020-02-25 21:04:21', '2020-02-25 21:08:22'),
(11, '600.00', 5, 1, 1, '2020-02-25 21:05:33', '2020-02-25 21:05:33'),
(12, '600.00', 5, 3, 1, '2020-02-25 21:08:13', '2020-02-25 21:08:19');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('hindiakouser@gmail.com', '$2y$10$.7qBp1nske5RFytkHAYseuvzZFAF8BA/UsVoDstFrLTBGiMqry7n.', '2020-02-25 22:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cash On Delivery', NULL, NULL),
(2, 'Paypal', NULL, NULL),
(3, 'Stripe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'User', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pending', NULL, NULL),
(2, 'Processing', NULL, NULL),
(3, 'Cancelled By User', NULL, NULL),
(4, 'Cancelled by Admin', NULL, NULL),
(5, 'Delivered', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `address`, `phone`) VALUES
(1, 'JustAUser', 'userako@user.com', NULL, '$2y$10$qiZIUGW4CMPVENvVz0JKjOmt7GUHHkkDxm8TKfekpKU0S6LwCjYJC', NULL, '2020-02-20 23:10:36', '2020-02-25 18:18:22', 1, NULL, NULL),
(2, 'userlang', 'user@user.com', NULL, '$2y$10$WfxGls90A.Nq2uhODukFa.Ywg8TEj3bLnceA4fxYM1levxuQChGEK', NULL, '2020-02-24 00:32:01', '2020-02-25 19:01:02', 1, NULL, NULL),
(5, 'UserAko', 'user2@user.com', NULL, '$2y$10$pYYSQV1HsH/7QI2zOcudHu3/hfSx/jA..0RjrMWq27RAcpBAKcZFm', NULL, '2020-02-25 19:05:35', '2020-02-25 19:05:35', 2, NULL, NULL),
(6, 'adminako', 'admin@admin.com', NULL, '$2y$10$PU46KaGxO1cWj7A0pePY9uIbsTgPwOEAgitvJ61GAH1/n9jTaFbQy', NULL, '2020-02-25 19:29:14', '2020-02-25 23:00:52', 1, NULL, NULL),
(7, 'hindiako user', 'hindiakouser@gmail.com', NULL, '$2y$10$JC25NnHx.kzIxk/mBrhfVOao01kLvdotJe6qZICGS4IN5wqH55.p2', NULL, '2020-02-25 22:05:43', '2020-02-25 22:05:43', 2, NULL, NULL),
(8, 'eushen', 'eushenadmin@admin.com', NULL, '$2y$10$3xmoicFtAQ7RVEYKA5FLeO70FQ5vDdGwmYD/9xpa4x7m0hpZFMRnS', NULL, '2020-02-26 00:13:31', '2020-02-26 00:13:31', 2, NULL, NULL),
(9, 'test1', 'test1@test.com', NULL, '$2y$10$TF59uXlQ.THZQGD6/SI5DuVf4sYLYElgD8hVh1rleLtYuueNY98q2', NULL, '2020-02-26 00:15:23', '2020-02-26 00:15:23', 2, 'makati city', '09541561525');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `item_order`
--
ALTER TABLE `item_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_order_order_id_foreign` (`order_id`),
  ADD KEY `item_order_item_id_foreign` (`item_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_status_id_foreign` (`status_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item_order`
--
ALTER TABLE `item_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `item_order`
--
ALTER TABLE `item_order`
  ADD CONSTRAINT `item_order_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `item_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
