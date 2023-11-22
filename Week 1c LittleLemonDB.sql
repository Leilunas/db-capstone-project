-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "LittleLemonDB" -------------------------
CREATE DATABASE IF NOT EXISTS `LittleLemonDB` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `LittleLemonDB`;
-- ---------------------------------------------------------


-- CREATE TABLE "Delivery" -------------------------------------
CREATE TABLE `Delivery`( 
	`DeliveryID` Int( 0 ) NOT NULL,
	`DeliveryStatus` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`DeliveryDate` Date NOT NULL,
	PRIMARY KEY ( `DeliveryID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Menu" -----------------------------------------
CREATE TABLE `Menu`( 
	`MenuID` Int( 0 ) NOT NULL,
	`Cuisine` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`MenuName` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`MenuItemID` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `MenuID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Orders" ---------------------------------------
CREATE TABLE `Orders`( 
	`OrderID` Int( 0 ) NOT NULL,
	`OrderDate` Date NOT NULL,
	`Quantity` Int( 0 ) NOT NULL,
	`DeliveryID` Int( 0 ) NOT NULL,
	`MenuID` Int( 0 ) NOT NULL,
	`StaffID` Int( 0 ) NOT NULL,
	`CustomerID` Int( 0 ) NOT NULL,
	`Cost` Decimal( 10, 0 ) NOT NULL,
	`Sales` Decimal( 10, 0 ) NOT NULL,
	`Discount` Decimal( 10, 0 ) NOT NULL,
	`DeliveryCost` Decimal( 10, 0 ) NOT NULL,
	`BookingID` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `OrderID` ),
	CONSTRAINT `unique_DeliveryID` UNIQUE( `DeliveryID` ),
	CONSTRAINT `unique_MenuID` UNIQUE( `MenuID` ),
	CONSTRAINT `unique_OrderID` UNIQUE( `OrderID` ),
	CONSTRAINT `unique_StaffID` UNIQUE( `StaffID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Staff" ----------------------------------------
CREATE TABLE `Staff`( 
	`StaffID` Int( 0 ) NOT NULL,
	`FullName` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`RoleID` Int( 0 ) NOT NULL,
	`Salary` Decimal( 10, 0 ) NOT NULL,
	PRIMARY KEY ( `StaffID` ),
	CONSTRAINT `unique_StaffID` UNIQUE( `StaffID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Bookings" -------------------------------------
CREATE TABLE `Bookings`( 
	`TableNumber` Int( 0 ) NULL DEFAULT NULL,
	`BookingID` Int( 0 ) NOT NULL,
	`BookingDate` Int( 0 ) NOT NULL,
	`CustomerID` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `BookingID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Customers" ------------------------------------
CREATE TABLE `Customers`( 
	`CustomerID` Int( 0 ) NOT NULL,
	`CustomerName` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`AdressID` Int( 0 ) NOT NULL,
	`CustomerPhoneNumber` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `CustomerID` ),
	CONSTRAINT `unique_ClientID` UNIQUE( `CustomerID` ),
	CONSTRAINT `CustomerID` UNIQUE( `CustomerID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "MenuItems" ------------------------------------
CREATE TABLE `MenuItems`( 
	`CourseName` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`StarterName` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`DesertName` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`MenuItemID` Int( 0 ) NOT NULL,
	`Drink` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Dessert` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `MenuItemID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Adress" ---------------------------------------
CREATE TABLE `Adress`( 
	`AdressID` Int( 0 ) NOT NULL,
	`City` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Country` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`PostalCode` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `AdressID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Role" -----------------------------------------
CREATE TABLE `Role`( 
	`RoleID` Int( 0 ) NOT NULL,
	`RoleName` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `RoleID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- Dump data of "Delivery" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "Menu" -------------------------------------
-- ---------------------------------------------------------


-- Dump data of "Orders" -----------------------------------
-- ---------------------------------------------------------


-- Dump data of "Staff" ------------------------------------
-- ---------------------------------------------------------


-- Dump data of "Bookings" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "Customers" --------------------------------
-- ---------------------------------------------------------


-- Dump data of "MenuItems" --------------------------------
-- ---------------------------------------------------------


-- Dump data of "Adress" -----------------------------------
-- ---------------------------------------------------------


-- Dump data of "Role" -------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "index_DeliveryID" -----------------------------
CREATE INDEX `index_DeliveryID` USING BTREE ON `Delivery`( `DeliveryID` );-- -------------------------------------------------------------;


-- CREATE INDEX "index_ClientID" -------------------------------
CREATE INDEX `index_ClientID` USING BTREE ON `Orders`( `CustomerID` );-- -------------------------------------------------------------;


-- CREATE INDEX "lnk_Bookings_Orders" --------------------------
CREATE INDEX `lnk_Bookings_Orders` USING BTREE ON `Orders`( `BookingID` );-- -------------------------------------------------------------;


-- CREATE INDEX "lnk_Role_Staff" -------------------------------
CREATE INDEX `lnk_Role_Staff` USING BTREE ON `Staff`( `RoleID` );-- -------------------------------------------------------------;


-- CREATE INDEX "index_ReservationID" --------------------------
CREATE INDEX `index_ReservationID` USING BTREE ON `Bookings`( `BookingID` );-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Orders_Customers" --------------------------
ALTER TABLE `Customers`
	ADD CONSTRAINT `lnk_Orders_Customers` FOREIGN KEY ( `CustomerID` )
	REFERENCES `Orders`( `CustomerID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Bookings_Orders" ---------------------------
ALTER TABLE `Orders`
	ADD CONSTRAINT `lnk_Bookings_Orders` FOREIGN KEY ( `BookingID` )
	REFERENCES `Bookings`( `BookingID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Staff_Orders" ------------------------------
ALTER TABLE `Orders`
	ADD CONSTRAINT `lnk_Staff_Orders` FOREIGN KEY ( `StaffID` )
	REFERENCES `Staff`( `StaffID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Role_Staff" --------------------------------
ALTER TABLE `Staff`
	ADD CONSTRAINT `lnk_Role_Staff` FOREIGN KEY ( `RoleID` )
	REFERENCES `Role`( `RoleID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Menu_Orders" -------------------------------
ALTER TABLE `Orders`
	ADD CONSTRAINT `lnk_Menu_Orders` FOREIGN KEY ( `MenuID` )
	REFERENCES `Menu`( `MenuID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Delivery_Orders" ---------------------------
ALTER TABLE `Orders`
	ADD CONSTRAINT `lnk_Delivery_Orders` FOREIGN KEY ( `DeliveryID` )
	REFERENCES `Delivery`( `DeliveryID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_MenuItems_Menu" ----------------------------
ALTER TABLE `Menu`
	ADD CONSTRAINT `lnk_MenuItems_Menu` FOREIGN KEY ( `MenuItemID` )
	REFERENCES `MenuItems`( `MenuItemID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Adress_Customers" --------------------------
ALTER TABLE `Customers`
	ADD CONSTRAINT `lnk_Adress_Customers` FOREIGN KEY ( `AdressID` )
	REFERENCES `Adress`( `AdressID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


