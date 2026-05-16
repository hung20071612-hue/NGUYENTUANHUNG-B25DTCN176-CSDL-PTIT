
CREATE DATABASE BookStore;

USE BookStore;

CREATE TABLE Books (
    BookID          INT             PRIMARY KEY AUTO_INCREMENT,
    Title           VARCHAR(255)    NOT NULL,
    Author          VARCHAR(255)    NOT NULL,
    Price           DECIMAL(10,2)   NOT NULL,
    PublicationDate DATE            NOT NULL
);

SELECT *
FROM Books;

SELECT Title, Author
FROM Books
WHERE Price > 50;