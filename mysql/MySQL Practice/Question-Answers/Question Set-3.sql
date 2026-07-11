-- Active: 1782301937005@@127.0.0.1@3306@restaurantdb

==========================================================
-- INSERT DATA FOR PRACTICE
==========================================================

----------------------------------------------------------
-- Students
----------------------------------------------------------
USE SchoolDB;

INSERT INTO Students (StudentID, StudentName, Email, Age) 
VALUES
(105, 'Anjali', 'anjali@gmail.com', 22),
(106, 'Rohan', 'rohan@gmail.com', 23),
(107, 'Pooja', 'pooja@gmail.com', 20);

----------------------------------------------------------
-- Books
----------------------------------------------------------
USE LibraryDB;

INSERT INTO Books (BookID, Title, Author, ISBN, Price) 
VALUES
(5, 'C Programming', 'Dennis Ritchie', 'BK1005', 450.75),
(6, 'Machine Learning', 'Andrew Ng', 'BK1006', 999.99),
(7, 'Data Structures', 'Mark Allen', 'BK1007', 725.50);

----------------------------------------------------------
-- Employees
----------------------------------------------------------
USE EmployeeDB;

INSERT INTO Employees (EmployeeID, EmployeeName, Email, Salary) 
VALUES
(505, 'Priya', 'priya@gmail.com', 55000),
(506, 'Kunal', 'kunal@gmail.com', 48000),
(507, 'Ritika', 'ritika@gmail.com', 72000);

----------------------------------------------------------
-- Patients
----------------------------------------------------------
USE HospitalDB;

INSERT INTO Patients (PatientID, PatientName, Phone, Age) 
VALUES
(305, 'Ankit', '9876500004', 45),
(306, 'Nisha', '9876500005', 29),
(307, 'Deepak', '9876500006', 38);

----------------------------------------------------------
-- Accounts
----------------------------------------------------------
USE BankDB;

INSERT INTO Accounts (AccountNo, CustomerName, AadhaarNo, Balance) 
VALUES
(10002, 'Meena', '234523452345', 15000.50),
(10003, 'Suresh', '345634563456', 78000.75),
(10004, 'Anil', '456745674567', 5000.25);

----------------------------------------------------------
-- MenuItems
----------------------------------------------------------
USE RestaurantDB;

INSERT INTO MenuItems (ItemID, ItemName, Price) 
VALUES
(5, 'French Fries', 150.50),
(6, 'Cold Coffee', 120.75),
(7, 'Momos', 180.25);

----------------------------------------------------------
-- Movies
----------------------------------------------------------
USE MovieDB;

INSERT INTO Movies (MovieID, MovieName, Language, Rating) 
VALUES
(202, '3 Idiots', 'Hindi', 9),
(203, 'Inception', 'English', 8),
(204, 'KGF', 'Kannada', 9);

----------------------------------------------------------
-- Players
----------------------------------------------------------
USE SportsDB;

INSERT INTO Players (PlayerID, PlayerName, JerseyNo, Age) 
VALUES
(16, 'Rohit', 45, 38),
(17, 'Hardik', 33, 32),
(18, 'Jasprit', 93, 31);

----------------------------------------------------------
-- Passengers
----------------------------------------------------------
USE TravelDB;

INSERT INTO Passengers (PassengerID, PassengerName, PassportNo, Age) 
VALUES
(402, 'Aman', 'P1234568', 34),
(403, 'Kavya', 'P1234569', 26),
(404, 'Harsh', 'P1234570', 30);

----------------------------------------------------------
-- Courses
----------------------------------------------------------
USE CollegeDB;

INSERT INTO Courses (CourseID, CourseName, CourseCode, Duration) 
VALUES
(11, 'Artificial Intelligence', 'AI201', 18),
(12, 'Web Development', 'WD301', 6),
(13, 'Cyber Security', 'CS401', 10);

