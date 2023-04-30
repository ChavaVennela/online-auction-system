CREATE DATABASE  IF NOT EXISTS `OnlineAuctionSystem`;
USE `OnlineAuctionSystem`;

CREATE TABLE `userlogin` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `interests` varchar(5000) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `CustomerReps`;
CREATE TABLE `CustomerReps` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
   PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin` (
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
   PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `BankDetails`;
CREATE TABLE `BankDetails` (
  `username` varchar(30) NOT NULL,
  `account_num` char(10) NOT NULL,
  `routing_num` varchar(8) DEFAULT NULL,
  `bank_name` varchar(10) DEFAULT NULL,
   PRIMARY KEY (`account_num`),
   FOREIGN KEY (`username`) 
   REFERENCES userlogin(`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Item` (
  `Itemid` int NOT NULL AUTO_INCREMENT,
  `Price` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `expireTime` DATETIME NOT NULL,
  `secretsellerprice` int NOT NULL,
  `increment` int NOT NULL,
  `currentbid` int NOT NULL,
  `availability` bool NOT NULL,
   PRIMARY KEY (`Itemid`),
   FOREIGN KEY (`username`) 
   REFERENCES userlogin(`username`)
   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `ItemDetails`;
CREATE TABLE `ItemDetails` (
  `Itemid` int NOT NULL,
  `Itemname` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `color` char(10) default NULL,
  `brand` varchar(10) default NULL,
  `refurbished` bool NOT NULL,
   `imgpath` VARCHAR(255) default NULL,
   PRIMARY KEY (`category`,`Itemid`),
   FOREIGN KEY (`Itemid`) 
   REFERENCES Item(`Itemid`)
   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Bids`;
CREATE TABLE `Bids` (
  `bidId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `Itemid` int NOT NULL,
  `pricelist` varchar(5000) NOT NULL,
  `maxlimit` int default NULL,
  `autobid1` bool default False,
   PRIMARY KEY (`bidId`),
   FOREIGN KEY (`username`) 
   REFERENCES userlogin(`username`) ON DELETE CASCADE,
   FOREIGN KEY (`Itemid`) 
   REFERENCES Item(`Itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Transaction`;
CREATE TABLE `Transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `seller_username` varchar(30) NOT NULL,
  `buyer_username` varchar(30) NOT NULL,
  `Itemid` int NOT NULL,
   PRIMARY KEY (`transaction_id`),
   FOREIGN KEY (`seller_username`) 
   REFERENCES userlogin(`username`) ON DELETE CASCADE,
   FOREIGN KEY (`buyer_username`) 
   REFERENCES userlogin(`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Q/A`;
CREATE TABLE `Q/A` (
  `username` varchar(30) NOT NULL,
  `customer_rep` varchar(3000) NOT NULL,
  `question` varchar(3000) NOT NULL,
  `answer` varchar(3000) NOT NULL,
   PRIMARY KEY (`username`, `customer_rep`),
   FOREIGN KEY (`username`) 
   REFERENCES userlogin(`username`) ON DELETE CASCADE,
   FOREIGN KEY (`customer_rep`) 
   REFERENCES CustomerReps(`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;