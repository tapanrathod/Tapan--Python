-- Active: 1782301937005@@127.0.0.1@3306@subquery_practice

# MySQL Subquery Practice Questions

-- Dataset: `subquery_practice`

-- Database:

USE subquery_practice;

-- Tables:

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments (department_id)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    budget DECIMAL(12, 2)
);

CREATE TABLE EmployeeProjects (
    employee_id INT,
    project_id INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES Employees (employee_id),
    FOREIGN KEY (project_id) REFERENCES Projects (project_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers (customer_id),
    FOREIGN KEY (product_id) REFERENCES Products (product_id)
);

INSERT INTO
    Departments
VALUES (1, 'HR'),
    (2, 'Sales'),
    (3, 'IT'),
    (4, 'Finance'),
    (5, 'Marketing');

-- Datasets:

INSERT INTO
    Employees
VALUES (
        101,
        'Amit',
        1,
        45000,
        '2022-01-10'
    ),
    (
        102,
        'Priya',
        1,
        52000,
        '2021-08-15'
    ),
    (
        103,
        'Rahul',
        2,
        60000,
        '2020-04-12'
    ),
    (
        104,
        'Neha',
        2,
        75000,
        '2019-07-21'
    ),
    (
        105,
        'Karan',
        3,
        85000,
        '2018-03-19'
    ),
    (
        106,
        'Sneha',
        3,
        92000,
        '2017-05-11'
    ),
    (
        107,
        'Vikas',
        4,
        70000,
        '2020-11-01'
    ),
    (
        108,
        'Anjali',
        4,
        68000,
        '2021-01-13'
    ),
    (
        109,
        'Rohit',
        5,
        55000,
        '2022-06-09'
    ),
    (
        110,
        'Pooja',
        5,
        48000,
        '2023-02-01'
    ),
    (
        111,
        'Jay',
        3,
        65000,
        '2022-09-09'
    ),
    (
        112,
        'Nisha',
        2,
        58000,
        '2021-12-01'
    );

INSERT INTO
    Projects
VALUES (1, 'CRM', 500000),
    (2, 'Website', 350000),
    (3, 'Payroll', 250000),
    (4, 'Mobile App', 650000),
    (5, 'Analytics', 800000);

INSERT INTO
    EmployeeProjects
VALUES (101, 3),
    (102, 3),
    (103, 1),
    (104, 1),
    (105, 2),
    (106, 5),
    (107, 5),
    (108, 3),
    (109, 4),
    (110, 4),
    (111, 2),
    (112, 1);

INSERT INTO
    Customers
VALUES (1, 'Arjun', 'Ahmedabad'),
    (2, 'Riya', 'Surat'),
    (3, 'Manav', 'Rajkot'),
    (4, 'Diya', 'Vadodara'),
    (5, 'Mehul', 'Ahmedabad'),
    (6, 'Kriti', 'Mumbai'),
    (7, 'Yash', 'Pune'),
    (8, 'Isha', 'Delhi');

INSERT INTO
    Products
VALUES (1, 'Laptop', 65000),
    (2, 'Keyboard', 1500),
    (3, 'Mouse', 800),
    (4, 'Monitor', 12000),
    (5, 'Printer', 18000),
    (6, 'Headphones', 2500),
    (7, 'SSD', 6000),
    (8, 'Webcam', 3500);

INSERT INTO
    Orders
VALUES (1, 1, 1, 1, '2024-01-10'),
    (2, 1, 2, 2, '2024-01-10'),
    (3, 2, 4, 1, '2024-01-15'),
    (4, 2, 3, 3, '2024-01-15'),
    (5, 3, 7, 2, '2024-02-01'),
    (6, 4, 5, 1, '2024-02-05'),
    (7, 5, 6, 2, '2024-02-10'),
    (8, 5, 2, 1, '2024-02-10'),
    (9, 6, 8, 1, '2024-02-18'),
    (10, 7, 1, 1, '2024-03-01'),
    (11, 7, 7, 1, '2024-03-01'),
    (12, 8, 4, 2, '2024-03-05'),
    (13, 3, 6, 1, '2024-03-09');

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

SELECT *
FROM Employees
WHERE
    salary > (
        SELECT AVG(salary)
        FROM Employees
    );

-- 2. Find employees whose salary is less than the average salary.

SELECT *
FROM Employees
WHERE
    salary < (
        SELECT AVG(salary)
        FROM Employees
    );

-- 3. Find the employee(s) earning the highest salary.

SELECT *
FROM Employees
WHERE
    salary = (
        SELECT MAX(salary)
        FROM Employees
    );

-- 4. Find the employee(s) earning the lowest salary.

SELECT *
FROM Employees
WHERE
    salary = (
        SELECT MIN(salary)
        FROM Employees
    );

-- 5. Find employees earning more than Amit.

SELECT *
FROM Employees
WHERE
    salary > (
        SELECT salary
        FROM Employees
        WHERE
            employee_name = 'Amit'
    );

-- 6. Find employees earning less than Priya.

SELECT *
FROM Employees
WHERE
    salary < (
        SELECT salary
        FROM Employees
        WHERE
            employee_name = 'Priya'
    );

-- 7. Display the department having the highest department_id.

SELECT *
FROM Departments
WHERE
    department_id = (
        SELECT MAX(department_id)
        FROM Departments
    );

-- 8. Find products whose price is greater than the average product price.

SELECT *
FROM Products
WHERE
    price > (
        SELECT AVG(price)
        FROM Products
    );

-- 9. Find products cheaper than the average product price.

SELECT *
FROM Products
WHERE
    price < (
        SELECT AVG(price)
        FROM Products
    );

-- 10. Find the most expensive product.

SELECT *
FROM Products
WHERE
    price = (
        SELECT MAX(price)
        FROM Products
    );

-- 11. Find the cheapest product.

SELECT *
FROM Products
WHERE
    price = (
        SELECT MIN(price)
        FROM Products
    );

-- 12. Find customers who placed at least one order.

SELECT *
FROM Customers
WHERE
    customer_id IN (
        SELECT DISTINCT
            customer_id
        FROM Orders
    );

-- 13. Find customers who have never placed an order.

SELECT *
FROM Customers
WHERE
    customer_id NOT IN(
        SELECT DISTINCT
            customer_id
        FROM Orders
    );

-- 14. Find products that have been ordered at least once.

SELECT *
FROM Products
WHERE
    product_id IN (
        SELECT DISTINCT
            product_id
        FROM Orders
    );

-- 15. Find products that have never been ordered.

SELECT *
FROM Products
WHERE
    product_id NOT IN(
        SELECT DISTINCT
            product_id
        FROM Orders
    );

## Level 2 (Intermediate)

-- 16. Find employees working in the department "IT" using a subquery.

SELECT *
FROM Employees
WHERE
    department_id = (
        SELECT department_id
        FROM Departments
        WHERE
            department_name = 'IT'
    );

-- 17. Find employees working in the same department as Amit.

SELECT *
FROM Employees
WHERE
    department_id = (
        SELECT department_id
        FROM Employees
        WHERE
            employee_name = 'Amit'
    )
    AND employee_name <> 'Amit';

-- 18. Find employees who earn more than every employee in HR.

SELECT *
FROM Employees
WHERE
    salary > ALL (
        SELECT salary
        FROM Employees
        WHERE
            department_id = (
                SELECT department_id
                FROM Departments
                WHERE
                    department_name = 'HR'
            )
    );

-- 19. Find employees who earn more than any employee in Sales.

SELECT *
FROM Employees
WHERE
    salary > ANY (
        SELECT salary
        FROM Employees
        WHERE
            department_id = (
                SELECT department_id
                FROM Departments
                WHERE
                    department_name = 'Sales'
            )
    );

-- 20. Find employees whose salary is equal to the maximum salary in their department.

SELECT *
FROM Employees e
WHERE
    salary = (
        SELECT MAX(salary)
        FROM Employees
        WHERE
            department_id = e.department_id
    );

-- 21. Find departments whose average salary is greater than the overall average salary. -- AI

SELECT *
FROM Departments
WHERE
    department_id IN (
        SELECT department_id
        FROM Employees
        GROUP BY
            department_id
        HAVING
            AVG(salary) > (
                SELECT AVG(salary)
                FROM Employees
            )
    );

-- 22. Find employees whose salary is above their department's average salary.

SELECT *
FROM employees e
WHERE
    salary > (
        SELECT AVG(salary)
        FROM employees
        WHERE
            department_id = e.department_id
    );

-- 23. Find employees whose salary is below their department's average salary.

SELECT *
FROM employees e
WHERE
    salary > (
        SELECT AVG(salary)
        FROM employees
        WHERE
            department_id = e.department_id
    );

-- 24. Find customers who ordered a Laptop.

SELECT *
FROM Customers c
WHERE
    customer_id IN (
        SELECT customer_id
        FROM Orders o
        WHERE
            product_id = (
                SELECT product_id
                FROM Products
                WHERE
                    product_name = 'Laptop'
            )
    );

-- 25. Find customers who purchased products costing more than ₹10,000.

SELECT *
FROM Customers c
WHERE
    customer_id IN (
        SELECT customer_id
        FROM Orders o
        WHERE
            product_id IN (
                SELECT product_id
                FROM Products
                WHERE
                    price > 10000
            )
    );

-- 26. Find products purchased by customers from Ahmedabad.

SELECT *
FROM Products p
WHERE
    product_id IN (
        SELECT product_id
        FROM Orders o
        WHERE
            customer_id IN (
                SELECT customer_id
                FROM Customers
                WHERE
                    city = 'Ahmedabad'
            )
    );

-- 27. Find projects with the highest budget.

SELECT *
FROM Projects
WHERE
    budget = (
        SELECT MAX(budget)
        FROM Projects
    );

-- 28. Find employees working on the project with the highest budget. -- AI

SELECT *
FROM Employees
WHERE
    employee_id IN (
        SELECT employee_id
        FROM EmployeeProjects
        WHERE
            project_id = (
                SELECT project_id
                FROM Projects
                WHERE
                    budget = (
                        SELECT MAX(budget)
                        FROM Projects
                    )
            )
    );

-- 29. Find projects with budget greater than the average project budget.

SELECT *
FROM Projects
WHERE
    budget > (
        SELECT AVG(budget)
        FROM Projects
    );

-- 30. Find departments that have more than two employees. -- AI

SELECT *
FROM Departments
WHERE
    department_id IN (
        SELECT department_id
        FROM Employees
        GROUP BY
            department_id
        HAVING
            COUNT(*) > 2
    );

## Level 3 (Correlated / EXISTS)

-- 31. Find employees earning the highest salary in each department.

SELECT *
FROM Employees e
WHERE
    salary = (
        SELECT MAX(salary)
        FROM Employees
        WHERE
            department_id = e.department_id
    );

-- 32. Find employees earning the lowest salary in each department.

SELECT *
FROM Employees e
WHERE
    salary = (
        SELECT MIN(salary)
        FROM Employees
        WHERE
            department_id = e.department_id
    );

-- 33. Find departments that have at least one employee earning above ₹80,000. -- AI

SELECT *
FROM Departments d
WHERE
    EXISTS (
        SELECT 1
        FROM Employees e
        WHERE
            e.department_id = d.department_id
            AND e.salary > 80000
    );

-- 34. Find departments where every employee earns above ₹50,000. -- AI

SELECT *
FROM Departments d
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Employees e
        WHERE
            e.department_id = d.department_id
            AND e.salary <= 50000
    )
    AND EXISTS (
        SELECT 1
        FROM Employees e
        WHERE
            e.department_id = d.department_id
    );

