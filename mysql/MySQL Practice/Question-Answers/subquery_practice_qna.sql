-- Active: 1782301937005@@127.0.0.1@3306@subquery_practice

# MySQL Subquery Practice Questions

-- Dataset: `subquery_practice`

-- Database:
USE subquery_practice;

-- Tables:

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

-- Datasets:

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

SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Projects;
SELECT * FROM EmployeeProjects;
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;

-- Questions:

## Level 1 (Easy)

-- 1. Find employees whose salary is greater than the average salary.

SELECT * FROM Employees 
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- 2. Find employees whose salary is less than the average salary.

SELECT * FROM Employees 
WHERE salary < (SELECT AVG(salary) FROM Employees);

-- 3. Find the employee(s) earning the highest salary.

SELECT * FROM Employees 
WHERE salary = (SELECT MAX(salary) FROM Employees);

-- 4. Find the employee(s) earning the lowest salary.

SELECT * FROM Employees 
WHERE salary = (SELECT MIN(salary) FROM Employees);

-- 5. Find employees earning more than Amit.

SELECT * FROM Employees 
WHERE salary > (SELECT salary FROM Employees WHERE employee_name = 'Amit');

-- 6. Find employees earning less than Priya.

SELECT * FROM Employees 
WHERE salary < (SELECT salary FROM Employees WHERE employee_name = 'Priya');

-- 7. Display the department having the highest department_id.

SELECT * FROM Departments 
WHERE department_id = (SELECT MAX(department_id) FROM Departments);

-- 8. Find products whose price is greater than the average product price.

SELECT * FROM Products 
WHERE price > (SELECT AVG(price) FROM Products);

-- 9. Find products cheaper than the average product price.

SELECT * FROM Products 
WHERE price < (SELECT AVG(price) FROM Products);

-- 10. Find the most expensive product.

SELECT * FROM Products 
WHERE price = (SELECT MAX(price) FROM Products);

-- 11. Find the cheapest product.

SELECT * FROM Products 
WHERE price = (SELECT MIN(price) FROM Products);

-- 12. Find customers who placed at least one order.

SELECT * FROM Customers 
WHERE customer_id IN (SELECT DISTINCT customer_id FROM Orders);

-- 13. Find customers who have never placed an order.

SELECT * FROM Customers 
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders);

-- 14. Find products that have been ordered at least once.

SELECT * FROM Products 
WHERE product_id IN (SELECT DISTINCT product_id FROM Orders);

-- 15. Find products that have never been ordered.

SELECT * FROM Products 
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Orders);


## Level 2 (Intermediate)

-- 16. Find employees working in the department "IT" using a subquery.
-- 17. Find employees working in the same department as Amit.
-- 18. Find employees who earn more than every employee in HR.
-- 19. Find employees who earn more than any employee in Sales.
-- 20. Find employees whose salary is equal to the maximum salary in their department.
-- 21. Find departments whose average salary is greater than the overall average salary.
-- 22. Find employees whose salary is above their department's average salary.
-- 23. Find employees whose salary is below their department's average salary.
-- 24. Find customers who ordered a Laptop.
-- 25. Find customers who purchased products costing more than ₹10,000.
-- 26. Find products purchased by customers from Ahmedabad.
-- 27. Find projects with the highest budget.
-- 28. Find employees working on the project with the highest budget.
-- 29. Find projects with budget greater than the average project budget.
-- 30. Find departments that have more than two employees.

## Level 3 (Correlated / EXISTS)

-- 31. Find employees earning the highest salary in each department.
-- 32. Find employees earning the lowest salary in each department.
-- 33. Find departments that have at least one employee earning above ₹80,000.
-- 34. Find departments where every employee earns above ₹50,000.
-- 35. Find customers who ordered more than one product.
-- 36. Find customers whose total ordered quantity is above the average quantity ordered by customers.
-- 37. Find products ordered by more than one customer.
-- 38. Find products that only one customer has purchased.
-- 39. Find employees who are assigned to at least one project.
-- 40. Find employees who are not assigned to any project.
-- 41. Find projects that have no employees assigned.
-- 42. Find customers who bought the most expensive product.
-- 43. Find employees hired before the oldest employee in Sales.
-- 44. Find employees hired after the newest employee in HR.
-- 45. Find products whose price is greater than all products purchased by customer 'Arjun'.
-- 46. Find customers who purchased every product that Arjun purchased.
-- 47. Find departments whose total salary exceeds the average department salary expense.
-- 48. Find employees whose salary is the second highest in the company (using subquery).
-- 49. Find the second most expensive product using a subquery.
-- 50. Find customers who never purchased products priced above the average product price.

---

-- Rules --

-- Use subqueries wherever possible.
-- Avoid JOINs unless absolutely necessary.
-- Try solving each question using different approaches (`IN`, `EXISTS`, correlated subquery, scalar subquery) to strengthen your understanding.