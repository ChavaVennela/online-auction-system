CREATE DATABASE  IF NOT EXISTS `OnlineAuctionSystem`;
USE `OnlineAuctionSystem`;

INSERT INTO `userlogin` VALUES ('Vennela','chava.vinni@gmail.com','vinni','candy',NULL,NULL,'Laptop'),('Gayathr1','gr485@gmail.com','gaya3','heythere',NULL,NULL,'Mobile'),('Rohit','roh123@gmail.com','roh', 'abcda','415-567-1289','1500 Market St.','Accessory'),('Laxman','sanju@gmail.com','sanju', 'hello','345-567-1289',NULL,'Mobile');

INSERT INTO `userlogin` VALUES ('Deleteme','d.m@g.com','dm','dm',NULL,NULL,'Laptop');

INSERT INTO `Item` VALUES (1, 1000,'vinni','2023-06-06 10:10:10',1200,50,1100, 1), (2, 1000,'vinni','2023-06-06 10:10:10',1200,100,1100, 1);
INSERT INTO `ItemDetails` VALUES (1,'Razor Laptop','Laptop','silver','Razor',0,'razerlaptop.jpg'), (2,'Microsoft Laptop','Laptop','silver','SurfaceDuo',0,'mslaptop.jpg');

INSERT INTO `Item` VALUES (3, 600,'gaya3','2023-06-06 10:10:10',850,50,700, 1), (4, 300,'gaya3','2023-06-06 10:10:10',500,50,450, 1);
INSERT INTO `ItemDetails` VALUES (3,'iphone12','Mobile','silver','apple',0,'iphone12.jpg'), (4,'Pixel','Mobile','White','Pixel',1,'pixel.jpg');

INSERT INTO `Item` VALUES (5, 300,'roh','2023-06-06 10:10:10',1200,50,1100, 1), (6, 400,'roh','2023-06-06 10:10:10',1200,100,1100, 1);
INSERT INTO `ItemDetails` VALUES (5,'SonyXM5','Accessory','White','Sony',0,'headphone.jpg'), (6,'boat','Accessory','black','Boat',0,'boatearphones.jpg');


INSERT INTO `Transaction` VALUES (1, 'roh', 'sanju', 6), (2, 'roh', 'sanju', 5), (3, 'vinni', 'sanju', 1), (4, 'roh', 'sanju', 4);


CREATE EVENT update_item
ON SCHEDULE EVERY 1 minute
DO
  UPDATE Item SET  availability= false WHERE expireTime < NOW();

SET GLOBAL event_scheduler = ON;