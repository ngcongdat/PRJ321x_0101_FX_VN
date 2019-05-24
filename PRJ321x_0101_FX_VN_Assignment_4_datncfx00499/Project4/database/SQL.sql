CREATE DATABASE IF NOT EXISTS myblog;

USE myblog;

CREATE TABLE IF NOT EXISTS Users(
   userID INT AUTO_INCREMENT,
   username VARCHAR(255) NOT NULL,
   password VARCHAR(255) NOT NULL,
   PRIMARY KEY (userID)
);

INSERT INTO Users(username, password) VALUES ('tinynguyen', 'NcDat!0810');

select * from Users;