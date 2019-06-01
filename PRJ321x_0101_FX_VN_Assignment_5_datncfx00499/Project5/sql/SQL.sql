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
	emailId INT AUTO_INCREMENT,
    user INT NOT NULL,
    toAddress VARCHAR(255),
    ccAddress VARCHAR(255),
    subject TINYTEXT,
    content MEDIUMTEXT,
    dateSend DATETIME,
    CONSTRAINT PK_EmailId PRIMARY KEY (emailId),
    CONSTRAINT FK_UserMail FOREIGN KEY FK_User(user) REFERENCES Users(userId)
);

SELECT * FROM Users;
SELECT * FROM MyMail;
