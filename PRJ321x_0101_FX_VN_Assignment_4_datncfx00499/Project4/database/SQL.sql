CREATE DATABASE IF NOT EXISTS myblog;

USE myblog;

CREATE TABLE IF NOT EXISTS Users(
   userID INT AUTO_INCREMENT,
   username VARCHAR(255) NOT NULL,
   password VARCHAR(255) NOT NULL,
   PRIMARY KEY (userID)
);

INSERT INTO Users(username, password) VALUES ('tinynguyen', 'NcDat!0810');

CREATE TABLE IF NOT EXISTS Categories(
   categoryID INT AUTO_INCREMENT,
   title TINYTEXT NOT NULL,
   description TINYTEXT,
   CONSTRAINT PK_CategoryID PRIMARY KEY (categoryID)
);

INSERT INTO Categories(title, description) VALUES ('Java', 'Articles about Java');
INSERT INTO Categories(title, description) VALUES ('JavaScript', 'Articles about JavaScript');

CREATE TABLE IF NOT EXISTS Posts(
   postID INT AUTO_INCREMENT,
   title TINYTEXT NOT NULL,
   description TINYTEXT NOT NULL,
   content MEDIUMTEXT NOT NULL,
   category INT NOT NULL,
   user INT NOT NULL,
   dateCreate DATETIME NOT NULL,
   CONSTRAINT PK_PostID PRIMARY KEY (postID),
   CONSTRAINT FK_UserPost FOREIGN KEY (user) REFERENCES Users (userID),
   CONSTRAINT FK_PostCategory FOREIGN KEY (user) REFERENCES Users (userID)
);

INSERT INTO Posts(title, description, content, category, user, dateCreate) 
VALUES 
(
	'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
	'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
	'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
	1,
    1,
	NOW()
);



select * from Users;
select * from Categories;
select * from Posts;