
==========================================================
                MYSQL PRACTICE QUESTIONS
==========================================================

Topics:
-- CREATE DATABASE
-- DROP DATABASE
-- CREATE TABLE
-- PRIMARY KEY
-- NOT NULL
-- UNIQUE
-- CHECK
-- INSERT (Single Row)
-- INSERT (Multiple Rows)
-- UPDATE

----------------------------------------------------------
-- CREATE DATABASE
------------------------------------------------------------

-- 1. Create a database named LibraryDB
CREATE DATABASE LibraryDB;

-- 2. Create a database named SchoolDB
CREATE DATABASE SchoolDB;

-- 3. Create a database named HospitalDB
CREATE DATABASE HospitalDB;

-- 4. Create a database named CollegeDB
CREATE DATABASE CollegeDB;

-- 5. Create a database named BankDB
CREATE DATABASE BankDB;

-- 6. Create a database named RestaurantDB
CREATE DATABASE RestaurantDB;

-- 7. Create a database named MovieDB
CREATE DATABASE MovieDB;

-- 8. Create a database named EmployeeDB
CREATE DATABASE EmployeeDB;

-- 9. Create a database named SportsDB
CREATE DATABASE SportsDB;

-- 10. Create a database named TravelDB
CREATE DATABASE TravelDB;

----------------------------------------------------------
-- DROP DATABASE
----------------------------------------------------------

-- 11. Drop the database MovieDB
DROP DATABASE MovieDB;

-- 12. Drop the database SportsDB
DROP DATABASE SportsDB;

-- 13. Drop the database TravelDB
DROP DATABASE TravelDB;

-- 14. Drop the database RestaurantDB
DROP DATABASE RestaurantDB;

-- 15. Drop the database BankDB
DROP DATABASE BankDB;

----------------------------------------------------------
-- CREATE TABLE
----------------------------------------------------------

-- 16. In LibraryDB, create a table named Books
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(50) UNIQUE,
    Price DECIMAL(10, 2) CHECK (Price > 0)
);

-- 17. In SchoolDB, create a table named Students
USE SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age BETWEEN 5 AND 25)
);

-- 18. In HospitalDB, create a table named Patients
USE HospitalDB;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Age INT CHECK (Age > 0)
);

-- 19. In CollegeDB, create a table named Courses
USE CollegeDB;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseCode VARCHAR(50) UNIQUE,
    Duration INT CHECK (Duration > 0)
);

-- 20. In EmployeeDB, create a table named Employees
USE EmployeeDB;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10, 2) CHECK (Salary >= 10000)
);

-- 21. In BankDB, create a table named Accounts
USE BankDB;

CREATE TABLE Accounts (
    AccountNo INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    AadhaarNo VARCHAR(12) UNIQUE,
    Balance DECIMAL(15, 2) CHECK (Balance >= 0)
);

-- 22. In RestaurantDB, create a table named MenuItems
USE RestaurantDB;

CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0)
);

-- 23. In MovieDB, create a table named Movies
USE MovieDB;

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(255) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 10)
);

-- 24. In SportsDB, create a table named Players
USE SportsDB;

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(100) NOT NULL,
    JerseyNo INT UNIQUE,
    Age INT CHECK (Age > 15)
);

-- 25. In TravelDB, create a table named Passengers
USE TravelDB;

CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    PassengerName VARCHAR(100) NOT NULL,
    PassportNo VARCHAR(20) UNIQUE,
    Age INT CHECK (Age > 0)
);

----------------------------------------------------------
-- INSERT SINGLE ROW
----------------------------------------------------------

-- 26. Insert one student into Students
INSERT INTO
    SchoolDB.Students (
        StudentID,
        StudentName,
        Email,
        Age
    )
VALUES (
        101,
        'Rahul',
        'rahul@gmail.com',
        20
    );

-- 27. Insert one book into Books
INSERT INTO
    LibraryDB.Books (
        BookID,
        Title,
        Author,
        ISBN,
        Price
    )
VALUES (
        1,
        'Python Basics',
        'John Smith',
        'BK1001',
        650
    );

