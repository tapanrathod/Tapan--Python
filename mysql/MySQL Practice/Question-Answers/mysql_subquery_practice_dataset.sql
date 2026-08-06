
CREATE DATABASE IF NOT EXISTS subquery_practice;
USE subquery_practice;

DROP TABLE IF EXISTS EmployeeProjects;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments(
 department_id INT PRIMARY KEY,
 department_name VARCHAR(50)
);

CREATE TABLE Employees(
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(50),
 department_id INT,
 salary DECIMAL(10,2),
 hire_date DATE,
 FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Projects(
 project_id INT PRIMARY KEY,
 project_name VARCHAR(50),
 budget DECIMAL(12,2)
);

CREATE TABLE EmployeeProjects(
 employee_id INT,
 project_id INT,
 PRIMARY KEY(employee_id,project_id),
 FOREIGN KEY(employee_id) REFERENCES Employees(employee_id),
 FOREIGN KEY(project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Customers(
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 city VARCHAR(50)
);

CREATE TABLE Products(
 product_id INT PRIMARY KEY,
 product_name VARCHAR(50),
 price DECIMAL(10,2)
);

CREATE TABLE Orders(
 order_id INT PRIMARY KEY,
 customer_id INT,
 product_id INT,
 quantity INT,
 order_date DATE,
 FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
 FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

INSERT INTO Departments VALUES
(1,'HR'),
(2,'Sales'),
(3,'IT'),
(4,'Finance'),
(5,'Marketing');

INSERT INTO Employees VALUES
(101,'Amit',1,45000,'2022-01-10'),
(102,'Priya',1,52000,'2021-08-15'),
(103,'Rahul',2,60000,'2020-04-12'),
(104,'Neha',2,75000,'2019-07-21'),
(105,'Karan',3,85000,'2018-03-19'),
(106,'Sneha',3,92000,'2017-05-11'),
(107,'Vikas',4,70000,'2020-11-01'),
(108,'Anjali',4,68000,'2021-01-13'),
(109,'Rohit',5,55000,'2022-06-09'),
(110,'Pooja',5,48000,'2023-02-01'),
(111,'Jay',3,65000,'2022-09-09'),
(112,'Nisha',2,58000,'2021-12-01');

INSERT INTO Projects VALUES
(1,'CRM',500000),
(2,'Website',350000),
(3,'Payroll',250000),
(4,'Mobile App',650000),
(5,'Analytics',800000);

INSERT INTO EmployeeProjects VALUES
(101,3),(102,3),(103,1),(104,1),
(105,2),(106,5),(107,5),(108,3),
(109,4),(110,4),(111,2),(112,1);

INSERT INTO Customers VALUES
(1,'Arjun','Ahmedabad'),
(2,'Riya','Surat'),
(3,'Manav','Rajkot'),
(4,'Diya','Vadodara'),
(5,'Mehul','Ahmedabad'),
(6,'Kriti','Mumbai'),
(7,'Yash','Pune'),
(8,'Isha','Delhi');

INSERT INTO Products VALUES
(1,'Laptop',65000),
(2,'Keyboard',1500),
(3,'Mouse',800),
(4,'Monitor',12000),
(5,'Printer',18000),
(6,'Headphones',2500),
(7,'SSD',6000),
(8,'Webcam',3500);

INSERT INTO Orders VALUES
(1,1,1,1,'2024-01-10'),
(2,1,2,2,'2024-01-10'),
(3,2,4,1,'2024-01-15'),
(4,2,3,3,'2024-01-15'),
(5,3,7,2,'2024-02-01'),
(6,4,5,1,'2024-02-05'),
(7,5,6,2,'2024-02-10'),
(8,5,2,1,'2024-02-10'),
(9,6,8,1,'2024-02-18'),
(10,7,1,1,'2024-03-01'),
(11,7,7,1,'2024-03-01'),
(12,8,4,2,'2024-03-05'),
(13,3,6,1,'2024-03-09');

-- Total rows:
-- Departments:5
-- Employees:12
-- Projects:5
-- EmployeeProjects:12
-- Customers:8
-- Products:8
-- Orders:13
-- Grand Total = 63 rows
