CREATE DATABASE IF NOT EXISTS myblog;

USE myblog;

CREATE TABLE IF NOT EXISTS Users(
   userID INT AUTO_INCREMENT,
   name NVARCHAR(255),
   email VARCHAR(255),
   username VARCHAR(255) NOT NULL,
   password VARCHAR(255) NOT NULL,
   PRIMARY KEY (userID)
);

INSERT INTO Users(name, email, username, password) VALUES ('Cong Dat', 'congdat@gmail.com', 'tiny', '12345678');
INSERT INTO Users(name, email, username, password) VALUES ('Tiny', 'ncd.ccpn@gmail.com', 'tinynguyen', 'NcDat!0810');

select count(*) from Users where username='tiny' and password='12345672';