-- 28. Insert one employee into Employees
INSERT INTO
    EmployeeDB.Employees (
        EmployeeID,
        EmployeeName,
        Email,
        Salary
    )
VALUES (
        501,
        'Amit',
        'amit@gmail.com',
        45000
    );

-- 29. Insert one patient into Patients
INSERT INTO
    HospitalDB.Patients (
        PatientID,
        PatientName,
        Phone,
        Age
    )
VALUES (301, 'Neha', '9876543210', 30);

-- 30. Insert one account into Accounts
INSERT INTO
    BankDB.Accounts (
        AccountNo,
        CustomerName,
        AadhaarNo,
        Balance
    )
VALUES (
        10001,
        'Rakesh',
        '123412341234',
        25000
    );

-- 31. Insert one menu item into MenuItems
INSERT INTO
    RestaurantDB.MenuItems (ItemID, ItemName, Price)
VALUES (1, 'Pizza', 350);

-- 32. Insert one movie into Movies
INSERT INTO
    MovieDB.Movies (
        MovieID,
        MovieName,
        Language,
        Rating
    )
VALUES (
        201,
        'Interstellar',
        'English',
        9
    );

-- 33. Insert one player into Players
INSERT INTO
    SportsDB.Players (
        PlayerID,
        PlayerName,
        JerseyNo,
        Age
    )
VALUES (15, 'Virat', 18, 36);

-- 34. Insert one passenger into Passengers
INSERT INTO
    TravelDB.Passengers (
        PassengerID,
        PassengerName,
        PassportNo,
        Age
    )
VALUES (401, 'Priya', 'P1234567', 28);

-- 35. Insert one course into Courses
INSERT INTO
    CollegeDB.Courses (
        CourseID,
        CourseName,
        CourseCode,
        Duration
    )
VALUES (
        10,
        'Data Science',
        'DS101',
        12
    );

----------------------------------------------------------
-- INSERT MULTIPLE ROWS
----------------------------------------------------------

-- 36. Insert three students into Students
INSERT INTO
    SchoolDB.Students (
        StudentID,
        StudentName,
        Email,
        Age
    )
VALUES (
        102,
        'Sneha',
        'sneha@gmail.com',
        19
    ),
    (
        103,
        'Karan',
        'karan@gmail.com',
        21
    ),
    (
        104,
        'Meera',
        'meera@gmail.com',
        18
    );

-- 37. Insert three books into Books
INSERT INTO
    LibraryDB.Books (
        BookID,
        Title,
        Author,
        ISBN,
        Price
    )
VALUES (
        2,
        'Java Programming',
        'James Gosling',
        'BK1002',
        850
    ),
    (
        3,
        'SQL Guide',
        'David Miller',
        'BK1003',
        500
    ),
    (
        4,
        'HTML Basics',
        'Kevin Brown',
        'BK1004',
        300
    );

-- 38. Insert three employees into Employees
INSERT INTO
    EmployeeDB.Employees (
        EmployeeID,
        EmployeeName,
        Email,
        Salary
    )
VALUES (
        502,
        'Raj',
        'raj@gmail.com',
        50000
    ),
    (
        503,
        'Simran',
        'simran@gmail.com',
        60000
    ),
    (
        504,
        'Mohan',
        'mohan@gmail.com',
        42000
    );

-- 39. Insert three patients into Patients
INSERT INTO
    HospitalDB.Patients (
        PatientID,
        PatientName,
        Phone,
        Age
    )
VALUES (
        302,
        'Aarav',
        '9876500001',
        22
    ),
    (303, 'Riya', '9876500002', 27),
    (
        304,
        'Kabir',
        '9876500003',
        31
    );

-- 40. Insert three menu items into MenuItems
INSERT INTO
    RestaurantDB.MenuItems (ItemID, ItemName, Price)
VALUES (2, 'Burger', 180),
    (3, 'Sandwich', 120),
    (4, 'Pasta', 260);

----------------------------------------------------------
-- UPDATE
----------------------------------------------------------

