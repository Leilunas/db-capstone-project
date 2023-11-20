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


-- CREATE TABLE "Client" ---------------------------------------
CREATE TABLE `Client`( 
	`ClientID` Int( 0 ) NOT NULL,
	`ClientName` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`ClientAdress` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`ClientPhoneNumber` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Client_id` Int( 0 ) NOT NULL,
	`Client_id_2` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `Client_id_2` ),
	CONSTRAINT `unique_Client_id` UNIQUE( `Client_id` ),
	CONSTRAINT `unique_ClientID` UNIQUE( `ClientID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Delivery" -------------------------------------
CREATE TABLE `Delivery`( 
	`DeliveryID` Int( 0 ) NOT NULL,
	`DeliveryStatus` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`DeliveryDate` Date NOT NULL,
	`Delivery_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `DeliveryID` ),
	CONSTRAINT `unique_Delivery_id` UNIQUE( `Delivery_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Menu" -----------------------------------------
CREATE TABLE `Menu`( 
	`MenuID` Int( 0 ) NOT NULL,
	`Starter` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Main` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Dessert` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Menu_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `MenuID` ),
	CONSTRAINT `unique_Menu_id` UNIQUE( `Menu_id` ),
	CONSTRAINT `unique_MenuID` UNIQUE( `MenuID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Orders" ---------------------------------------
CREATE TABLE `Orders`( 
	`OrderID` Int( 0 ) NOT NULL,
	`OrderDate` Date NOT NULL,
	`Quantity` Int( 0 ) NOT NULL,
	`TotalCost` Decimal( 10, 0 ) NOT NULL,
	`ReservationID` Int( 0 ) NOT NULL,
	`DeliveryID` Int( 0 ) NOT NULL,
	`ClientID` Int( 0 ) NOT NULL,
	`MenuID` Int( 0 ) NOT NULL,
	`StaffID` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `OrderID` ),
	CONSTRAINT `unique_DeliveryID` UNIQUE( `DeliveryID` ),
	CONSTRAINT `unique_MenuID` UNIQUE( `MenuID` ),
	CONSTRAINT `unique_OrderID` UNIQUE( `OrderID` ),
	CONSTRAINT `unique_ReservationID` UNIQUE( `ReservationID` ),
	CONSTRAINT `unique_StaffID` UNIQUE( `StaffID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Reservations" ---------------------------------
CREATE TABLE `Reservations`( 
	`ReservationID` Int( 0 ) NOT NULL,
	`ReservationDate` Date NOT NULL,
	`TableNumber` Int( 0 ) NULL DEFAULT NULL,
	`Reservations_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `ReservationID` ),
	CONSTRAINT `unique_Reservations_id` UNIQUE( `Reservations_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "Staff" ----------------------------------------
CREATE TABLE `Staff`( 
	`StaffID` Int( 0 ) NOT NULL,
	`Name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Surname` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Position` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Salary` Decimal( 10, 0 ) NOT NULL,
	`Staff_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `StaffID` ),
	CONSTRAINT `unique_Staff_id` UNIQUE( `Staff_id` ),
	CONSTRAINT `unique_StaffID` UNIQUE( `StaffID` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- Dump data of "Client" -----------------------------------
-- ---------------------------------------------------------


-- Dump data of "Delivery" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "Menu" -------------------------------------
-- ---------------------------------------------------------


-- Dump data of "Orders" -----------------------------------
-- ---------------------------------------------------------


-- Dump data of "Reservations" -----------------------------
-- ---------------------------------------------------------


-- Dump data of "Staff" ------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "index_DeliveryID" -----------------------------
CREATE INDEX `index_DeliveryID` USING BTREE ON `Delivery`( `DeliveryID` );-- -------------------------------------------------------------;


-- CREATE INDEX "index_ClientID" -------------------------------
CREATE INDEX `index_ClientID` USING BTREE ON `Orders`( `ClientID` );-- -------------------------------------------------------------;


-- CREATE INDEX "index_ReservationID" --------------------------
CREATE INDEX `index_ReservationID` USING BTREE ON `Reservations`( `ReservationID` );-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Client_Client" -----------------------------
ALTER TABLE `Orders`
	ADD CONSTRAINT `lnk_Client_Client` FOREIGN KEY ( `ClientID` )
	REFERENCES `Client`( `Client_id_2` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Delivery_Delivery" -------------------------
ALTER TABLE `Orders`
	ADD CONSTRAINT `lnk_Delivery_Delivery` FOREIGN KEY ( `DeliveryID` )
	REFERENCES `Delivery`( `DeliveryID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Menu_Menu" ---------------------------------
ALTER TABLE `Orders`
	ADD CONSTRAINT `lnk_Menu_Menu` FOREIGN KEY ( `MenuID` )
	REFERENCES `Menu`( `MenuID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Reservations_Reservations" -----------------
ALTER TABLE `Orders`
	ADD CONSTRAINT `lnk_Reservations_Reservations` FOREIGN KEY ( `ReservationID` )
	REFERENCES `Reservations`( `ReservationID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


-- CREATE LINK "lnk_Staff_Staff" -------------------------------
ALTER TABLE `Orders`
	ADD CONSTRAINT `lnk_Staff_Staff` FOREIGN KEY ( `StaffID` )
	REFERENCES `Staff`( `StaffID` )
	ON DELETE Cascade
	ON UPDATE Cascade;-- -------------------------------------------------------------;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


