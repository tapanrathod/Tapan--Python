-- Active: 1782301937005@@127.0.0.1@3306@operator_db
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Age INT,
    Experience INT,
    Gender CHAR(1)
);

INSERT INTO Employees VALUES
(1,'Amit','IT',65000,30,6,'M'),
(2,'Priya','HR',42000,27,3,'F'),
(3,'Rahul','IT',85000,35,10,'M'),
(4,'Neha','Sales',50000,29,5,'F'),
(5,'Karan','Finance',70000,40,12,'M'),
(6,'Anjali','Sales',48000,26,2,'F'),
(7,'Rohan','Marketing',55000,31,7,'M'),
(8,'Sneha','HR',39000,24,1,'F'),
(9,'Vikas','Finance',92000,45,18,'M'),
(10,'Pooja','Marketing',61000,33,8,'F'),
(11,'Manish','IT',78000,38,14,'M'),
(12,'Kajal','Sales',45000,25,2,'F'),
(13,'Jay','HR',52000,28,4,'M'),
(14,'Meera','Finance',68000,36,11,'F'),
(15,'Arjun','Marketing',73000,34,9,'M'),
(16,'Nitin','IT',56000,29,4,'M'),
(17,'Riya','HR',47000,26,2,'F'),
(18,'Sanjay','Sales',53000,32,6,'M'),
(19,'Komal','Finance',75000,37,13,'F'),
(20,'Deep','Marketing',64000,30,5,'M');

SELECT COUNT(*) FROM employees WHERE Department = "Marketing";

SELECT COUNT(*) FROM employees WHERE Gender= "F";

SELECT * FROM employees;

SELECT DISTINCT city from employees;

SELECT COUNT(DISTINCT city) from employees;

SELECT COUNT(DISTINCT department) from employees;

SELECT COUNT(*) as CountAhm FROM employees WHERE `City` = "Ahmedabad";

SELECT MIN(salary) FROM employees;

SELECT MAX(salary) FROM employees;

SELECT AVG(salary) FROM employees;

SELECT SUM(salary) FROM employees;

SELECT * FROM employees WHERE `Salary` >= 70000;

SELECT COUNT(*) FROM employees WHERE `Salary` >= 70000;

