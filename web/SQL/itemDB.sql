CREATE DATABASE Web;
USE Web;



create table Items
(
itemID varchar(220) NOT NULL ,
itemName nvarchar(100) NOT NULL,
itemPrice double NOT NULL,
itemImageData nvarchar(200) NOT NULL ,
itemImageName VARCHAR(30) not null,
  PRIMARY KEY(itemID)
)


select * from Items
itemsDELETE FROM Items WHERE itemID = '001';
INSERT INTO Items (itemID,itemName,itemPrice,itemImageData,itemImageName) VALUES ('002', '7 mau do',2200000,'img/White-Guppy.jpg','7 mau'); 
INSERT INTO Items (itemID,itemName,itemPrice,itemImageData,itemImageName) VALUES ('003', '7 mau xanh',1200000,'img/Yellow-Laser-Tail.jpg','7 mau'); 
INSERT INTO Items (itemID,itemName,itemPrice,itemImageData,itemImageName) VALUES ('004', '7 mau vang',400000,'img/blue-guppy.jpg','7 mau'); 
INSERT INTO Items (itemID,itemName,itemPrice,itemImageData,itemImageName) VALUES ('005', '7 mau tim',50000,'img/black-guppy.jpg','7 mau'); 
INSERT INTO Items (itemID,itemName,itemPrice,itemImageData,itemImageName) VALUES ('001', '7 mau rung',100000,'img/Purple-Queen-Guppy-Males.jpg','7 mau'); 

