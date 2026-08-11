# MySQL VIEW — Complete Detailed Guide

## Table of Contents

1. [What is a VIEW?](#1-what-is-a-view)
2. [Why are VIEWs Used?](#2-why-are-views-used)
3. [Basic Syntax](#3-basic-syntax)
4. [Creating a VIEW](#4-creating-a-view)
5. [Creating a Simple VIEW](#5-creating-a-simple-view)
6. [VIEW with WHERE](#6-view-with-where)
7. [VIEW with JOIN](#7-view-with-join)
8. [VIEW with GROUP BY](#8-view-with-group-by)
9. [VIEW with JOIN and GROUP BY](#9-view-with-join-and-group-by)
10. [Using WHERE with a VIEW](#10-using-where-with-a-view)
11. [CREATE OR REPLACE VIEW](#11-create-or-replace-view)
12. [ALTER VIEW](#12-alter-view)
13. [Showing Existing VIEWs](#13-showing-existing-views)
14. [Seeing the Definition of a VIEW](#14-seeing-the-definition-of-a-view)
15. [Dropping a VIEW](#15-dropping-a-view)
16. [VIEW vs TABLE](#16-view-vs-table)
17. [VIEW vs TEMPORARY TABLE](#17-view-vs-temporary-table)
18. [Updating Data Through a VIEW](#18-updating-data-through-a-view)
19. [Why Can't Every VIEW Be Updated?](#19-why-cant-every-view-be-updated)
20. [WITH CHECK OPTION](#20-with-check-option)
21. [Security Using VIEW](#21-security-using-view)
22. [VIEW Based on Multiple Tables](#22-view-based-on-multiple-tables)
23. [Can a VIEW Depend on Another VIEW?](#23-can-a-view-depend-on-another-view)
24. [Renaming a VIEW](#24-renaming-a-view)
25. [VIEW and Performance](#25-view-and-performance)
26. [VIEW and Indexes](#26-view-and-indexes)
27. [Real-World Example](#27-real-world-example)
28. [Important VIEW Commands](#28-important-view-commands)
29. [Advantages of VIEW](#29-advantages-of-view)
30. [Disadvantages of VIEW](#30-disadvantages-of-view)
31. [Important Interview Questions](#31-important-interview-questions)
32. [The Most Important Concept](#32-the-most-important-concept)

---

# 1. What is a VIEW?

A **VIEW** in MySQL is a **virtual table** based on the result of a SQL query.

A VIEW does not normally store a separate copy of the underlying table data. Instead, MySQL stores the **definition of the query**.

When you query the VIEW, MySQL uses the underlying query to retrieve the required data.

In simple words:

> **A VIEW is a saved SQL query that can be used like a virtual table.**

For example, suppose you have an `employees` table:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2),
    city VARCHAR(50)
);
```

Suppose you frequently need employees whose salary is greater than `50000`.

Normally, you would write:

```sql
SELECT
    employee_id,
    employee_name,
    salary
FROM employees
WHERE salary > 50000;
```

Instead, you can create a VIEW:

```sql
CREATE VIEW high_salary_employees AS
SELECT
    employee_id,
    employee_name,
    salary
FROM employees
WHERE salary > 50000;
```

Now you can simply use:

```sql
SELECT *
FROM high_salary_employees;
```

The VIEW behaves similarly to a table when you query it.

---

# 2. Why are VIEWs Used?

VIEWs are commonly used for several reasons.

## 2.1 Simplifying Complex Queries

Suppose you have a complicated query involving:

- Multiple tables
- `JOIN`
- `WHERE`
- `GROUP BY`
- Aggregate functions
- Calculated columns

Instead of writing the same query repeatedly, you can save it as a VIEW.

For example:

```sql
CREATE VIEW employee_department_details AS
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;
```

Now you can simply write:

```sql
SELECT *
FROM employee_department_details;
```

---

## 2.2 Security

VIEWs can be used to expose only selected columns or rows.

Suppose the employee table contains:

```text
employee_id
employee_name
email
salary
bank_account
aadhaar_number
```

You may not want every user to see sensitive information.

You can create:

```sql
CREATE VIEW employee_public_info AS
SELECT
    employee_id,
    employee_name,
    email
FROM employees;
```

Users can query:

```sql
SELECT *
FROM employee_public_info;
```

They can see only the information exposed by the VIEW.

---

## 2.3 Data Abstraction

Users do not necessarily need to know the structure of the underlying database.

For example, a VIEW might combine:

```text
employees
departments
projects
attendance
```

The user can simply query:

```sql
SELECT *
FROM employee_report;
```

The complexity is hidden inside the VIEW.

---

## 2.4 Reusability

A complicated query can be written once and reused many times.

Instead of:

```sql
SELECT ...
FROM ...
JOIN ...
WHERE ...
GROUP BY ...;
```

every time, you can create:

```sql
CREATE VIEW report AS
SELECT ...;
```

Then:

```sql
SELECT *
FROM report;
```

---

## 2.5 Consistency

If multiple developers or departments need the same report, they can use the same VIEW.

This helps ensure everyone uses the same SQL logic.

---

# 3. Basic Syntax

The basic syntax for creating a VIEW is:

```sql
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

Example:

```sql
CREATE VIEW employee_details AS
SELECT
    employee_id,
    employee_name,
    salary
FROM employees;
```

Then:

```sql
SELECT *
FROM employee_details;
```

---

# 4. Creating a VIEW

Let's create a realistic example using two tables.

## Department Table

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);
```

Insert data:

```sql
INSERT INTO departments
VALUES
(1, 'IT', 'Ahmedabad'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Pune'),
(5, 'Sales', 'Bangalore');
```

---

## Employee Table

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2),
    city VARCHAR(100),
    joining_date DATE,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
```

Insert data:

```sql
INSERT INTO employees
VALUES
(101, 'Rahul Sharma', 1, 65000, 'Ahmedabad', '2022-04-10'),
(102, 'Priya Patel', 2, 55000, 'Mumbai', '2021-07-15'),
(103, 'Amit Shah', 1, 72000, 'Ahmedabad', '2020-03-20'),
(104, 'Neha Mehta', 3, 60000, 'Delhi', '2023-01-12'),
(105, 'Raj Patel', 5, 48000, 'Bangalore', '2024-06-01');
```

Now we can create different VIEWs based on these tables.

---

# 5. Creating a Simple VIEW

Let's create a VIEW containing basic employee information.

```sql
CREATE VIEW employee_basic_info AS
SELECT
    employee_id,
    employee_name,
    city
FROM employees;
```

Now query the VIEW:

```sql
SELECT *
FROM employee_basic_info;
```

Example result:

| employee_id | employee_name | city |
|---:|---|---|
| 101 | Rahul Sharma | Ahmedabad |
| 102 | Priya Patel | Mumbai |
| 103 | Amit Shah | Ahmedabad |
| 104 | Neha Mehta | Delhi |
| 105 | Raj Patel | Bangalore |

The VIEW contains only:

- Employee ID
- Employee Name
- City

The salary and department ID are not exposed through this VIEW.

---

# 6. VIEW with WHERE

A VIEW can contain a `WHERE` condition.

For example, suppose we want only employees earning at least `60000`.

```sql
CREATE VIEW high_salary_employees AS
SELECT
    employee_id,
    employee_name,
    salary
FROM employees
WHERE salary >= 60000;
```

Query it:

```sql
SELECT *
FROM high_salary_employees;
```

Example result:

| employee_id | employee_name | salary |
|---:|---|---:|
| 101 | Rahul Sharma | 65000 |
| 103 | Amit Shah | 72000 |
| 104 | Neha Mehta | 60000 |

The filtering condition is stored as part of the VIEW definition.

---

# 7. VIEW with JOIN

One of the most useful applications of VIEWs is hiding complicated `JOIN` operations.

Suppose we want to display:

- Employee Name
- Department
- Salary
- Employee City
- Department Location

The information is stored in two tables:

```text
employees
departments
```

Normally, we would write:

```sql
SELECT
    e.employee_name,
    d.department_name,
    e.salary,
    e.city,
    d.location
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;
```

Instead, we can create a VIEW:

```sql
CREATE VIEW employee_department_details AS
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary,
    e.city,
    d.location
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;
```

Now simply execute:

```sql
SELECT *
FROM employee_department_details;
```

You can also filter the VIEW:

```sql
SELECT *
FROM employee_department_details
WHERE salary > 60000;
```

Or:

```sql
SELECT
    employee_name,
    department_name
FROM employee_department_details
WHERE department_name = 'IT';
```

---

# 8. VIEW with GROUP BY

VIEWs can also contain aggregate queries.

Suppose we want salary statistics for each department.

```sql
CREATE VIEW department_salary_summary AS
SELECT
    department_id,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY department_id;
```

Now:

```sql
SELECT *
FROM department_salary_summary;
```

The VIEW provides a reusable department-level salary summary.

---

# 9. VIEW with JOIN and GROUP BY

We can make the previous example more useful by displaying the department name instead of the department ID.

```sql
CREATE VIEW department_salary_summary AS
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name;
```

Now:

```sql
SELECT *
FROM department_salary_summary;
```

Example output could look like:

| department_name | total_employees | average_salary | highest_salary | lowest_salary |
|---|---:|---:|---:|---:|
| IT | 2 | 68500 | 72000 | 65000 |
| HR | 1 | 55000 | 55000 | 55000 |
| Finance | 1 | 60000 | 60000 | 60000 |
| Marketing | 0 | NULL | NULL | NULL |
| Sales | 1 | 48000 | 48000 | 48000 |

---

# 10. Using WHERE with a VIEW

A VIEW can be queried just like a normal table.

For example:

```sql
SELECT *
FROM employee_department_details
WHERE department_name = 'IT';
```

You can also select specific columns:

```sql
SELECT
    employee_name,
    salary
FROM employee_department_details;
```

You can use `ORDER BY`:

```sql
SELECT *
FROM employee_department_details
ORDER BY salary DESC;
```

You can use additional filtering:

```sql
SELECT *
FROM employee_department_details
WHERE salary > 60000
ORDER BY salary DESC;
```

You can also use aggregate functions on a VIEW:

```sql
SELECT
    department_name,
    COUNT(*) AS total_employees
FROM employee_department_details
GROUP BY department_name;
```

Therefore, a VIEW can be treated much like a table when querying it.

---

# 11. CREATE OR REPLACE VIEW

Suppose we created:

```sql
CREATE VIEW employee_basic_info AS
SELECT
    employee_id,
    employee_name,
    city
FROM employees;
```

Later, we want to add the salary column.

We can use:

```sql
CREATE OR REPLACE VIEW employee_basic_info AS
SELECT
    employee_id,
    employee_name,
    city,
    salary
FROM employees;
```

This replaces the existing VIEW definition.

Now:

```sql
SELECT *
FROM employee_basic_info;
```

will include the salary column.

---

# 12. ALTER VIEW

You can also modify a VIEW using:

```sql
ALTER VIEW view_name AS
SELECT ...
FROM ...;
```

Example:

```sql
ALTER VIEW employee_basic_info AS
SELECT
    employee_id,
    employee_name,
    city,
    salary
FROM employees;
```

This changes the VIEW definition.

---

# 13. Showing Existing VIEWs

To see the VIEWs available in the current database:

```sql
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
```

Example output:

| Tables_in_company | Table_type |
|---|---|
| employee_basic_info | VIEW |
| high_salary_employees | VIEW |
| employee_department_details | VIEW |
| department_salary_summary | VIEW |

This is useful when working with a database containing many tables and VIEWs.

---

# 14. Seeing the Definition of a VIEW

To see how a VIEW was created, use:

```sql
SHOW CREATE VIEW employee_basic_info;
```

For example:

```sql
SHOW CREATE VIEW employee_department_details;
```

MySQL will return information including the SQL statement used to define the VIEW.

This is useful for:

- Understanding existing database structures
- Debugging
- Documentation
- Maintenance
- Database administration

---

# 15. Dropping a VIEW

If you no longer need a VIEW:

```sql
DROP VIEW employee_basic_info;
```

For multiple VIEWs:

```sql
DROP VIEW
    view1,
    view2,
    view3;
```

A safer approach is:

```sql
DROP VIEW IF EXISTS employee_basic_info;
```

This prevents an error if the VIEW does not exist.

---

# 16. VIEW vs TABLE

This is one of the most important concepts.

| Feature | TABLE | VIEW |
|---|---|---|
| Stores actual data | Yes | Normally no |
| Stores SQL query definition | No | Yes |
| Has physical row storage | Yes | Normally no separate rows |
| Can use `SELECT` | Yes | Yes |
| Can use `JOIN` | Yes | Yes |
| Can use `WHERE` | Yes | Yes |
| Can be queried like a table | Yes | Yes |
| Can hide columns | Possible through permissions | Yes |
| Automatically reflects base-table changes | N/A | Yes |
| Usually consumes storage for rows | Yes | No separate row storage |

### Simple rule

> **TABLE = stores data**

> **VIEW = stores a query definition**

---

# 17. VIEW vs TEMPORARY TABLE

A VIEW and a temporary table are different.

## VIEW

```sql
CREATE VIEW employee_view AS
SELECT *
FROM employees;
```

The VIEW remains available until it is explicitly dropped, subject to the dependencies and database objects involved.

---

## TEMPORARY TABLE

```sql
CREATE TEMPORARY TABLE employee_temp AS
SELECT *
FROM employees;
```

A temporary table exists only for the current database session.

When the session ends, MySQL automatically removes the temporary table.

### Comparison

| Feature | VIEW | TEMPORARY TABLE |
|---|---|---|
| Permanent object | Yes | No |
| Stores result rows separately | Normally no | Yes |
| Automatically removed after session | No | Yes |
| Stores query definition | Yes | No |
| Useful for reusable logic | Yes | Usually session-specific |
| Can have indexes | No indexes on a normal VIEW itself | Yes |

---

# 18. Updating Data Through a VIEW

Some VIEWs are **updatable**.

Consider this VIEW:

```sql
CREATE VIEW employee_names AS
SELECT
    employee_id,
    employee_name,
    city
FROM employees;
```

You may be able to update data through the VIEW:

```sql
UPDATE employee_names
SET city = 'Surat'
WHERE employee_id = 101;
```

The underlying `employees` table is updated.

You can verify it:

```sql
SELECT *
FROM employees
WHERE employee_id = 101;
```

The city will now be:

```text
Surat
```

### Important

Not every VIEW is automatically updatable.

Whether a VIEW can be modified depends on its definition.

---

# 19. Why Can't Every VIEW Be Updated?

Some VIEWs do not represent individual base-table rows clearly.

For example:

```sql
CREATE VIEW department_summary AS
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;
```

This VIEW calculates an average salary.

Suppose the result is:

```text
IT       68500
HR       55000
Finance  60000
```

If you execute:

```sql
UPDATE department_summary
SET average_salary = 70000
WHERE department_id = 1;
```

What employee's salary should MySQL change?

There isn't a single underlying row corresponding to `average_salary`.

Therefore, aggregate VIEWs generally cannot be updated in the same straightforward way as simple row-level VIEWs.

---

## Common Features That Can Prevent or Restrict Updating

VIEWs involving the following may not be updatable:

- `GROUP BY`
- Aggregate functions such as `SUM()`, `AVG()`, `COUNT()`
- `DISTINCT`
- `UNION`
- Certain `JOIN` structures
- Subqueries
- Derived/calculated results
- Other constructs that prevent a clear mapping to base-table rows

---

# 20. WITH CHECK OPTION

`WITH CHECK OPTION` is an important feature of VIEWs.

Suppose we create a VIEW containing only Ahmedabad employees:

```sql
CREATE VIEW ahmedabad_employees AS
SELECT
    employee_id,
    employee_name,
    city
FROM employees
WHERE city = 'Ahmedabad';
```

The VIEW only displays rows where:

```sql
city = 'Ahmedabad'
```

Now imagine updating a row through the VIEW:

```sql
UPDATE ahmedabad_employees
SET city = 'Mumbai'
WHERE employee_id = 101;
```

The row would no longer satisfy the VIEW's condition.

To prevent this type of modification, create the VIEW using:

```sql
CREATE OR REPLACE VIEW ahmedabad_employees AS
SELECT
    employee_id,
    employee_name,
    city
FROM employees
WHERE city = 'Ahmedabad'
WITH CHECK OPTION;
```

Now MySQL checks that modifications made through the VIEW continue to satisfy the VIEW's filtering condition.

---

## Why is `WITH CHECK OPTION` Useful?

It helps maintain the logical rule represented by the VIEW.

For example:

```text
VIEW:
Only Ahmedabad employees
        ↓
User updates employee
        ↓
Changes city to Mumbai
        ↓
Does not satisfy VIEW condition
        ↓
MySQL rejects the modification
```

---

# 21. Security Using VIEW

Security is one of the most important real-world applications of VIEWs.

Suppose your employee table contains:

```text
employee_id
employee_name
email
salary
bank_account
aadhaar_number
```

You don't want a reporting user to access:

```text
salary
bank_account
aadhaar_number
```

You can create:

```sql
CREATE VIEW employee_public_data AS
SELECT
    employee_id,
    employee_name,
    email
FROM employees;
```

Then users can query:

```sql
SELECT *
FROM employee_public_data;
```

Instead of giving users direct access to all columns of the base table, you can give appropriate privileges on the VIEW.

For example:

```sql
GRANT SELECT
ON company.employee_public_data
TO 'report_user'@'localhost';
```

The exact privilege setup depends on your database security requirements.

---

# 22. VIEW Based on Multiple Tables

A VIEW can combine information from multiple tables.

For example:

```sql
CREATE VIEW employee_full_details AS
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary,
    e.city
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;
```

Now:

```sql
SELECT *
FROM employee_full_details;
```

Instead of repeatedly writing:

```sql
SELECT ...
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;
```

you can use:

```sql
SELECT *
FROM employee_full_details;
```

---

# 23. Can a VIEW Depend on Another VIEW?

Yes.

A VIEW can be created using another VIEW.

For example, first create:

```sql
CREATE VIEW employee_details AS
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;
```

Then create another VIEW:

```sql
CREATE VIEW high_paid_employee_details AS
SELECT
    employee_id,
    employee_name,
    department_name,
    salary
FROM employee_details
WHERE salary >= 60000;
```

Now:

```sql
SELECT *
FROM high_paid_employee_details;
```

The dependency looks like:

```text
employees
    +
departments
    |
    v
employee_details
    |
    v
high_paid_employee_details
```

This is possible, but excessive nesting can make database logic difficult to understand and maintain.

---

# 24. Renaming a VIEW

MySQL does not provide a simple `RENAME VIEW` statement like:

```sql
RENAME VIEW old_name TO new_name;
```

Instead, you can create a new VIEW and remove the old one.

For example:

```sql
CREATE VIEW employee_information AS
SELECT
    employee_id,
    employee_name,
    city
FROM employees;
```

Then:

```sql
DROP VIEW employee_basic_info;
```

If the original VIEW had a complex definition, make sure you recreate the exact required definition before dropping the old VIEW.

---

# 25. VIEW and Performance

A common misunderstanding is:

> "Because a VIEW is virtual, it will always make queries faster."

This is **not necessarily true**.

A normal MySQL VIEW does not automatically store the query result like a materialized result table.

For example:

```sql
CREATE VIEW high_salary_employees AS
SELECT *
FROM employees
WHERE salary > 60000;
```

When you run:

```sql
SELECT *
FROM high_salary_employees;
```

MySQL still has to process the underlying query.

Therefore, VIEWs are primarily useful for:

- Simplicity
- Abstraction
- Security
- Reusability
- Consistency

They should not automatically be considered a performance optimization.

---

# 26. VIEW and Indexes

A normal VIEW does not have its own indexes because it does not normally store its own rows.

Instead, queries against a VIEW can benefit from indexes on the underlying tables.

For example:

```sql
CREATE INDEX idx_employee_salary
ON employees(salary);
```

If a VIEW uses:

```sql
WHERE salary > 60000
```

the optimizer may be able to use the index on the underlying `employees` table.

You can inspect query execution using:

```sql
EXPLAIN
SELECT *
FROM high_salary_employees;
```

The actual performance depends on:

- Table size
- Indexes
- Query complexity
- Join conditions
- Filtering
- MySQL optimizer decisions
- Data distribution

---

# 27. Real-World Example

Imagine an IT company has the following tables:

```text
employees
departments
projects
attendance
salary
```

Management frequently wants:

```text
Employee Name
Department
City
Salary
```

Instead of writing a complicated query repeatedly, create:

```sql
CREATE VIEW management_employee_report AS
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.city,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;
```

Now management can simply execute:

```sql
SELECT *
FROM management_employee_report;
```

---

## Filter by Department

```sql
SELECT *
FROM management_employee_report
WHERE department_name = 'IT';
```

---

## Find Employees with High Salaries

```sql
SELECT *
FROM management_employee_report
WHERE salary > 70000;
```

---

## Sort by Salary

```sql
SELECT *
FROM management_employee_report
ORDER BY salary DESC;
```

---

## Department-wise Employee Count

```sql
SELECT
    department_name,
    COUNT(*) AS total_employees
FROM management_employee_report
GROUP BY department_name;
```

---

## Department-wise Average Salary

```sql
SELECT
    department_name,
    AVG(salary) AS average_salary
FROM management_employee_report
GROUP BY department_name;
```

This demonstrates why VIEWs are useful in real-world applications.

---

# 28. Important VIEW Commands

## Create a VIEW

```sql
CREATE VIEW view_name AS
SELECT ...
FROM ...;
```

---

## Create or Replace a VIEW

```sql
CREATE OR REPLACE VIEW view_name AS
SELECT ...
FROM ...;
```

---

## Alter a VIEW

```sql
ALTER VIEW view_name AS
SELECT ...
FROM ...;
```

---

## Query a VIEW

```sql
SELECT *
FROM view_name;
```

---

## Query Specific Columns

```sql
SELECT
    column1,
    column2
FROM view_name;
```

---

## Show All VIEWs

```sql
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
```

---

## Show VIEW Definition

```sql
SHOW CREATE VIEW view_name;
```

---

## Drop a VIEW

```sql
DROP VIEW view_name;
```

---

## Drop a VIEW Safely

```sql
DROP VIEW IF EXISTS view_name;
```

---

# 29. Advantages of VIEW

## 29.1 Simplicity

Complex SQL queries can be hidden behind a simple VIEW name.

Instead of:

```sql
SELECT ...
FROM employees
JOIN departments
    ON ...
WHERE ...
GROUP BY ...;
```

you can use:

```sql
SELECT *
FROM employee_report;
```

---

## 29.2 Security

You can expose only required columns and rows.

For example:

```sql
CREATE VIEW public_employee_info AS
SELECT
    employee_id,
    employee_name,
    email
FROM employees;
```

---

## 29.3 Reusability

The same query logic can be reused by multiple users or applications.

---

## 29.4 Abstraction

Users do not need to know how many tables are being used behind the VIEW.

---

## 29.5 Consistency

Everyone can use the same predefined business logic.

---

## 29.6 Maintainability

If the logic changes, you can modify the VIEW instead of changing the same query in many different applications.

---

# 30. Disadvantages of VIEW

## 30.1 Performance Is Not Automatically Better

A normal VIEW does not automatically cache or store the query result.

---

## 30.2 Complex VIEWs Can Become Difficult to Maintain

For example:

```text
View A
   |
   v
View B
   |
   v
View C
   |
   v
Multiple Tables
```

Excessive nesting can make debugging difficult.

---

## 30.3 Some VIEWs Are Not Updatable

VIEWs containing aggregation, grouping, distinct results, unions, and certain joins may not be directly updatable.

---

## 30.4 Dependency Issues

If an underlying table or column changes, a dependent VIEW may stop working correctly.

For example:

```text
employees
    |
    v
employee_details VIEW
```

If you remove a column used by `employee_details`, the VIEW may need to be changed.

---

# 31. Important Interview Questions

## Q1. What is a VIEW in MySQL?

A VIEW is a virtual table based on the result of a SQL query.

---

## Q2. Does a VIEW store data?

A normal MySQL VIEW stores the **query definition**, not a separate copy of the underlying table rows.

---

## Q3. How do you create a VIEW?

```sql
CREATE VIEW employee_view AS
SELECT *
FROM employees;
```

---

## Q4. How do you query a VIEW?

```sql
SELECT *
FROM employee_view;
```

---

## Q5. Can we use SELECT on a VIEW?

Yes.

```sql
SELECT *
FROM employee_view;
```

---

## Q6. Can we update a VIEW?

Some VIEWs are updatable, but not all VIEWs are.

---

## Q7. Can a VIEW contain a JOIN?

Yes.

```sql
CREATE VIEW employee_details AS
SELECT
    e.employee_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;
```

---

## Q8. Can a VIEW contain GROUP BY?

Yes.

```sql
CREATE VIEW department_summary AS
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;
```

However, such a VIEW is generally not updatable.

---

## Q9. How do you delete a VIEW?

```sql
DROP VIEW view_name;
```

---

## Q10. How do you safely delete a VIEW?

```sql
DROP VIEW IF EXISTS view_name;
```

---

## Q11. How do you see the definition of a VIEW?

```sql
SHOW CREATE VIEW view_name;
```

---

## Q12. How do you see all VIEWs in the current database?

```sql
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
```

---

## Q13. Can one VIEW use another VIEW?

Yes.

Example:

```sql
CREATE VIEW view2 AS
SELECT *
FROM view1;
```

---

## Q14. What is `WITH CHECK OPTION`?

`WITH CHECK OPTION` ensures that modifications made through an updatable VIEW continue to satisfy the VIEW's filtering condition.

Example:

```sql
CREATE VIEW ahmedabad_employees AS
SELECT
    employee_id,
    employee_name,
    city
FROM employees
WHERE city = 'Ahmedabad'
WITH CHECK OPTION;
```

---

## Q15. Does a VIEW improve query performance?

Not automatically.

A normal VIEW primarily provides abstraction, security, reusability, and simpler SQL. Query performance depends on the underlying query, indexes, data, and optimizer.

---

## Q16. What is the difference between a TABLE and a VIEW?

A table normally stores actual rows of data, while a VIEW normally stores a query definition that presents data from underlying tables.

---

## Q17. What is the difference between a VIEW and a TEMPORARY TABLE?

A VIEW is a database object based on a query definition, while a temporary table stores result rows for the duration of the database session.

---

# 32. The Most Important Concept

The easiest way to remember MySQL VIEWs is:

```text
                BASE TABLES
                     |
             +-------+-------+
             |               |
         employees       departments
             |               |
             +-------+-------+
                     |
                    JOIN
                     |
                     v
                 SQL QUERY
                     |
                     v
                    VIEW
                     |
                     v
           SELECT * FROM VIEW
                     |
                     v
                 RESULT
```

For example:

```sql
CREATE VIEW employee_department_details AS
SELECT
    e.employee_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;
```

Then:

```sql
SELECT *
FROM employee_department_details;
```

The important idea is:

> **A VIEW is a saved SQL query that can be treated like a virtual table.**

---

# Quick Revision

| Concept | Meaning |
|---|---|
| `CREATE VIEW` | Creates a VIEW |
| `CREATE OR REPLACE VIEW` | Creates or replaces a VIEW |
| `ALTER VIEW` | Modifies a VIEW definition |
| `SELECT FROM VIEW` | Reads data through a VIEW |
| `SHOW CREATE VIEW` | Displays the VIEW definition |
| `SHOW FULL TABLES` | Can list VIEWs |
| `DROP VIEW` | Deletes a VIEW |
| `WITH CHECK OPTION` | Restricts updates that violate the VIEW condition |
| Updatable VIEW | A VIEW through which certain base-table data can be modified |
| Non-updatable VIEW | A VIEW that cannot be directly modified in the required way |
| Normal VIEW | Virtual representation based on a query |
| Temporary Table | Temporary stored result for a database session |

---

# Complete Example

Here is a complete example bringing the important concepts together.

## Step 1 — Create Departments

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);
```

---

## Step 2 — Insert Departments

```sql
INSERT INTO departments
VALUES
(1, 'IT', 'Ahmedabad'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Pune'),
(5, 'Sales', 'Bangalore');
```

---

## Step 3 — Create Employees

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2),
    city VARCHAR(100),
    joining_date DATE,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
```

---

## Step 4 — Insert Employees

```sql
INSERT INTO employees
VALUES
(101, 'Rahul Sharma', 1, 65000, 'Ahmedabad', '2022-04-10'),
(102, 'Priya Patel', 2, 55000, 'Mumbai', '2021-07-15'),
(103, 'Amit Shah', 1, 72000, 'Ahmedabad', '2020-03-20'),
(104, 'Neha Mehta', 3, 60000, 'Delhi', '2023-01-12'),
(105, 'Raj Patel', 5, 48000, 'Bangalore', '2024-06-01');
```

---

## Step 5 — Create a VIEW

```sql
CREATE VIEW employee_department_details AS
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary,
    e.city,
    d.location
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;
```

---

## Step 6 — Query the VIEW

```sql
SELECT *
FROM employee_department_details;
```

---

## Step 7 — Filter the VIEW

```sql
SELECT *
FROM employee_department_details
WHERE salary > 60000;
```

---

## Step 8 — Sort the VIEW

```sql
SELECT *
FROM employee_department_details
ORDER BY salary DESC;
```

---

## Step 9 — Department-wise Summary

```sql
SELECT
    department_name,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
FROM employee_department_details
GROUP BY department_name;
```

---

## Step 10 — See the VIEW Definition

```sql
SHOW CREATE VIEW employee_department_details;
```

---

## Step 11 — List VIEWs

```sql
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
```

---

## Step 12 — Delete the VIEW

```sql
DROP VIEW IF EXISTS employee_department_details;
```

---

# Final Summary

A MySQL VIEW is a **virtual table created from a SQL query**.

The most important things to remember are:

1. **VIEWs are based on SQL queries.**
2. **They normally do not store a separate copy of the underlying data.**
3. **They can be queried like tables.**
4. **They can contain `JOIN`, `WHERE`, `GROUP BY`, and other SQL operations.**
5. **They simplify complex queries.**
6. **They can improve data security by exposing only selected information.**
7. **Some VIEWs are updatable, but many complex VIEWs are not.**
8. **`WITH CHECK OPTION` helps control modifications through filtered VIEWs.**
9. **`SHOW CREATE VIEW` displays a VIEW's definition.**
10. **`DROP VIEW` removes a VIEW.**
11. **A VIEW does not automatically improve performance.**
12. **Indexes should generally be created on the underlying tables, not on a normal VIEW.**

## One-line Definition

> **A MySQL VIEW is a virtual table created from a saved SQL query that provides a simplified, reusable, and controlled way to access data from one or more underlying tables.**