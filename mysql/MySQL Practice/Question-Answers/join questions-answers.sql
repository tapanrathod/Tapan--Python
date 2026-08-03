
USE joins_db;

-- # SQL JOIN Practice Questions

-- Tables : Customers and Orders

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10, 2),
    order_date DATE
    -- FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

SELECT * FROM customers as c;
SELECT * FROM orders as o;

-- Tables : Locations, Departments and Employees

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations (location_id)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT NULL,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

SELECT * FROM locations as l;
SELECT * FROM departments as d;
SELECT * FROM employees as e;


-- ## Part 1: INNER JOIN (Basic)

-- 1. Display all orders along with the customer's name.

SELECT o.product_name, c.customer_name
FROM customers as c
JOIN orders as o ON o.customer_id = c.customer_id
-- INNER JOIN customers as c ON o.customer_id = c.customer_id;

-- 2. Display customer name, city, product name, category, and amount.
SELECT c.customer_name, c.city, o.product_name, o.category, o.amount
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id;

-- 3. Show only the customer name and order date.
SELECT c.customer_name, o.order_date
FROM customers as c 
    INNER JOIN orders as o ON o.customer_id = c.customer_id;

-- 4. Display all Mobile category orders with customer names.
SELECT c.customer_name, o.product_name, o.category
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    o.category = 'Mobile';

-- 5. Display orders worth more than ₹30,000 along with customer details.

SELECT c.customer_name, o.amount
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    o.amount >= 30000;

-- 6. Show all customers from Ahmedabad who placed orders.

SELECT c.customer_name, c.city
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    c.city = 'Ahmedabad';

-- 7. Display all products ordered by "Aarav Patel".

SELECT c.customer_name, o.product_name
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    c.customer_name = 'Aarav Patel';

-- 8. Display all customers who purchased products from the "Laptop" category.

SELECT c.customer_name, o.category
FROM orders as o
    INNER JOIN customers as c ON o.customer_id = c.customer_id
WHERE
    o.category = 'Laptop';

-- 9. Display customer email along with their purchased product.

SELECT c.customer_name, c.email, o.product_name
FROM orders as o
    INNER JOIN customers as c ON o.customer_id = c.customer_id;

-- 10. Show order ID, customer name, and order amount sorted by highest amount.

SELECT o.order_id, c.customer_name, o.amount
FROM orders as o
    INNER JOIN customers as c ON o.customer_id = c.customer_id
ORDER BY o.amount DESC;


-- ## Part 2: INNER JOIN + Filtering

-- 11. Display all customers whose order amount is between ₹10,000 and ₹70,000.

SELECT c.customer_name, o.amount
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    o.amount BETWEEN 10000 AND 70000;

-- 12. Find customers whose names start with "A" and have placed orders.

SELECT c.customer_name, o.product_name
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    c.customer_name LIKE 'A%';

-- 13. Show all orders placed after `2025-01-15`.

SELECT o.order_id, o.order_date
FROM orders as o
WHERE
    o.order_date > '2025-01-15';

-- 14. Display all products whose category is either Mobile or Electronics.

SELECT o.product_name, o.category
FROM orders as o
WHERE
    o.category IN ('Mobile', 'Electronics');

-- 15. Find all customers living in Mumbai or Delhi who placed orders. -- error

SELECT c.customer_name, c.city, o.product
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    c.city IN ('Mumbai', 'Delhi');

-- 16. Display all orders except Mobile category.

SELECT o.order_id, o.product_name
FROM orders as o
WHERE
    o.category != 'Mobile';

-- 17. Find customers who bought products costing less than ₹5,000.

SELECT DISTINCT c.customer_name, o.amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount < 5000;

-- 18. Display customer name and product name ordered in January 2025.

SELECT c.customer_name, o.product_name, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '2025-01-01' AND '2025-01-31';

-- 19. Display orders sorted first by category and then by amount descending.

SELECT o.order_id, o.product_name, o.category, o.amount
FROM orders as o
ORDER BY o.category, o.amount DESC;

-- 20. Show customers who purchased products beginning with the letter "S".

SELECT c.customer_name, o.product_name
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    o.product_name LIKE 'S%';


-- ## Part 3: LEFT JOIN

-- 21. Display all customers whether they placed orders or not.

