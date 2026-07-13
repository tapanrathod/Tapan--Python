-- Active: 1782301937005@@127.0.0.1@3306@schooldb
use SchoolDB;

INSERT INTO Students (StudentID, StudentName, Email, Age)
VALUES
    (1, 'Aarav Patel', 'aarav.patel@example.com', 18),
    (2, 'Vivaan Sharma', 'vivaan.sharma@example.com', 20),
    (3, 'Aditya Verma', 'aditya.verma@example.com', 17),
    (4, 'Ananya Gupta', 'ananya.gupta@example.com', 19),
    (5, 'Diya Mehta', 'diya.mehta@example.com', 16),
    (6, 'Rohan Shah', 'rohan.shah@example.com', 21),
    (7, 'Priya Nair', 'priya.nair@example.com', 22),
    (8, 'Arjun Reddy', 'arjun.reddy@example.com', 18),
    (9, 'Sneha Iyer', 'sneha.iyer@example.com', 20),
    (10, 'Rahul Yadav', 'rahul.yadav@example.com', 23),
    (11, 'Neha Singh', 'neha.singh@example.com', 15),
    (12, 'Karan Malhotra', 'karan.malhotra@example.com', 24),
    (13, 'Ishita Joshi', 'ishita.joshi@example.com', 19),
    (14, 'Manav Desai', 'manav.desai@example.com', 17),
    (15, 'Pooja Choudhary', 'pooja.choudhary@example.com', 25),
    (16, 'Yash Agarwal', 'yash.agarwal@example.com', 14),
    (17, 'Meera Kulkarni', 'meera.kulkarni@example.com', 18),
    (18, 'Nikhil Mishra', 'nikhil.mishra@example.com', 21),
    (19, 'Kavya Menon', 'kavya.menon@example.com', 16),
    (20, 'Siddharth Bansal', 'siddharth.bansal@example.com', 22);


SELECT * FROM students;

SELECT CONCAT(StudentName, "-", Age) as NameAge FROM students;

SELECT CONCAT_WS("-", StudentName, Age, Email) as NameAge FROM students;

SELECT LENGTH(StudentName) as NameLength, StudentName FROM students;

SELECT SUBSTRING(StudentName, 3, 3) as str, StudentName FROM students;

SELECT UPPER(`StudentName`) as upper, LOWER(`StudentName`) as lower FROM students;

SELECT REPLACE(Email, "example", "gmail") FROM students;

SELECT TRIM('    Hello        ');

SELECT INSTR(`StudentName`, "patel") FROM students;



SELECT CONCAT(123, "-", 4560);