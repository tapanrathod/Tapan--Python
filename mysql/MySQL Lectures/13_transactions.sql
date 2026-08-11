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

-- SAVEPOINT : 



SELECT * FROM students;

START TRANSACTION;

INSERT INTO students VALUES (5, "xzy", 70);

SAVEPOINT add_student5;


UPDATE students SET name = "abcd" WHERE id = 4;

SAVEPOINT update_student4;

UPDATE students SET age = 80 WHERE id = 3;


SAVEPOINT update_student3;

DELETE FROM students WHERE id = 1;

SAVEPOINT delete_student1;

ROLLBACK TO update_student4;

ROLLBACK;

COMMIT;



-- RELEASE SAVEPOINT : 

SET autocommit = 1;


SELECT * FROM students;

START TRANSACTION;

INSERT INTO students VALUES (6, "jkl", 10);

SAVEPOINT step1;


UPDATE students SET name = "stu" WHERE id = 4;

SAVEPOINT step2;

UPDATE students SET age = 80 WHERE id = 3;


SAVEPOINT step3;

DELETE FROM students WHERE id = 1;

SAVEPOINT step4;

RELEASE SAVEPOINT step3;

ROLLBACK TO step2;

ROLLBACK;

COMMIT;