SELECT c.customer_name, o.product_name
FROM customers as c
    LEFT JOIN orders as o ON o.customer_id = c.customer_id;

-- 22. Display customer names with NULL if they never ordered.

SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 23. Find customers who have never placed an order.

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 24. Count total orders placed by every customer.

SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 25. Display customer names and total purchase amount.

SELECT c.customer_name, COALESCE(SUM(o.amount), 0) AS total_purchase
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 26. Display customers whose total purchase amount exceeds ₹50,000.

SELECT c.customer_name, SUM(o.amount) AS total_purchase
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > 50000;

-- 27. Find customers with exactly one order.

SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) = 1;

-- 28. Find customers with more than one order.

SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;

-- 29. Display customer names having zero orders.

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) = 0;

-- 30. Display every customer with their latest order. -- AI

SELECT c.customer_name, o.order_id, o.product_name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id 
  AND o.order_date = (
      SELECT MAX(order_date) 
      FROM orders 
      WHERE customer_id = c.customer_id
  );


-- ## Part 4: RIGHT JOIN

-- 31. Display every order even if its customer does not exist.

SELECT o.order_id, c.customer_name
FROM orders as o
    RIGHT JOIN customers as c ON o.customer_id = c.customer_id;

-- 32. Find orphan orders (orders whose customer doesn't exist).

SELECT o.order_id, c.customer_name AS orphan_orders
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- 33. Count orphan orders.

SELECT COUNT(*) AS orphan_orders
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 34. Display only unmatched orders.

SELECT o.order_id, c.customer_name
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- 35. Display all orders with customer names if available.

SELECT o.order_id, c.customer_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;


-- ## Part 5: FULL JOIN (Using UNION)

-- 36. Display every customer and every order. -- error

SELECT c.customer_name, o.order_id
FROM customers c
FULL JOIN orders o ON c.customer_id = o.customer_id;

-- 37. Display unmatched customers and unmatched orders together. -- error

SELECT c.customer_name, o.order_id
FROM customers c
FULL JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL OR o.order_id IS NULL;

-- 38. Count unmatched records. -- error

SELECT c.customer_name, o.order_id
FROM customers c
FULL JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL OR o.order_id IS NULL;

-- 39. Display all matching and non-matching records together. -- error

SELECT c.customer_name, o.order_id
FROM customers c
FULL JOIN orders o ON c.customer_id = o.customer_id;

-- 40. Show which rows came from LEFT side and which came from RIGHT side.  -- error

SELECT c.customer_name, o.order_id
FROM customers c
FULL JOIN orders o ON c.customer_id = o.customer_id;


-- ## Part 6: ANTI JOIN

-- 41. Find customers without any orders.

SELECT o.order_id, c.customer_name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 42. Find orders without valid customers.

SELECT o.order_id, c.customer_name -- error
FROM orders o
RIGHT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

SELECT o.order_id -- AI
FROM orders o

-- 43. Find customers who never purchased Mobile category.

SELECT c.customer_name, o.category
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.category != 'Mobile' OR o.category IS NULL;

-- 44. Find customers who never purchased products costing above ₹20,000.

SELECT c.customer_name, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount <= 20000 OR o.amount IS NULL;

-- 45. Find cities having no customer orders.

SELECT c.city, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT c.city
FROM customers c

-- 46. Find customers who never bought Electronics.

SELECT c.customer_name, o.category
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.category != 'Electronics' OR o.category IS NULL;


-- ## Part 7: CROSS JOIN

-- 47. Generate every possible Customer-Product combination.

SELECT c.customer_name, o.product_name
FROM customers c
CROSS JOIN orders o;

-- 48. Count total rows produced by CROSS JOIN. 

SELECT COUNT(*) AS total_rows
FROM customers c
CROSS JOIN orders o;

-- 49. Show only the first 25 rows of CROSS JOIN.

SELECT c.customer_name, o.product_name
FROM customers c
CROSS JOIN orders o
LIMIT 25;

-- 50. Display only combinations where customer city is Ahmedabad.

SELECT c.customer_name, c.city, o.product_name
FROM customers c
CROSS JOIN orders o
WHERE c.city = 'Ahmedabad';


-- ## Part 8: GROUP BY with JOIN

-- 51. Count orders for every city.

SELECT c.city, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;

-- 52. Find average purchase amount by city.

SELECT c.city, AVG(o.amount) AS average_purchase
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;

-- 53. Find maximum order amount for each customer.

SELECT c.customer_name, MAX(o.amount) AS max_order_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 54. Find minimum purchase amount by category.

SELECT o.category, MIN(o.amount) AS min_purchase_amount
FROM orders o
GROUP BY o.category;

-- 55. Find total sales per category.

SELECT o.category, SUM(o.amount) AS total_sales
FROM orders o
GROUP BY o.category;

-- 56. Find total customers per city who placed orders.

SELECT c.city, COUNT(DISTINCT o.customer_id) AS total_customers
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;

-- 57. Display cities whose sales exceed ₹1,00,000.

SELECT c.city, SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.amount) > 100000;

