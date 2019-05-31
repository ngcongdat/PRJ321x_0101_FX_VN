CREATE DATABASE IF NOT EXISTS MailWebApp;

USE MailWebApp;

CREATE TABLE IF NOT EXISTS Users(
   userId INT AUTO_INCREMENT,
   email NVARCHAR(255) NOT NULL,
   username VARCHAR(255) NOT NULL,
   password VARCHAR(32) NOT NULL,
   CONSTRAINT PK_UsersId PRIMARY KEY (userID)
);

INSERT INTO Users(email, username, password) VALUES ('ncd.ccpn@gmail.com', 'admin', 'admin');

CREATE TABLE IF NOT EXISTS MyMail(

);