-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 07:30 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(30) NOT NULL,
  `GroupofSize` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`, `GroupofSize`) VALUES
(1, 'Shirt', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductImage` varchar(255) NOT NULL,
  `ProductTitle` varchar(30) NOT NULL,
  `ProductDescription` varchar(255) NOT NULL,
  `ProductPrice` int(11) NOT NULL,
  `Amount` int(6) NOT NULL,
  `ProductOwner` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductImage`, `ProductTitle`, `ProductDescription`, `ProductPrice`, `Amount`, `ProductOwner`, `CategoryID`, `Status`) VALUES
(2, 'abc.jpg', 'Shirt', 'ShirtA', 300, 7, 1, 1, 0),
(3, 'aaa.jpg', 'bbb', 'bbb', 0, 6, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productorder`
--

CREATE TABLE `productorder` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `BuyerID` int(11) NOT NULL,
  `Status` int(1) NOT NULL DEFAULT 0,
  `Amount` int(6) NOT NULL,
  `Size` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productorder`
--

INSERT INTO `productorder` (`OrderID`, `ProductID`, `BuyerID`, `Status`, `Amount`, `Size`) VALUES
(1, 3, 1, 1, 1, 'L'),
(2, 3, 1, 0, 1, 'L'),
(3, 3, 1, 0, 1, 'L');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `NameUser` varchar(40) NOT NULL,
  `UserEmail` varchar(30) NOT NULL,
  `UserTel` varchar(11) NOT NULL,
  `UserRole` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `UserName`, `Password`, `NameUser`, `UserEmail`, `UserTel`, `UserRole`) VALUES
(1, 'cickpool', '1234', 'Tee Jumpol1', 'asd@gamil.com1', '00000000001', 2);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `VoucherID` int(11) NOT NULL,
  `VoucherCode` varchar(30) NOT NULL,
  `VoucherValue` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`VoucherID`, `VoucherCode`, `VoucherValue`) VALUES
(1, 'KSDJFKLJFIO12', 130);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `ProductOwner` (`ProductOwner`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `productorder`
--
ALTER TABLE `productorder`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `BuyerID` (`BuyerID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`VoucherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `productorder`
--
ALTER TABLE `productorder`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `VoucherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ProductOwner`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);

--
-- Constraints for table `productorder`
--
ALTER TABLE `productorder`
  ADD CONSTRAINT `productorder_ibfk_1` FOREIGN KEY (`BuyerID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `productorder_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
