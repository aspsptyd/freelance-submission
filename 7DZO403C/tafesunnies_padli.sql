-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 17, 2023 at 03:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tafesunnies_padli`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_detail`
--

CREATE TABLE `tbl_customer_detail` (
  `customer_id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer_detail`
--

INSERT INTO `tbl_customer_detail` (`customer_id`, `id_user`, `shipping_address`) VALUES
(1, 1, 'Bekasi Timur'),
(2, 2, 'Jakarta Pusat');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_cart`
--

CREATE TABLE `tbl_detail_cart` (
  `cart_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_detail_cart`
--

INSERT INTO `tbl_detail_cart` (`cart_detail_id`, `product_id`, `qty`) VALUES
(1, 1, 1),
(1, 3, 5),
(1, 4, 10),
(2, 2, 10),
(2, 5, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `product_number` varchar(60) DEFAULT NULL,
  `product_name` varchar(60) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `max_purchase_item` int(11) DEFAULT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_number`, `product_name`, `selling_price`, `description`, `max_purchase_item`, `discount_percent`, `id_user`, `created_at`, `update_at`) VALUES
(1, 'PRD0001', 'iPhone 6', 6899000, 'Elektronik', 1, 5, 3, '2023-05-17 19:00:00', '2023-05-17 19:00:00'),
(2, 'PRD0002', 'Meja Elektrik', 1580000, 'Aksesories', 10, 5, 3, '2023-05-17 19:00:00', '2023-05-17 19:00:01'),
(3, 'PRD0003', 'Modem AIT45', 556000, 'Elektronik', 5, 10, 3, '2023-05-17 19:00:00', '2023-05-17 19:00:02'),
(4, 'PRD0004', 'Printer Epson X4743', 4890000, 'Elektronik', 10, 10, 4, '2023-05-17 19:00:00', '2023-05-17 19:00:03'),
(5, 'PRD0001', 'Mouse Logitech A45', 58000, 'Elektronik', 100, 10, 4, '2023-05-17 19:00:00', '2023-05-17 19:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_order`
--

CREATE TABLE `tbl_sales_order` (
  `so_id` int(11) NOT NULL,
  `shopping_cart_id` int(11) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `status_purchase` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sales_order`
--

INSERT INTO `tbl_sales_order` (`so_id`, `shopping_cart_id`, `purchase_date`, `status_purchase`) VALUES
(1, 1, '0000-00-00 00:00:00', 'Belum Lunas'),
(2, 2, '2023-05-17 20:02:01', 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shopping_cart`
--

CREATE TABLE `tbl_shopping_cart` (
  `shopping_cart_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `cart_detail_id` int(11) DEFAULT NULL,
  `delivery_fee` int(11) DEFAULT NULL,
  `delivery_option` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shopping_cart`
--

INSERT INTO `tbl_shopping_cart` (`shopping_cart_id`, `customer_id`, `cart_detail_id`, `delivery_fee`, `delivery_option`, `created_at`, `update_at`) VALUES
(1, 1, 1, 5000, 'JNE', '2023-05-17 19:28:01', '2023-05-17 19:28:01'),
(2, 2, 2, 20000, 'J&T', '2023-05-17 19:28:02', '2023-05-17 19:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `access_role` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `email_address` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `first_name`, `last_name`, `access_role`, `address`, `username`, `password`, `phone_number`, `email_address`, `created_at`, `update_at`) VALUES
(1, 'Rina', 'Maulida', 'customer', 'Bekasi', 'rina', 'rina', '081xxxxx', 'rina@gmail.com', '2023-05-17 19:18:00', '2023-05-17 19:18:00'),
(2, 'Ardi', 'Herlambang', 'customer', 'Jakarta', 'ardi', 'ardi', '081xxxxx', 'ardi@gmail.com', '2023-05-17 19:18:01', '2023-05-17 19:18:01'),
(3, 'Arini', 'Sanjaya', 'administrator', 'Karawang', 'arini', 'arini', '081xxxxx', 'arini@gmail.com', '2023-05-17 19:18:02', '2023-05-17 19:18:02'),
(4, 'Widyawati', 'Dewi', 'staff', 'Bekasi', 'dewi', 'dewi', '081xxxxx', 'dewi@gmail.com', '2023-05-17 19:18:03', '2023-05-17 19:18:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_customer_detail`
--
ALTER TABLE `tbl_customer_detail`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tbl_detail_cart`
--
ALTER TABLE `tbl_detail_cart`
  ADD PRIMARY KEY (`cart_detail_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_sales_order`
--
ALTER TABLE `tbl_sales_order`
  ADD PRIMARY KEY (`so_id`),
  ADD KEY `shopping_cart_id` (`shopping_cart_id`);

--
-- Indexes for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
  ADD PRIMARY KEY (`shopping_cart_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `cart_detail_id` (`cart_detail_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_customer_detail`
--
ALTER TABLE `tbl_customer_detail`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_detail_cart`
--
ALTER TABLE `tbl_detail_cart`
  MODIFY `cart_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_sales_order`
--
ALTER TABLE `tbl_sales_order`
  MODIFY `so_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
  MODIFY `shopping_cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_customer_detail`
--
ALTER TABLE `tbl_customer_detail`
  ADD CONSTRAINT `tbl_customer_detail_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`);

--
-- Constraints for table `tbl_detail_cart`
--
ALTER TABLE `tbl_detail_cart`
  ADD CONSTRAINT `tbl_detail_cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`);

--
-- Constraints for table `tbl_sales_order`
--
ALTER TABLE `tbl_sales_order`
  ADD CONSTRAINT `tbl_sales_order_ibfk_1` FOREIGN KEY (`shopping_cart_id`) REFERENCES `tbl_shopping_cart` (`shopping_cart_id`);

--
-- Constraints for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
  ADD CONSTRAINT `tbl_shopping_cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer_detail` (`customer_id`),
  ADD CONSTRAINT `tbl_shopping_cart_ibfk_2` FOREIGN KEY (`cart_detail_id`) REFERENCES `tbl_detail_cart` (`cart_detail_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
