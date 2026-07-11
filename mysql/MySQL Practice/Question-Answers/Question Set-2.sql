==========================================================
-- MYSQL PRACTICE QUESTIONS - ALTER TABLE
==========================================================


-- 1. In LibraryDB, alter the Books table to add a new column named Publisher of type VARCHAR(100).

CREATE DATABASE LibraryDB;

USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(50) UNIQUE,
    Price DECIMAL(10, 2) CHECK (Price > 0)
)

ALTER TABLE Books 
ADD Publisher VARCHAR(100);

SELECT * FROM Books;

----------------------------------------------------------

-- 2. In SchoolDB, alter the Students table to add a new column named Gender of type VARCHAR(10).

CREATE DATABASE SchoolDB

USE SchoolDB

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age BETWEEN 5 AND 25)
)

ALTER TABLE Students
ADD Gender VARCHAR(10);

SELECT * FROM Students;

----------------------------------------------------------

-- 3. In HospitalDB, alter the Patients table to add a new column named BloodGroup of type VARCHAR(5).

CREATE DATABASE HospitalDB

USE HospitalDB

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Age INT CHECK (Age > 0)
)

ALTER TABLE Patients
ADD BloodGroup VARCHAR(5);

SELECT * FROM Patients;

----------------------------------------------------------

-- 4. In CollegeDB, alter the Courses table to add a new column named Fees of type DECIMAL(10,2).

CREATE DATABASE CollegeDB

USE CollegeDB

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseCode VARCHAR(50) UNIQUE,
    Duration INT CHECK (Duration > 0)
)

ALTER TABLE Courses
ADD Fees DECIMAL(10, 2);

SELECT * FROM Courses;

----------------------------------------------------------

-- 5. In EmployeeDB, alter the Employees table to add a new column named Department of type VARCHAR(50).

CREATE DATABASE EmployeeDB

USE EmployeeDB

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10, 2) CHECK (Salary >= 10000)
)

ALTER TABLE Employees
ADD Department VARCHAR(50);

SELECT * FROM Employees;

----------------------------------------------------------

-- 6. In BankDB, alter the Accounts table to modify the CustomerName column to VARCHAR(150).

CREATE DATABASE BankDB

USE BankDB

CREATE TABLE Accounts (
    AccountNo INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    AadhaarNo VARCHAR(12) UNIQUE,
    Balance DECIMAL(15, 2) CHECK (Balance >= 0)
)

ALTER TABLE Accounts
MODIFY CustomerName VARCHAR(150);

SELECT * FROM Accounts;

----------------------------------------------------------

-- 7. In RestaurantDB, alter the MenuItems table to modify the ItemName column to VARCHAR(120).

CREATE DATABASE RestaurantDB

USE RestaurantDB

CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0)
)

ALTER TABLE MenuItems
MODIFY ItemName VARCHAR(120);

SELECT * FROM MenuItems;

----------------------------------------------------------

-- 8. In MovieDB, alter the Movies table to modify the Rating column to DECIMAL(3,1).

CREATE DATABASE MovieDB

USE MovieDB

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(255) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 10)
)

ALTER TABLE Movies
MODIFY Rating DECIMAL(3, 1);

SELECT * FROM Movies;

----------------------------------------------------------

-- 9. In SportsDB, alter the Players table to rename the column JerseyNo to JerseyNumber.

CREATE DATABASE SportsDB

USE SportsDB

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(100) NOT NULL,
    JerseyNo INT UNIQUE,
    Age INT CHECK (Age > 15)
)

ALTER TABLE Players
RENAME COLUMN JerseyNo TO JerseyNumber;

SELECT * FROM Players;

----------------------------------------------------------

-- 10. In TravelDB, alter the Passengers table to rename the column PassengerName to FullName.

CREATE DATABASE TravelDB

USE TravelDB

CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    PassengerName VARCHAR(100) NOT NULL,
    PassportNo VARCHAR(20) UNIQUE,
    Age INT CHECK (Age > 0)
)

ALTER TABLE Passengers
RENAME COLUMN PassengerName TO FullName;

SELECT * FROM Passengers;

----------------------------------------------------------

-- 11. In LibraryDB, alter the Books table to drop the Publisher column.

CREATE DATABASE LibraryDB

USE LibraryDB

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(50) UNIQUE,
    Price DECIMAL(10, 2) CHECK (Price > 0)
)

ALTER TABLE Books
DROP COLUMN Publisher;

SELECT * FROM Books;

----------------------------------------------------------

-- 12. In SchoolDB, alter the Students table to drop the Gender column.

USE SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age BETWEEN 5 AND 25),
    Gender ENUM ("Male", "Female", "Other")
)

DROP TABLE students; -- TABLE DROPPED BECAUSE NEW COLUMN HAS TO BE ADDED 

ALTER TABLE Students
DROP COLUMN Gender;

SELECT * FROM Students;

----------------------------------------------------------

-- 13. In EmployeeDB, alter the Employees table to rename the table Employees to StaffMembers.

 USE EmployeeDB;

 CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10, 2) CHECK (Salary >= 10000)
)

RENAME TABLE Employees TO StaffMembers;

SELECT * FROM StaffMembers;

SHOW TABLES FROM EmployeeDB;

----------------------------------------------------------

-- 14. In RestaurantDB, alter the MenuItems table to rename the table MenuItems to FoodItems.

USE RestaurantDB;

CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0)
)

RENAME TABLE MenuItems TO FoodItems;

SELECT * FROM FoodItems;

SHOW TABLES FROM RestaurantDB;

----------------------------------------------------------

-- 15. In CollegeDB, alter the Courses table to add a CHECK constraint that ensures Fees is greater than 0.

USE CollegeDB

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseCode VARCHAR(50) UNIQUE,
    Duration INT CHECK (Duration > 0),
    Fees DECIMAL(10, 2) CHECK (Fees > 0)
)

DROP TABLE Courses; -- TABLE DROPPED BECAUSE NEW COLUMN HAS TO BE ADDED 

ALTER TABLE Courses
ADD CONSTRAINT check_fees CHECK (Fees > 0);

SELECT * FROM courses;

SHOW TABLES FROM schooldb;