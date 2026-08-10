-- Active: 1782301937005@@127.0.0.1@3306@transaction_db
CREATE DATABASE transaction_db;

USE transaction_db;

CREATE Table students (
    id INT PRIMARY KEY ,
    name VARCHAR(50),
    age INT
)


INSERT INTO students values(1, "abc", 30);

SELECT * FROM students;

START TRANSACTION;

INSERT INTO students VALUES (2, "xyz", 70);

ROLLBACK;


START TRANSACTION;

UPDATE students SET age = 90 WHERE id = 2;

SELECT * FROM students;

ROLLBACK;


START TRANSACTION;

INSERT INTO students VALUES (3, "pqr", 50);

COMMIT;


START TRANSACTION;

INSERT INTO students VALUES (4, "stu", 60);

COMMIT;

SELECT * FROM students;

ROLLBACK;

SELECT * FROM students;

--