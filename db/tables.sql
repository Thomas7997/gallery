CREATE TABLE IF NOT EXISTS Users(
   Id_user VARCHAR(50),
   username VARCHAR(50) NOT NULL,
   firstname VARCHAR(50) NOT NULL,
   createdAt DATE NOT NULL,
   galleryName VARCHAR(50),
   lastname VARCHAR(50) NOT NULL,
   birth DATE NOT NULL,
   email VARCHAR(255) NOT NULL,
   phone VARCHAR(15),
   galleryMediasNb INT,
   galleryUploadedSize INT,
   updatedAt DATE,
   theme BYTE,
   storageAlert INT,
   inactivity INT,
   mediasNb INT,
   sizeUploaded VARCHAR(50),
   PRIMARY KEY(Id_user)
);

CREATE TABLE IF NOT EXISTS Album(
   Id_album VARCHAR(50),
   name VARCHAR(50) NOT NULL,
   mediasNb INT,
   size INT,
   createdAt DATE,
   updatedAt DATE,
   Id_user VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_album),
   FOREIGN KEY(Id_user) REFERENCES Users(Id_user)
);

CREATE TABLE IF NOT EXISTS Media(
   Id_media VARCHAR(50),
   name VARCHAR(50) NOT NULL,
   locationX DOUBLE,
   updatedAt DATE,
   url VARCHAR(255) NOT NULL,
   ssid VARCHAR(50) NOT NULL,
   model VARCHAR(50) NOT NULL,
   locationY INT,
   createdAt DATE,
   Id_user VARCHAR(50) NOT NULL,
   Id_album VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_media),
   FOREIGN KEY(Id_user) REFERENCES Users(Id_user),
   FOREIGN KEY(Id_album) REFERENCES Album(Id_album)
);

CREATE TABLE IF NOT EXISTS Message(
   Id_message VARCHAR(50),
   messageStr TEXT NOT NULL,
   createdAt DATETIME NOT NULL,
   PRIMARY KEY(Id_message)
);

CREATE TABLE IF NOT EXISTS UserAppreciation(
   Id_user VARCHAR(50),
   Id_media VARCHAR(50),
   rates INT,
   createdAt DATETIME NOT NULL,
   PRIMARY KEY(Id_user, Id_media),
   FOREIGN KEY(Id_user) REFERENCES Users(Id_user),
   FOREIGN KEY(Id_media) REFERENCES Media(Id_media)
);

CREATE TABLE IF NOT EXISTS Friend(
   Id_user VARCHAR(50),
   Id_user_1 VARCHAR(50),
   createdAt DATETIME NOT NULL,
   PRIMARY KEY(Id_user, Id_user_1),
   FOREIGN KEY(Id_user) REFERENCES Users(Id_user),
   FOREIGN KEY(Id_user_1) REFERENCES Users(Id_user)
);

CREATE TABLE IF NOT EXISTS Comment(
   Id_user VARCHAR(50),
   Id_media VARCHAR(50),
   commentStr TEXT NOT NULL,
   createdAt DATETIME NOT NULL,
   PRIMARY KEY(Id_user, Id_media),
   FOREIGN KEY(Id_user) REFERENCES Users(Id_user),
   FOREIGN KEY(Id_media) REFERENCES Media(Id_media)
);

CREATE TABLE IF NOT EXISTS Conversation(
   Id_user VARCHAR(50),
   Id_message VARCHAR(50),
   PRIMARY KEY(Id_user, Id_message),
   FOREIGN KEY(Id_user) REFERENCES Users(Id_user),
   FOREIGN KEY(Id_message) REFERENCES Message(Id_message)
);