-- 35. Find customers who ordered more than one product.

SELECT *
FROM Customers c
WHERE
    customer_id IN (
        SELECT customer_id
        FROM Orders
        GROUP BY
            customer_id
        HAVING
            COUNT(*) > 1
    );

-- 36. Find customers whose total ordered quantity is above the average quantity ordered by customers. -- AI

SELECT *
FROM Customers c
WHERE
    customer_id IN (
        SELECT customer_id
        FROM Orders
        GROUP BY
            customer_id
        HAVING
            SUM(quantity) > (
                SELECT AVG(total_quantity)
                FROM (
                        SELECT SUM(quantity) AS total_quantity
                        FROM Orders
                        GROUP BY
                            customer_id
                    ) AS subquery
            )
    );

-- 37. Find products ordered by more than one customer.

SELECT *
FROM Products p
WHERE
    product_id IN (
        SELECT product_id
        FROM Orders
        GROUP BY
            product_id
        HAVING
            COUNT(DISTINCT customer_id) > 1
    );

-- 38. Find products that only one customer has purchased.

SELECT *
FROM Products
WHERE
    product_id IN (
        SELECT product_id
        FROM Orders
        GROUP BY
            product_id
        HAVING
            COUNT(DISTINCT customer_id) = 1
    );

-- 39. Find employees who are assigned to at least one project.