-- 41. Update the salary of EmployeeID 503 to 65000
UPDATE EmployeeDB.Employees
SET
    Salary = 65000
WHERE
    EmployeeID = 503;

-- 42. Update the price of BookID 2 to 900
UPDATE LibraryDB.Books SET Price = 900 WHERE BookID = 2;

-- 43. Update the age of StudentID 101 to 21
UPDATE SchoolDB.Students SET Age = 21 WHERE StudentID = 101;

-- 44. Update the balance of AccountNo 10001 to 50000
UPDATE BankDB.Accounts SET Balance = 50000 WHERE AccountNo = 10001;

-- 45. Update the price of Pizza to 400
UPDATE RestaurantDB.MenuItems
SET
    Price = 400
WHERE
    ItemName = 'Pizza';

-- 46. Update the rating of MovieID 201 to 10
UPDATE MovieDB.Movies SET Rating = 10 WHERE MovieID = 201;

-- 47. Update the phone number of PatientID 301 to 9988776655
UPDATE HospitalDB.Patients
SET
    Phone = '9988776655'
WHERE
    PatientID = 301;

-- 48. Update the passport number of PassengerID 401 to P9876543
UPDATE TravelDB.Passengers
SET
    PassportNo = 'P9876543'
WHERE
    PassengerID = 401;

-- 49. Update the duration of CourseID 10 to 18
UPDATE CollegeDB.Courses SET Duration = 18 WHERE CourseID = 10;

-- 50. Update the email of EmployeeID 504 to mohan123@gmail.com
UPDATE EmployeeDB0.Employees
SET
    Email = 'mohan123@gmail.com'
WHERE
    EmployeeID = 504;

----------------------------------------------------------
-- read data :
----------------------------------------------------------

use LibraryDB;

select * from Books;

use SchoolDB;

select * from Students;

use HospitalDB;

select * from Patients;

use CollegeDB;

select * from Courses;

use EmployeeDB;

select * from Employees;

use BankDB;

select * from Accounts;

use RestaurantDB;

select * from MenuItems;

use MovieDB;

select * from Movies;

use SportsDB;

select * from Players;

use TravelDB;

select * from Passengers;

==========================================================
ADDITIONAL MYSQL PRACTICE QUESTIONS
==========================================================

-- 51. In LibraryDB, create a table named Members.

-- Fields:
-- MemberID - Primary Key
-- MemberName - Not Null
-- Email - Unique
-- Age - Check (Age >= 10)

CREATE TABLE LibraryDB.Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 10) 
);

SELECT * FROM LibraryDB.Members;

----------------------------------------------------------

-- 52. In SchoolDB, create a table named Teachers.

-- Fields:
-- TeacherID - Primary Key
-- TeacherName - Not Null
-- Email - Unique
-- Salary - Check (Salary >= 25000)

CREATE TABLE SchoolDB.Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10, 2) CHECK (Salary >= 25000)
);

SELECT * FROM SchoolDB.Teachers

----------------------------------------------------------

-- 53. In HospitalDB, create a table named Doctors.

-- Fields:
-- DoctorID - Primary Key
-- DoctorName - Not Null
-- Specialization - Not Null
-- Phone - Unique

CREATE TABLE HospitalDB.Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Phone BIGINT UNIQUE NOT NULL
);

SELECT * FROM HospitalDB.Doctors;

----------------------------------------------------------

-- 54. In CollegeDB, create a table named Departments.

-- Fields:
-- DepartmentID - Primary Key
-- DepartmentName - Not Null
-- DepartmentCode - Unique

CREATE TABLE CollegeDB.Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    DepartmentCode VARCHAR(50) UNIQUE NOT NULL
);

SELECT * FROM CollegeDB.Departments;

----------------------------------------------------------

-- 55. In EmployeeDB, create a table named Departments.

-- Fields:
-- DepartmentID - Primary Key
-- DepartmentName - Not Null
-- Location - Not Null

CREATE TABLE EmployeeDB.Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(50) UNIQUE NOT NULL
)

SELECT * FROM EmployeeDB.Departments;

----------------------------------------------------------

-- 56. Insert one member into Members.

