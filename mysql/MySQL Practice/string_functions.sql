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

SELECT CONCAT(StudentName, "-", Age) as NameAge FROM students; -- to concat the specific strings, it will require a separators between the concated strings

SELECT CONCAT_WS("-", StudentName, Age, Email) as NameAge FROM students; -- to concat the specific strings, it dosen't require a separators between the concated strings but only one time

SELECT LENGTH(StudentName) as NameLength, StudentName FROM students; -- to get length of the specific string

SELECT SUBSTRING(StudentName, 3, 3) as str, StudentName FROM students; -- to get sub string of the specific string

SELECT UPPER(`StudentName`) as upper, LOWER(`StudentName`) as lower FROM students; -- to make string uppercase

SELECT REPLACE(Email, "example", "gmail") FROM students; -- to replace a word or any latter in the specific string

SELECT TRIM('    Hello        '); -- to trim the specific string

SELECT INSTR(`StudentName`, "patel") FROM students; -- to get values of the specific string


SELECT CONCAT(123, "-", 4560); -- it can concat numbers also


---------------------------------------------------------------------------------------------------------------------------------------------------

USE SchoolDB;

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

-- CONCAT joins strings together; any separator must be passed manually as an individual argument
SELECT CONCAT(StudentName, "-", Age) as NameAge FROM students; 

-- CONCAT_WS (Separator) takes the first argument as a global separator and places it between all following strings automatically
SELECT CONCAT_WS("-", StudentName, Age, Email) as NameAge FROM students; 

-- Returns the length of the string (in bytes/characters)
SELECT LENGTH(StudentName) as NameLength, StudentName FROM students; 

-- Extracts a substring (Starting position, length) -> Extracts 3 characters starting from the 3rd character
SELECT SUBSTRING(StudentName, 3, 3) as str, StudentName FROM students; 

-- Converts strings to uppercase and lowercase respectively
SELECT UPPER(`StudentName`) as upper, LOWER(`StudentName`) as lower FROM students; 

-- Replaces all occurrences of a substring/letter with a new one ("latter" fixed to "letter")
SELECT REPLACE(Email, "example", "gmail") FROM students; 

-- Removes leading and trailing spaces from a string
SELECT TRIM('    Hello        '); 

-- Returns the position/index of the first occurrence of a substring (returns 0 if not found)
SELECT INSTR(`StudentName`, "patel") FROM students; 

-- Automatically converts numbers to strings to concatenate them
SELECT CONCAT(123, "-", 4560); 
