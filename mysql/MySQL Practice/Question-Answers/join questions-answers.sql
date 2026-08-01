
USE joins_db;

-- # SQL JOIN Practice Questions

SELECT * FROM customers as c;
SELECT * FROM orders as o;

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
-- 12. Find customers whose names start with "A" and have placed orders.
-- 13. Show all orders placed after `2025-01-15`.
-- 14. Display all products whose category is either Mobile or Electronics.
-- 15. Find all customers living in Mumbai or Delhi who placed orders.
-- 16. Display all orders except Mobile category.
-- 17. Find customers who bought products costing less than ₹5,000.
-- 18. Display customer name and product name ordered in January 2025.
-- 19. Display orders sorted first by category and then by amount descending.
-- 20. Show customers who purchased products beginning with the letter "S".

-- ## Part 3: LEFT JOIN

-- 21. Display all customers whether they placed orders or not.
-- 22. Display customer names with NULL if they never ordered.
-- 23. Find customers who have never placed an order.
-- 24. Count total orders placed by every customer.
-- 25. Display customer names and total purchase amount.
-- 26. Display customers whose total purchase amount exceeds ₹50,000.
-- 27. Find customers with exactly one order.
-- 28. Find customers with more than one order.
-- 29. Display customer names having zero orders.
-- 30. Display every customer with their latest order.

-- ## Part 4: RIGHT JOIN

-- 31. Display every order even if its customer does not exist.
-- 32. Find orphan orders (orders whose customer doesn't exist).
-- 33. Count orphan orders.
-- 34. Display only unmatched orders.
-- 35. Display all orders with customer names if available.

-- ## Part 5: FULL JOIN (Using UNION)

-- 36. Display every customer and every order.
-- 37. Display unmatched customers and unmatched orders together.
-- 38. Count unmatched records.
-- 39. Display all matching and non-matching records together.
-- 40. Show which rows came from LEFT side and which came from RIGHT side.

-- ## Part 6: ANTI JOIN

-- 41. Find customers without any orders.
-- 42. Find orders without valid customers.
-- 43. Find customers who never purchased Mobile category.
-- 44. Find customers who never purchased products costing above ₹20,000.
-- 45. Find cities having no customer orders.
-- 46. Find customers who never bought Electronics.

-- ## Part 7: CROSS JOIN

-- 47. Generate every possible Customer-Product combination.
-- 48. Count total rows produced by CROSS JOIN.
-- 49. Show only the first 25 rows of CROSS JOIN.
-- 50. Display only combinations where customer city is Ahmedabad.

-- ## Part 8: GROUP BY with JOIN

-- 51. Count orders for every city.
-- 52. Find average purchase amount by city.
-- 53. Find maximum order amount for each customer.
-- 54. Find minimum purchase amount by category.
-- 55. Find total sales per category.
-- 56. Find total customers per city who placed orders.
-- 57. Display cities whose sales exceed ₹1,00,000.
-- 58. Find categories having more than one order.
-- 59. Display total sales ordered descending.
-- 60. Display average amount of each category.

-- ## Part 9: HAVING + JOIN

-- 61. Display customers whose total spending exceeds ₹50,000.
-- 62. Display categories having average amount greater than ₹20,000.
-- 63. Display cities having more than one customer with orders.
-- 64. Display customers with at least two orders.
-- 65. Display categories whose total sales exceed ₹60,000.

-- ## Part 10: Three Table JOIN

-- 66. Display employee name with department.
-- 67. Display employee name with department and city.
-- 68. Display employee name, department, city and country.
-- 69. Display all employees even if department is NULL.
-- 70. Find employees without departments.
-- 71. Count employees in every department.
-- 72. Find department having maximum employees.
-- 73. Find average salary by department.
-- 74. Find average salary by country.
-- 75. Display highest salary employee from each department.
-- 76. Display lowest salary employee from each department.
-- 77. Display total salary paid by each department.
-- 78. Find departments having total salary greater than ₹2,00,000.
-- 79. Display employees working in India.
-- 80. Display employees working in London.

-- ## Part 11: Multiple Conditions in JOIN

-- 81. Display employees hired after March 2022 with department details.
-- 82. Display employees earning more than ₹48,000.
-- 83. Display employees earning between ₹45,000 and ₹48,000.
-- 84. Display employees whose department is Marketing.
-- 85. Display employees working in Germany.
-- 86. Display employees from departments located in Australia.
-- 87. Display employees ordered by country and salary descending.
-- 88. Find departments where average salary exceeds ₹47,000.
-- 89. Display employees hired in July.
-- 90. Display employees whose first name ends with "5".

-- ## Part 12: JOIN + Aggregate Functions

-- 91. Count employees in each country.
-- 92. Count departments in each country.
-- 93. Find highest salary in every country.
-- 94. Find lowest salary in every location.
-- 95. Find average salary by location.
-- 96. Count employees having NULL department.
-- 97. Find total salary by country.
-- 98. Find departments having fewer than 5 employees.
-- 99. Find department with highest average salary.
-- 100. Find country with highest payroll.

-- ## Part 13: Self JOIN

-- Create an `employees(employee_id, employee_name, manager_id)` table.

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