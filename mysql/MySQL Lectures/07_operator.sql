-- Active: 1782301937005@@127.0.0.1@3306@operator_db
CREATE DATABASE operator_db;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Age INT,
    Experience INT,
    Gender CHAR(1),
    City VARCHAR(30),
    Bonus DECIMAL(10,2),
    ManagerID INT
);

INSERT INTO Employees VALUES
(1,'Amit','IT',65000,30,6,'M','Ahmedabad',5000,101),
(2,'Priya','HR',42000,27,3,'F','Surat',3000,102),
(3,'Rahul','IT',85000,35,10,'M','Ahmedabad',7000,101),
(4,'Neha','Sales',50000,29,5,'F','Rajkot',4000,103),
(5,'Karan','Finance',70000,40,12,'M','Vadodara',6000,104),
(6,'Anjali','Sales',48000,26,2,'F','Surat',NULL,103),
(7,'Rohan','Marketing',55000,31,7,'M','Ahmedabad',3500,105),
(8,'Sneha','HR',39000,24,1,'F','Rajkot',NULL,102),
(9,'Vikas','Finance',92000,45,18,'M','Vadodara',9000,104),
(10,'Pooja','Marketing',61000,33,8,'F','Ahmedabad',4500,105),
(11,'Manish','IT',78000,38,14,'M','Surat',8000,101),
(12,'Kajal','Sales',45000,25,2,'F','Rajkot',2500,103),
(13,'Jay','HR',52000,28,4,'M','Ahmedabad',3000,102),
(14,'Meera','Finance',68000,36,11,'F','Vadodara',5000,104),
(15,'Arjun','Marketing',73000,34,9,'M','Surat',6500,105);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    Department VARCHAR(30),
    Budget DECIMAL(12,2),
    DurationMonths INT,
    Status VARCHAR(20)
);

INSERT INTO Projects VALUES
(101,'Payroll System','HR',300000,6,'Completed'),
(102,'ERP Software','IT',1200000,12,'Running'),
(103,'Sales Portal','Sales',600000,8,'Running'),
(104,'Finance Tracker','Finance',800000,10,'Completed'),
(105,'Marketing App','Marketing',500000,7,'Planning'),
(106,'CRM System','Sales',900000,9,'Running'),
(107,'Website Redesign','Marketing',450000,5,'Completed'),
(108,'Cloud Migration','IT',1500000,15,'Running');


SELECT * FROM employees;
SELECT * FROM projects;


-- 2. Comparison (Relational) Operators

SELECT * FROM employees WHERE salary >= 70000;

SELECT `EmployeeID`, `EmployeeName`, `Department`,`Salary` FROM employees WHERE salary <= 70000;


-- 3. Logical Operators

SELECT * FROM employees WHERE salary >= 60000 AND salary <= 70000;

SELECT COUNT(*) as Count FROM employees WHERE salary >= 60000 AND salary <= 70000;

SELECT `EmployeeName`, salary, salary + 10000 as bonus FROM employees;

SELECT * FROM employees WHERE `Department` <> "IT" AND `Department` <> "HR"; -- Here <> means not equal to

SELECT * FROM employees WHERE `Department` = "IT" OR Department='HR';

SELECT * FROM employees WHERE NOT(`Department` = "IT" OR Department='HR')

SELECT * FROM employees WHERE Age < 30 XOR Salary > 70000; -- Here exactly one condition must be TRUE


-- 6. BETWEEN Operator

SELECT * FROM employees WHERE salary BETWEEN 60000 AND 70000;


-- 7. IN Operator

SELECT * FROM employees WHERE `Department` IN("IT", "Sales");


-- 8. NOT IN Operator

SELECT * FROM employees WHERE `Department` NOT IN("IT", "Sales");


-- 9. LIKE Operator

SELECT * FROM employees WHERE `EmployeeName` LIKE "A%" -- Here "%" means all characters followed by given character

SELECT * FROM employees WHERE `EmployeeName` LIKE "A____%" -- Here count "-" to add characters followed by given character


-- 10. IS NULL

SELECT * FROM employees WHERE `Salary` IS NULL;


-- 11. IS NOT NULL

SELECT * FROM employees WHERE `Salary` IS NOT NULL;

SELECT DISTINCT `Department` FROM employees;

SELECT DISTINCT `City` FROM employees;

