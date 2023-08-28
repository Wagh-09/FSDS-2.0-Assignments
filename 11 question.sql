CREATE DATABASE test;
USE test;
CREATE TABLE Student (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(25)
);
INSERT INTO Student (ID, Name, Age, Address)
VALUES
    (1, 'Alice', 20, '123 Main St'),
    (2, 'Bob', 22, '456 Elm Ave');

