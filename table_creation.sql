CREATE DATABASE  IF NOT EXISTS `OnlineAuctionSystem`;
USE `OnlineAuctionSystem`;

CREATE TABLE `userlogin` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `interests` varchar(5000) default NULL,
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
  `name` varchar(50) NOT NULL DEFAULT 'Admin',
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
   PRIMARY KEY (`username`)
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
  `qaid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) default NULL,
  `customer_rep` varchar(3000) default NULL,
  `question` varchar(3000) default NULL,
  `answer` varchar(3000) default NULL,
   PRIMARY KEY (`qaid`),
   FOREIGN KEY (`username`) 
   REFERENCES userlogin(`username`) ON DELETE CASCADE,
   FOREIGN KEY (`customer_rep`) 
   REFERENCES CustomerReps(`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Alerts`;
CREATE TABLE `Alerts` (
  `alertid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `Itemid` int NOT NULL,
  `is_new_alert` bool default True,
  `is_transaction` bool default False,
   PRIMARY KEY (`alertid`),
   FOREIGN KEY (`username`) 
   REFERENCES userlogin(`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


USE `OnlineAuctionSystem`;

INSERT INTO `Admin` VALUES ('admin','Admin1','admin@gmail.com','admin','1111','admin');
INSERT INTO `CustomerReps` VALUES ('customer','cr@gmail.com','cr','cr','1111', 'cr'), ('customer1','cr1@gmail.com','cr1','cr1','1111', 'cr1');

INSERT INTO `userlogin` VALUES ('Vennela','chava.vinni@gmail.com','vinni','candy',NULL,NULL,'Laptop'),('Gayathr1','gr485@gmail.com','gaya3','heythere',NULL,NULL,'Mobile'),('Rohit','roh123@gmail.com','roh', 'abcda','415-567-1289','1500 Market St.','Accessory'),('Laxman','sanju@gmail.com','sanju', 'hello','345-567-1289',NULL,'Mobile');

INSERT INTO `Item` VALUES (1, 1000,'vinni','2023-06-06 10:10:10',1200,50,1100, 1), (2, 1000,'vinni','2023-06-06 10:10:10',1200,100,1100, 1);
INSERT INTO `ItemDetails` VALUES (1,'Razor Laptop','Laptop','silver','Razor',0,'razerlaptop.jpg'), (2,'Microsoft Laptop','Laptop','silver','SurfaceDuo',0,'mslaptop.jpg');

INSERT INTO `Item` VALUES (3, 600,'gaya3','2023-06-06 10:10:10',850,50,700, 1), (4, 300,'gaya3','2023-06-06 10:10:10',500,50,450, 1);
INSERT INTO `ItemDetails` VALUES (3,'iphone12','Mobile','silver','apple',0,'iphone12.jpg'), (4,'Pixel','Mobile','White','Pixel',1,'pixel.jpg');

INSERT INTO `Item` VALUES (5, 300,'roh','2023-06-06 10:10:10',1200,50,1100, 1), (6, 400,'roh','2023-06-06 10:10:10',1200,100,1100, 1);
INSERT INTO `ItemDetails` VALUES (5,'SonyXM5','Accessory','White','Sony',0,'headphone.jpg'), (6,'boat','Accessory','black','Boat',0,'boatearphones.jpg');


INSERT INTO `Transaction` VALUES (1, 'roh', 'sanju', 6), (2, 'roh', 'sanju', 5), (3, 'vinni', 'sanju', 1), (4, 'roh', 'sanju', 4);

INSERT INTO `userlogin` VALUES ('Deleteme','d.m@g.com','dm','dm',NULL,NULL,'Laptop');
INSERT INTO `Item` VALUES (7, 100,'dm','2023-06-06 10:10:10',10,50,10, 1);
INSERT INTO `ItemDetails` VALUES (7,'Razor Laptop','Laptop','silver','Razor',0,'razerlaptop.jpg');
INSERT INTO `Transaction` VALUES (5, 'dm', 'sanju', 7);

INSERT INTO `Bids` VALUES(1, 'sanju', 1, 1100, 1200, 0), (2, 'gaya3', 2, 1200, 400, 0);



CREATE EVENT update_item
ON SCHEDULE EVERY 1 minute
DO
  UPDATE Item SET  availability= false WHERE expireTime < NOW();

CREATE EVENT `check_item_expired1` 
ON SCHEDULE EVERY 1 MINUTE
DO 
	INSERT INTO Transaction (seller_username, buyer_username, Itemid)
	SELECT Item.username, Bids.username, Item.Itemid
	FROM Item INNER JOIN Bids ON Item.Itemid = Bids.Itemid
	WHERE Item.expireTime < NOW() AND Item.secretsellerprice <= Bids.pricelist 
	AND Bids.bidId = (SELECT bidId FROM Bids WHERE pricelist = (
      SELECT MAX(pricelist) FROM Bids WHERE Itemid = Item.Itemid) AND Itemid = Item.Itemid)
	AND NOT EXISTS (
    SELECT * FROM Transaction WHERE seller_username = Item.username AND buyer_username = Bids.username AND Itemid = Item.Itemid
  );
  
    
SET GLOBAL event_scheduler = ON;