SELECT *
FROM Employees e
WHERE
    EXISTS (
        SELECT 1
        FROM EmployeeProjects ep
        WHERE
            ep.employee_id = e.employee_id
    );

-- 40. Find employees who are not assigned to any project.

SELECT *
FROM Employees e
WHERE
    NOT EXISTS (
        SELECT 1
        FROM EmployeeProjects ep
        WHERE
            ep.employee_id = e.employee_id
    );

-- 41. Find projects that have no employees assigned.

SELECT *
FROM Projects p
WHERE
    NOT EXISTS (
        SELECT 1
        FROM EmployeeProjects ep
        WHERE
            ep.project_id = p.project_id
    );

-- 42. Find customers who bought the most expensive product.

SELECT *
FROM Customers
WHERE
    customer_id IN (
        SELECT customer_id
        FROM Orders
        WHERE
            product_id = (
                SELECT product_id
                FROM Products
                WHERE
                    price = (
                        SELECT MAX(price)
                        FROM Products
                    )
            )
    );

-- 43. Find employees hired before the oldest employee in Sales.

SELECT *
FROM Employees
WHERE
    hire_date < (
        SELECT MIN(hire_date)
        FROM Employees
        WHERE
            department_id = (
                SELECT department_id
                FROM Departments
                WHERE
                    department_name = 'Sales'
            )
    );

