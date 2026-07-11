-- LibraryDB
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(50) UNIQUE,
    Price DECIMAL(10, 2) CHECK (Price > 0)
);

-- SchoolDB
USE SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age BETWEEN 5 AND 25)
);

-- HospitalDB
USE HospitalDB;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Age INT CHECK (Age > 0)
);

-- In CollegeDB
USE CollegeDB;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseCode VARCHAR(50) UNIQUE,
    Duration INT CHECK (Duration > 0)
);

-- EmployeeDB
USE EmployeeDB;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10, 2) CHECK (Salary >= 10000)
);

-- BankDB
USE BankDB;

CREATE TABLE Accounts (
    AccountNo INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    AadhaarNo VARCHAR(12) UNIQUE,
    Balance DECIMAL(15, 2) CHECK (Balance >= 0)
);

-- RestaurantDB
USE RestaurantDB;

CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0)
);

-- 23. MovieDB
USE MovieDB;

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(255) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 10)
);

-- SportsDB
USE SportsDB;

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(100) NOT NULL,
    JerseyNo INT UNIQUE,
    Age INT CHECK (Age > 15)
);

-- TravelDB
USE TravelDB;

CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    PassengerName VARCHAR(100) NOT NULL,
    PassportNo VARCHAR(20) UNIQUE,
    Age INT CHECK (Age > 0)
);

-- Databases

USE LibraryDB;
USE SchoolDB;
USE HospitalDB;
USE CollegeDB;
USE EmployeeDB;
USE BankDB;
USE RestaurantDB;
USE MovieDB;
USE SportsDB;
USE TravelDB;