-- ==========================================================
--         MYSQL PRACTICE QUESTIONS
--         Number Functions & String Functions
-- ==========================================================

-- ----------------------------------------------------------
-- NUMBER FUNCTIONS
-- ----------------------------------------------------------

-- 1. Display all employees along with the square root of their salary.

USE EmployeeDB;

SELECT SQRT(Salary) AS Salary_Square_Root FROM Employees;

-- 2. Display the price of every book after rounding it to the nearest whole number.

USE LibraryDB;

SELECT ROUND(Price) AS Rounded_Price FROM Books;

-- 3. Display the balance of every account and round it to 2 decimal places.

USE BankDB;

SELECT ROUND(Balance, 2) AS Rounded_Balance FROM Accounts;

-- 4. Display the remainder when each EmployeeID is divided by 5.

USE EmployeeDB;

SELECT EmployeeID % 5 AS Remainder FROM Employees;

-- 5. Display the square of the age of every student using the POWER() function.

USE SchoolDB;

SELECT POWER(Age, 2) AS Age_Square FROM Students;

-- 6. Display the ceiling and floor values of every menu item's price.

USE RestaurantDB;

SELECT CEIL(Price) AS Ceiling_Price, FLOOR(Price) AS Floor_Price FROM MenuItems;

-- 7. Display the absolute value of (Salary - 50000) for every employee.

USE EmployeeDB;

SELECT ABS(Salary - 50000) AS Salary_Difference FROM Employees;

-- 8. Display the square root of the age of every patient.

USE HospitalDB;

SELECT SQRT(Age) AS Age_Square_Root FROM Patients;

-- 9. Display the cube of the duration of every course.

USE CollegeDB;

SELECT POWER(Duration, 3) AS Duration_Cube FROM Courses;

-- 10. Display the remainder when each PlayerID is divided by 4.

USE SportsDB;

SELECT PlayerID % 4 AS Remainder FROM Players;

-- ----------------------------------------------------------
-- STRING FUNCTIONS
-- ----------------------------------------------------------

-- 11. Display each student's name in uppercase.

USE SchoolDB;

SELECT UPPER(StudentName) AS Uppercase_Name FROM Students;

-- 12. Display each employee's email address in lowercase.

USE EmployeeDB;

SELECT LOWER(Email) AS Lowercase_Email FROM Employees;

-- 13. Display each book with the format:
--     Title - Author
--     using CONCAT().

USE LibraryDB;

SELECT CONCAT(Title, ' - ', Author) AS Book_Info FROM Books;

-- 14. Display each passenger's name and passport number using CONCAT_WS(' | ', ...).

USE TravelDB;

SELECT CONCAT_WS(' | ', PassengerName, PassportNo) AS Passenger_Info FROM Passengers;

-- 15. Display the length of every movie name.

USE MovieDB;

SELECT LENGTH(MovieName) AS Movie_Length FROM Movies;

-- 16. Display the first 4 characters of every course name.

USE CollegeDB;

SELECT SUBSTRING(CourseName, 1, 4) AS Course_Prefix FROM Courses;

-- 17. Replace 'gmail.com' with 'example.com' in all employee email addresses (display only, do not update).

USE EmployeeDB;

SELECT REPLACE(Email, 'gmail.com', 'example.com') AS Updated_Email FROM Employees;

-- 18. Find the position of '@' in every student's email address.

USE SchoolDB;

SELECT LOCATE('@', Email) AS Email_Position FROM Students;

-- 19. Remove leading and trailing spaces from the following text:
--     '      Welcome to MySQL      '

SELECT TRIM('      Welcome to MySQL      ') AS Cleaned_Text;

-- 20. Display each menu item in the following format:
--     ITEMNAME costs ₹PRICE
--     where ITEMNAME is displayed in uppercase using CONCAT().

USE RestaurantDB;

SELECT CONCAT(UPPER(ItemName), ' ', 'costs', ' ', '₹', Price) AS Menu_Item_Info FROM MenuItems;