-- Data:
-- MemberID = 201
-- MemberName = Ankit
-- Email = ankit@gmail.com
-- Age = 24

CREATE TABLE LibraryDB.Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 10)
);

INSERT INTO LibraryDB.Members (MemberID, MemberName, Email, Age)
VALUES (201, 'Ankit', 'ankit@gmail.com', 24);

SELECT * FROM LibraryDB.Members;

----------------------------------------------------------

-- 57. Insert one teacher into Teachers.

-- Data:
-- TeacherID = 101
-- TeacherName = Pooja
-- Email = pooja@gmail.com
-- Salary = 48000

CREATE TABLE SchoolDB.Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10, 2) CHECK (Salary >= 25000)
);

INSERT INTO SchoolDB.Teachers (TeacherID, TeacherName, Email, Salary)
VALUES (101, 'Pooja', 'pooja@gmail.com', 48000);

SELECT * FROM SchoolDB.Teachers;

----------------------------------------------------------

-- 58. Insert one doctor into Doctors.

-- Data:
-- DoctorID = 11
-- DoctorName = Dr. Kunal
-- Specialization = Cardiologist
-- Phone = 9876540001

CREATE TABLE HospitalDB.Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Phone BIGINT UNIQUE NOT NULL
);

INSERT INTO HospitalDB.Doctors (DoctorID, DoctorName, Specialization, Phone)
VALUES (1, 'Dr. Kunal', 'Cardiologist', 9876540001);

SELECT * FROM HospitalDB.Doctors;

----------------------------------------------------------

-- 59. Insert the following three departments into Departments (CollegeDB).

-- Data:
-- 1, Computer Science, CS
-- 2, Mechanical Engineering, ME
-- 3, Civil Engineering, CE

CREATE TABLE CollegeDB.Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    DepartmentCode VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO CollegeDB.Departments (DepartmentID, DepartmentName, DepartmentCode) 
VALUES (1, 'Computer Science', 'CS'), (2, 'Mechanical Engineering', 'ME'), (3, 'Civil Engineering', 'CE');

SELECT * FROM CollegeDB.Departments;

----------------------------------------------------------

-- 60. Insert the following three members into Members.

-- Data:
-- 202, Riya, riya@gmail.com, 20
-- 203, Harsh, harsh@gmail.com, 22
-- 204, Neel, neel@gmail.com, 21

CREATE TABLE LibraryDB.Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 10)
);

INSERT INTO LibraryDB.Members (MemberID, MemberName, Email, Age)
VALUES (202, 'Riya', 'riya@gmail.com', 20), (203, 'Harsh', 'harsh@gmail.com', 22), (204, 'Neel', 'neel@gmail.com', 21);

SELECT * FROM LibraryDB.Members;

----------------------------------------------------------

-- 61. Update the email of MemberID 201 to ankit123@gmail.com.
UPDATE LibraryDB.Members SET Email = 'ankit123@gmail.com' WHERE MemberID = 20

SELECT * FROM LibraryDB.Members;

----------------------------------------------------------

-- 62. Update the salary of TeacherID 101 to 55000.

UPDATE SchoolDB.Teachers SET Salary = 55000 WHERE TeacherID = 10

SELECT * FROM SchoolDB.Teachers;

----------------------------------------------------------

-- 63. Update the specialization of DoctorID 11 to Neurologist.

UPDATE HospitalDB.Doctors SET Specialization = 'Neurologist' WHERE DoctorID = 11

SELECT * FROM HospitalDB.Doctors;

----------------------------------------------------------

-- 64. Update the location of DepartmentID 2 in EmployeeDB Departments table to Ahmedabad.

UPDATE EmployeeDB.Departments SET Location = 'Ahmedabad' WHERE DepartmentID = 2

SELECT * FROM EmployeeDB.Departments;

----------------------------------------------------------

-- 65. Update the department name of DepartmentID 3 in CollegeDB Departments table to Information Technology.

UPDATE CollegeDB.Departments SET DepartmentName = 'Information Technology' WHERE DepartmentID = 3

SELECT * FROM CollegeDB.Departments;