-- 58. Find categories having more than one order.

SELECT o.category, COUNT(o.order_id) AS order_count
FROM orders o
GROUP BY o.category
HAVING COUNT(o.order_id) > 1;

-- 59. Display total sales ordered descending.

SELECT o.product_name, SUM(o.amount) AS total_sales
FROM orders o
GROUP BY o.product_name
ORDER BY total_sales DESC;

-- 60. Display average amount of each category.

SELECT o.category, AVG(o.amount) AS average_amount
FROM orders o
GROUP BY o.category;


-- ## Part 9: HAVING + JOIN

-- 61. Display customers whose total spending exceeds ₹50,000.

SELECT c.customer_name, SUM(o.amount) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > 50000;

-- 62. Display categories having average amount greater than ₹20,000.

SELECT category, AVG(amount) AS avg_amount
FROM orders
GROUP BY category
HAVING AVG(amount) > 20000;

-- 63. Display cities having more than one customer with orders.

SELECT c.city, COUNT(DISTINCT o.customer_id) AS customer_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING COUNT(DISTINCT c.customer_id) > 1;

-- 64. Display customers with at least two orders.

SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 2;

-- 65. Display categories whose total sales exceed ₹60,000.

SELECT category, SUM(amount) AS total_sales
FROM orders
GROUP BY category
HAVING SUM(amount) > 60000;


-- ## Part 10: Three Table JOIN

-- 66. Display employee name with department.

SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 67. Display employee name with department and city.

SELECT e.first_name, e.last_name, d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 68. Display employee name, department, city and country.

SELECT e.first_name, e.last_name, d.department_name, l.city, c.country
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 69. Display all employees even if department is NULL.

SELECT e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- 70. Find employees without departments.

SELECT e.first_name, e.last_name
FROM employees e
WHERE e.department_id IS NULL;

-- 71. Count employees in every department.

SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- 72. Find department having maximum employees.

SELECT d.department_name, COUNT(e.employee_id) AS emp_count
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY emp_count DESC
LIMIT 1;

-- 73. Find average salary by department.

SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- 74. Find average salary by country. -- error

SELECT c.country, AVG(e.salary) AS avg_salary
FROM countries c
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
GROUP BY c.country_id, c.country;

-- 75. Display highest salary employee from each department. -- AI

SELECT d.department_name, e.first_name, e.last_name, e.salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN (
    SELECT department_id, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
)
max_salaries ON e.department_id = max_salaries.department_id AND e.salary = max_salaries.max_salary;

-- 76. Display lowest salary employee from each department. -- AI

SELECT e.first_name, e.last_name, e.department_id, e.salary
FROM employees e
WHERE (e.department_id, e.salary) IN (
    SELECT department_id, MIN(salary)
    FROM employees
    GROUP BY department_id
);

-- 77. Display total salary paid by each department.

SELECT d.department_name, SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- 78. Find departments having total salary greater than ₹2,00,000.

SELECT d.department_name, SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING SUM(e.salary) > 200000;

-- 79. Display employees working in India. -- error

SELECT e.first_name, e.last_name
FROM employees e
JOIN employees e ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.country = 'India';

-- 80. Display employees working in London. -- error

SELECT e.first_name, e.last_name
FROM employees e
JOIN employees e ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'London';


-- ## Part 11: Multiple Conditions in JOIN

-- 81. Display employees hired after March 2022 with department details.

SELECT e.first_name, e.last_name, e.hire_date, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.hire_date > '2022-03-31';

-- 82. Display employees earning more than ₹48,000.

SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > 48000;

-- 83. Display employees earning between ₹45,000 and ₹48,000.

SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary BETWEEN 45000 AND 48000;

-- 84. Display employees whose department is Marketing.

SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Marketing';

-- 85. Display employees working in Germany.

SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.country = 'Germany';

-- 86. Display employees from departments located in Australia.

SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.country = 'Australia';

-- 87. Display employees ordered by country and salary descending. -- error

SELECT e.first_name, e.last_name, l.country, e.salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
JOIN locations ON departments.location_id = locations.location_id
ORDER BY locations.country, employees.salary DESC;

-- 88. Find departments where average salary exceeds ₹47,000.

SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING AVG(e.salary) > 47000;

-- 89. Display employees hired in July.

SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE MONTH(e.hire_date) = 7;

-- 90. Display employees whose first name ends with "5".

SELECT e.first_name, e.last_name
FROM employees e
WHERE e.first_name LIKE '%5';


-- ## Part 12: JOIN + Aggregate Functions

-- 91. Count employees in each country.

SELECT l.country, COUNT(e.employee_id) AS total_employees
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.country;

-- 92. Count departments in each country.

SELECT l.country, COUNT(d.department_id) AS total_departments
FROM departments d
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.country;

-- 93. Find highest salary in every country.

SELECT l.country, MAX(e.salary) AS highest_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.country;

-- 94. Find lowest salary in every location.

SELECT l.city, MIN(e.salary) AS lowest_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.city;

-- 95. Find average salary by location.

SELECT l.city, AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.city;

-- 96. Count employees having NULL department.

SELECT COUNT(*) AS null_department_count
FROM employees
WHERE department_id IS NULL;

-- 97. Find total salary by country.

SELECT l.country, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.country;

-- 98. Find departments having fewer than 5 employees.

SELECT d.department_name, COUNT(e.employee_id) AS emp_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 5;


-- ## Part 13: Self JOIN

-- Create an `employees(employee_id, employee_name, manager_id)` table.

-- Create the employees table with a self-referencing foreign key for managers

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_id, employee_name, manager_id) VALUES
(1, 'Emp1', 1),
(2, 'Emp2', 2),
(3, 'Emp3', 3),
(4, 'Emp4', 4),
(5, 'Emp5', 5);

-- 101. Display employee with manager name.
-- 102. Find employees without managers.
-- 103. Display manager with total employees reporting.
-- 104. Find manager having maximum subordinates.
-- 105. Display employees reporting to Emp1.
-- 106. Display employees reporting indirectly to a manager.
-- 107. Display employee-manager pairs ordered alphabetically.
-- 108. Count employees under each manager.
-- 109. Find managers with more than 3 employees.
-- 110. Display top-level managers.

-- ## Part 14: Projects Table

-- Create a `projects(project_id, project_name, department_id, budget)` table.

-- 111. Display project name with department.
-- 112. Display project city.
-- 113. Display total project budget by country.
-- 114. Find departments having no projects.
-- 115. Find projects without departments.
-- 116. Display average project budget by location.
-- 117. Find department having highest project budget.
-- 118. Display projects located in India.
-- 119. Display all departments with project count.
-- 120. Find departments handling more than one project.

-- ## Part 15: Many-to-Many JOIN

-- Create `students`, `courses`, and `enrollments` tables.

-- 121. Display student name with enrolled course.
-- 122. Count courses per student.
-- 123. Count students per course.
-- 124. Find students enrolled in more than two courses.
-- 125. Find courses having no students.
-- 126. Find students not enrolled anywhere.
-- 127. Display total enrollments by course.
-- 128. Find most popular course.
-- 129. Find least popular course.
-- 130. Display all students and courses including unmatched records.

-- ## Challenge Questions

-- 131. Find the top 3 customers by total spending.
-- 132. Find the city with the highest sales.
-- 133. Find the department having the highest average salary.
-- 134. Display the customer who purchased the most expensive product.
-- 135. Display customers who purchased products from more than one category.
-- 136. Find customers whose every order exceeds ₹20,000.
-- 137. Find departments where every employee earns above ₹45,000.
-- 138. Display customers who bought both Mobile and Electronics products.
-- 139. Display employees whose salary is above their department average.
-- 140. Find the country having the maximum number of employees.