-- 44. Find employees hired after the newest employee in HR.

SELECT *
FROM Employees
WHERE
    hire_date > (
        SELECT MAX(hire_date)
        FROM Employees
        WHERE
            department_id = (
                SELECT department_id
                FROM Departments
                WHERE
                    department_name = 'HR'
            )
    );

-- 45. Find products whose price is greater than all products purchased by customer 'Arjun'.

SELECT *
FROM Products
WHERE
    price > ALL (
        SELECT price
        FROM Products
        WHERE
            product_id IN (
                SELECT product_id
                FROM Orders
                WHERE
                    customer_id = (
                        SELECT customer_id
                        FROM Customers
                        WHERE
                            customer_name = 'Arjun'
                    )
            )
    );

-- 46. Find customers who purchased every product that Arjun purchased.

SELECT *
FROM Customers c
WHERE
    customer_name <> 'Arjun'
    AND NOT EXISTS (
        SELECT product_id
        FROM Orders
        WHERE
            customer_id = (
                SELECT customer_id
                FROM Customers
                WHERE
                    customer_name = 'Arjun'
            )
            AND product_id NOT IN(
                SELECT product_id
                FROM Orders
                WHERE
                    customer_id = c.customer_id
            )
    );

-- 47. Find departments whose total salary exceeds the average department salary expense.

SELECT *
FROM Departments d
WHERE
    EXISTS (
        SELECT 1
        FROM Employees e
        WHERE
            e.department_id = d.department_id
        GROUP BY
            e.department_id
        HAVING
            SUM(e.salary) > (
                SELECT AVG(total_salary)
                FROM (
                        SELECT SUM(salary) AS total_salary
                        FROM Employees
                        GROUP BY
                            department_id
                    ) AS subquery
            )
    );

-- 48. Find employees whose salary is the second highest in the company (using subquery).

SELECT *
FROM Employees e
WHERE
    salary = (
        SELECT MAX(salary)
        FROM Employees
        WHERE
            salary < (
                SELECT MAX(salary)
                FROM Employees
            )
    );

-- 49. Find the second most expensive product using a subquery.

SELECT *
FROM Products
WHERE
    price = (
        SELECT MAX(price)
        FROM Products
        WHERE
            price < (
                SELECT MAX(price)
                FROM Products
            )
    );

-- 50. Find customers who never purchased products priced above the average product price.

SELECT *
FROM Customers c
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Orders o
        WHERE
            o.customer_id = c.customer_id
            AND EXISTS (
                SELECT 1
                FROM Products p
                WHERE
                    p.product_id = o.product_id
                    AND p.price > (
                        SELECT AVG(price)
                        FROM Products
                    )
            )
    );

---

-- Rules --

-- Use subqueries wherever possible.
-- Avoid JOINs unless absolutely necessary.
-- Try solving each question using different approaches (`IN`, `EXISTS`, correlated subquery, scalar subquery) to strengthen your understanding.