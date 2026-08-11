# MySQL INDEX — Complete Detailed Guide

## Table of Contents

1. [What is an INDEX?](#1-what-is-an-index)
2. [Why Do We Need INDEXes?](#2-why-do-we-need-indexes)
3. [How an INDEX Works](#3-how-an-index-works)
4. [Without an INDEX](#4-without-an-index)
5. [With an INDEX](#5-with-an-index)
6. [Creating an INDEX](#6-creating-an-index)
7. [Viewing INDEXes](#7-viewing-indexes)
8. [Creating an INDEX During Table Creation](#8-creating-an-index-during-table-creation)
9. [Adding an INDEX to an Existing Table](#9-adding-an-index-to-an-existing-table)
10. [Dropping an INDEX](#10-dropping-an-index)
11. [PRIMARY KEY INDEX](#11-primary-key-index)
12. [UNIQUE INDEX](#12-unique-index)
13. [NORMAL INDEX](#13-normal-index)
14. [COMPOSITE INDEX](#14-composite-index)
15. [INDEX with WHERE](#15-index-with-where)
16. [INDEX with ORDER BY](#16-index-with-order-by)
17. [INDEX with GROUP BY](#17-index-with-group-by)
18. [INDEX with JOIN](#18-index-with-join)
19. [INDEX with LIKE](#19-index-with-like)
20. [INDEX with BETWEEN](#20-index-with-between)
21. [INDEX and NULL](#21-index-and-null)
22. [INDEX and Functions](#22-index-and-functions)
23. [Composite INDEX and Column Order](#23-composite-index-and-column-order)
24. [Leftmost Prefix Rule](#24-leftmost-prefix-rule)
25. [Covering INDEX](#25-covering-index)
26. [Clustered and Secondary INDEXes](#26-clustered-and-secondary-indexes)
27. [INDEX and EXPLAIN](#27-index-and-explain)
28. [INDEX Cardinality](#28-index-cardinality)
29. [INDEX Selectivity](#29-index-selectivity)
30. [INDEX and Storage](#30-index-and-storage)
31. [Advantages of INDEX](#31-advantages-of-index)
32. [Disadvantages of INDEX](#32-disadvantages-of-index)
33. [When Should You Create an INDEX?](#33-when-should-you-create-an-index)
34. [When Should You Avoid an INDEX?](#34-when-should-you-avoid-an-index)
35. [Real-World Example](#35-real-world-example)
36. [Complete INDEX Example](#36-complete-index-example)
37. [Best Practices](#37-best-practices)
38. [Final Summary](#38-final-summary)

---

# 1. What is an INDEX?

An **INDEX** in MySQL is a database structure used to **speed up data retrieval**.

An index works similarly to the index of a book.

Imagine you have a 1,000-page book and want to find information about:

```text
MySQL INDEX
```

Without the book's index, you may have to scan page after page.

With the book's index, you can quickly find the relevant page.

A database index works on a similar principle.

Instead of searching every row in a table, MySQL can use an index to locate the required rows more efficiently.

---

## Simple Definition

> **An INDEX is a data structure maintained by MySQL to make searching, filtering, sorting, and joining data more efficient.**

For example:

```sql
SELECT *
FROM employees
WHERE employee_id = 105;
```

If `employee_id` has an appropriate index, MySQL can locate the row much more efficiently than scanning every row.

---

# 2. Why Do We Need INDEXes?

Consider a table containing:

```text
10 rows
```

Searching 10 rows is very fast even without an index.

Now imagine a real-world database containing:

```text
10 million employees
```

Suppose you execute:

```sql
SELECT *
FROM employees
WHERE email = 'rahul@example.com';
```

Without an appropriate index, MySQL may need to examine many rows.

With an index on `email`:

```sql
CREATE INDEX idx_employee_email
ON employees(email);
```

MySQL can use the index to locate matching rows much more efficiently.

Therefore, indexes are particularly important for large tables.

---

# 3. How an INDEX Works

Suppose we have:

```sql
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(100),
    city VARCHAR(100),
    salary DECIMAL(10,2)
);
```

Suppose the table contains:

| employee_id | employee_name | city      | salary |
| ----------: | ------------- | --------- | -----: |
|         101 | Rahul Sharma  | Ahmedabad |  65000 |
|         102 | Priya Patel   | Mumbai    |  55000 |
|         103 | Amit Shah     | Ahmedabad |  72000 |
|         104 | Neha Mehta    | Delhi     |  60000 |
|         105 | Raj Patel     | Bangalore |  48000 |

Suppose we frequently execute:

```sql
SELECT *
FROM employees
WHERE employee_id = 103;
```

If `employee_id` is indexed, MySQL can use the index to find:

```text
employee_id = 103
```

instead of scanning every row unnecessarily.

Conceptually:

```text
                    INDEX
                      |
             employee_id = 103
                      |
                      v
                Matching row
                      |
                      v
               Employee data
```

---

# 4. Without an INDEX

Suppose there are 10 million rows.

Query:

```sql
SELECT *
FROM employees
WHERE email = 'rahul@example.com';
```

If `email` has no useful index, MySQL may perform a full table scan.

Conceptually:

```text
Row 1       → Check
Row 2       → Check
Row 3       → Check
Row 4       → Check
...
Row 9,999,999 → Check
Row 10,000,000 → Check
```

This can become expensive for large tables.

---

# 5. With an INDEX

Create an index:

```sql
CREATE INDEX idx_employee_email
ON employees(email);
```

Now MySQL can use the index when appropriate.

Conceptually:

```text
                INDEX
                  |
                  v
       email = 'rahul@example.com'
                  |
                  v
            Matching row
                  |
                  v
             Employee data
```

The exact execution strategy is determined by the MySQL optimizer, but the main purpose of the index is to avoid unnecessary scanning.

---

# 6. Creating an INDEX

The basic syntax is:

```sql
CREATE INDEX index_name
ON table_name(column_name);
```

Example:

```sql
CREATE INDEX idx_employee_name
ON employees(employee_name);
```

Now `employee_name` has an index named:

```text
idx_employee_name
```

---

## Multiple Indexes

A table can have multiple indexes.

For example:

```sql
CREATE INDEX idx_employee_name
ON employees(employee_name);

CREATE INDEX idx_employee_city
ON employees(city);

CREATE INDEX idx_employee_salary
ON employees(salary);
```

The table now has indexes on:

```text
employee_name
city
salary
```

However, creating indexes should be done carefully because indexes also have costs.

---

# 7. Viewing INDEXes

To see indexes on a table:

```sql
SHOW INDEX FROM employees;
```

Another option is:

```sql
SHOW CREATE TABLE employees;
```

Example:

```sql
SHOW INDEX FROM employees;
```

You may see information such as:

| Key_name          | Column_name   | Non_unique | Index_type |
| ----------------- | ------------- | ---------: | ---------- |
| PRIMARY           | employee_id   |          0 | BTREE      |
| idx_employee_name | employee_name |          1 | BTREE      |
| idx_employee_city | city          |          1 | BTREE      |

The exact output depends on the table and MySQL version.

---

# 8. Creating an INDEX During Table Creation

You can create an index while creating a table.

Example:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),

    INDEX idx_employee_name (employee_name),
    INDEX idx_employee_city (city)
);
```

Here, MySQL creates:

```text
PRIMARY KEY INDEX
idx_employee_name
idx_employee_city
```

---

# 9. Adding an INDEX to an Existing Table

Suppose the table already exists:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100)
);
```

You can add an index later:

```sql
CREATE INDEX idx_employee_email
ON employees(email);
```

You can also use:

```sql
ALTER TABLE employees
ADD INDEX idx_employee_email (email);
```

Both approaches are commonly used.

---

# 10. Dropping an INDEX

If an index is no longer needed:

```sql
DROP INDEX idx_employee_email
ON employees;
```

You can also use:

```sql
ALTER TABLE employees
DROP INDEX idx_employee_email;
```

---

# 11. PRIMARY KEY INDEX

When you create a primary key:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100)
);
```

MySQL automatically creates an index for the primary key.

Therefore:

```sql
employee_id INT PRIMARY KEY
```

already provides an index on:

```text
employee_id
```

You generally do **not** need to create another ordinary index on exactly the same primary-key column.

---

## Example

```sql
SELECT *
FROM employees
WHERE employee_id = 101;
```

The primary-key index can be used to efficiently locate the employee.

---

# 12. UNIQUE INDEX

A `UNIQUE` index ensures that duplicate values are not allowed in the indexed column or column combination.

Example:

```sql
CREATE UNIQUE INDEX idx_employee_email
ON employees(email);
```

Now two employees cannot have the same email address.

For example:

```text
rahul@example.com
priya@example.com
amit@example.com
```

are allowed.

But:

```text
rahul@example.com
rahul@example.com
```

would violate the unique constraint.

---

## UNIQUE Constraint

You can also define it during table creation:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(150) UNIQUE
);
```

MySQL creates an appropriate unique index for the `UNIQUE` constraint.

---

# 13. NORMAL INDEX

A normal index is a standard non-unique index.

Example:

```sql
CREATE INDEX idx_employee_city
ON employees(city);
```

Duplicate values are allowed.

For example:

```text
Ahmedabad
Ahmedabad
Mumbai
Delhi
Ahmedabad
```

This is perfectly valid.

A normal index is mainly used to improve lookup and related query operations.

---

# 14. COMPOSITE INDEX

A **composite index** is an index containing multiple columns.

Example:

```sql
CREATE INDEX idx_employee_city_salary
ON employees(city, salary);
```

This index contains:

```text
city
salary
```

in that order.

---

## Why Use Composite INDEXes?

Suppose you frequently execute:

```sql
SELECT *
FROM employees
WHERE city = 'Ahmedabad'
  AND salary > 60000;
```

A composite index such as:

```sql
CREATE INDEX idx_employee_city_salary
ON employees(city, salary);
```

may be useful.

The order of the columns is important.

---

# 15. INDEX with WHERE

Indexes are frequently useful with filtering conditions.

Example:

```sql
CREATE INDEX idx_employee_city
ON employees(city);
```

Query:

```sql
SELECT *
FROM employees
WHERE city = 'Ahmedabad';
```

MySQL may use the index to efficiently locate rows matching the condition.

---

## Another Example

```sql
CREATE INDEX idx_employee_salary
ON employees(salary);
```

Query:

```sql
SELECT *
FROM employees
WHERE salary > 60000;
```

An index may help MySQL find qualifying rows more efficiently.

---

# 16. INDEX with ORDER BY

Indexes can also help with sorting in appropriate situations.

Suppose:

```sql
CREATE INDEX idx_employee_salary
ON employees(salary);
```

Query:

```sql
SELECT *
FROM employees
ORDER BY salary;
```

Depending on the query and execution plan, MySQL may be able to take advantage of the index ordering.

Another example:

```sql
SELECT
    employee_name,
    salary
FROM employees
ORDER BY salary DESC;
```

An appropriate index may help avoid unnecessary sorting work.

The optimizer decides whether using the index is actually beneficial.

---

# 17. INDEX with GROUP BY

Indexes can sometimes help queries involving `GROUP BY`.

Example:

```sql
CREATE INDEX idx_employee_city
ON employees(city);
```

Query:

```sql
SELECT
    city,
    COUNT(*) AS total_employees
FROM employees
GROUP BY city;
```

An index on `city` may help depending on the query structure, data distribution, and execution plan.

You should use `EXPLAIN` to determine whether MySQL actually uses the index.

---

# 18. INDEX with JOIN

Indexes are particularly important for joins.

Suppose we have:

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
```

And:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT
);
```

Query:

```sql
SELECT
    e.employee_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;
```

An index on the join column can help.

For example:

```sql
CREATE INDEX idx_employee_department
ON employees(department_id);
```

The `departments.department_id` column is already indexed because it is the primary key.

This gives MySQL useful indexed access paths for the join.

---

# 19. INDEX with LIKE

Indexes can be useful with some `LIKE` queries.

For example:

```sql
CREATE INDEX idx_employee_name
ON employees(employee_name);
```

This query may be able to use the index:

```sql
SELECT *
FROM employees
WHERE employee_name LIKE 'Rahul%';
```

Because the pattern begins with a known prefix:

```text
Rahul
```

---

## Leading Wildcard

Consider:

```sql
SELECT *
FROM employees
WHERE employee_name LIKE '%Rahul';
```

or:

```sql
SELECT *
FROM employees
WHERE employee_name LIKE '%Rahul%';
```

A normal B-tree index generally cannot efficiently use the index to locate arbitrary substrings when the pattern starts with `%`.

This is an important distinction.

### Generally more index-friendly

```sql
LIKE 'Rahul%'
```

### Generally less index-friendly

```sql
LIKE '%Rahul%'
```

For substring searching at scale, other approaches such as FULLTEXT search may be more appropriate depending on the data and requirements.

---

# 20. INDEX with BETWEEN

Indexes can be useful for range conditions.

Example:

```sql
CREATE INDEX idx_employee_salary
ON employees(salary);
```

Query:

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 80000;
```

This is a range query.

The index can help MySQL locate the relevant range of salary values.

Another example:

```sql
SELECT *
FROM employees
WHERE joining_date
BETWEEN '2024-01-01' AND '2024-12-31';
```

An index on `joining_date` may be useful:

```sql
CREATE INDEX idx_employee_joining_date
ON employees(joining_date);
```

---

# 21. INDEX and NULL

Indexes can also contain `NULL` values.

For example:

```sql
CREATE INDEX idx_employee_city
ON employees(city);
```

If some rows contain:

```text
NULL
```

for `city`, the index can still contain those values.

A query such as:

```sql
SELECT *
FROM employees
WHERE city IS NULL;
```

may be able to use an appropriate index.

Similarly:

```sql
SELECT *
FROM employees
WHERE city IS NOT NULL;
```

may also use an index depending on the execution plan.

---

# 22. INDEX and Functions

Using functions on indexed columns can sometimes prevent MySQL from efficiently using an ordinary index.

Suppose:

```sql
CREATE INDEX idx_employee_name
ON employees(employee_name);
```

This query:

```sql
SELECT *
FROM employees
WHERE employee_name = 'Rahul Sharma';
```

is straightforward for the index.

But consider:

```sql
SELECT *
FROM employees
WHERE UPPER(employee_name) = 'RAHUL SHARMA';
```

The function:

```sql
UPPER(employee_name)
```

changes the expression MySQL needs to evaluate.

Depending on MySQL version, expression indexes, generated columns, collation, and the exact query, the optimizer may or may not be able to use an index efficiently.

For performance-sensitive queries, avoid unnecessarily applying functions to indexed columns unless you have designed an appropriate indexing strategy.

---

# 23. Composite INDEX and Column Order

Suppose you create:

```sql
CREATE INDEX idx_city_salary
ON employees(city, salary);
```

The order is:

```text
1. city
2. salary
```

This is different from:

```sql
CREATE INDEX idx_salary_city
ON employees(salary, city);
```

The order can significantly affect which queries can efficiently use the index.

---

## Example

Index:

```sql
CREATE INDEX idx_city_salary
ON employees(city, salary);
```

This is especially useful for queries such as:

```sql
SELECT *
FROM employees
WHERE city = 'Ahmedabad';
```

and:

```sql
SELECT *
FROM employees
WHERE city = 'Ahmedabad'
  AND salary > 60000;
```

It can also be useful for some ordering/grouping patterns involving the same leading column.

However, the index is not equivalent to having two independent indexes:

```text
city index
+
salary index
```

It is a single composite index with a defined column order.

---

# 24. Leftmost Prefix Rule

The **leftmost prefix rule** is one of the most important concepts for composite indexes.

Suppose you have:

```sql
CREATE INDEX idx_employee_city_salary_name
ON employees(city, salary, employee_name);
```

The index column order is:

```text
city
↓
salary
↓
employee_name
```

The index can generally be used for queries involving the leftmost part of this sequence.

### Good example

```sql
WHERE city = 'Ahmedabad'
```

Uses the first column.

### Good example

```sql
WHERE city = 'Ahmedabad'
AND salary > 60000
```

Uses the first two columns.

### Potentially useful

```sql
WHERE city = 'Ahmedabad'
AND salary > 60000
AND employee_name = 'Rahul Sharma'
```

Uses the index according to the optimizer and query structure.

### Not equivalent to starting with the second column

A query such as:

```sql
WHERE salary > 60000
```

does not generally get the same benefit from this index as a query beginning with `city`.

This is why column order matters when designing composite indexes.

---

# 25. Covering INDEX

A **covering index** is an index that contains all the columns needed by a query.

Suppose:

```sql
CREATE INDEX idx_employee_city_name
ON employees(city, employee_name);
```

Query:

```sql
SELECT
    employee_name
FROM employees
WHERE city = 'Ahmedabad';
```

The index contains both:

```text
city
employee_name
```

Therefore, MySQL may be able to satisfy the query directly from the index without needing to fetch the full table row.

This can reduce additional data access.

Whether MySQL actually performs an index-only access depends on the query and execution plan.

You can investigate this with:

```sql
EXPLAIN
SELECT
    employee_name
FROM employees
WHERE city = 'Ahmedabad';
```

---

# 26. Clustered and Secondary INDEXes

This is especially important when using the **InnoDB** storage engine, which is the default storage engine in modern MySQL.

## Clustered Index

In InnoDB, the table data is organized around the **clustered index**.

The primary key is normally the clustered index.

For example:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2)
);
```

The primary key:

```text
employee_id
```

acts as the clustered index.

The actual row data is stored with the clustered index structure.

---

## Secondary Index

Other indexes are called **secondary indexes**.

Example:

```sql
CREATE INDEX idx_employee_name
ON employees(employee_name);
```

This is a secondary index.

Conceptually:

```text
Clustered Index
    |
    +-- employee_id
    +-- employee_name
    +-- salary
    +-- other columns


Secondary Index
    |
    +-- employee_name
    +-- primary key value
```

For InnoDB, secondary index records include the primary key value, which allows MySQL to locate the complete row through the clustered index when necessary.

---

# 27. INDEX and EXPLAIN

`EXPLAIN` is extremely useful for understanding whether MySQL is using an index.

Example:

```sql
EXPLAIN
SELECT *
FROM employees
WHERE employee_id = 103;
```

MySQL provides information about the query execution plan.

You may see columns such as:

| Column            | Meaning                                 |
| ----------------- | --------------------------------------- |
| `id`            | Query identifier                        |
| `select_type`   | Type of SELECT                          |
| `table`         | Table being accessed                    |
| `type`          | Access method                           |
| `possible_keys` | Indexes MySQL considers possible        |
| `key`           | Index actually selected                 |
| `key_len`       | Length of the index portion used        |
| `ref`           | Columns/constants compared to the index |
| `rows`          | Estimated rows examined                 |
| `Extra`         | Additional execution information        |

---

## Example

```sql
EXPLAIN
SELECT *
FROM employees
WHERE email = 'rahul@example.com';
```

If an index is selected, you may see something like:

```text
possible_keys: idx_employee_email
key: idx_employee_email
```

This tells you that MySQL considered and selected that index.

---

# 28. INDEX Cardinality

**Cardinality** refers to the number of distinct values represented by an index.

Consider:

```text
employee_id
```

Suppose a table contains:

```text
1,000,000 rows
```

and every employee has a different ID.

Then the cardinality is approximately:

```text
1,000,000
```

This is high cardinality.

---

## Low Cardinality

Consider:

```text
gender
```

If a table contains one million rows but only a few distinct values, such as:

```text
Male
Female
Other
```

the cardinality is very low.

An index on a low-cardinality column may not always provide much benefit for queries that select a large portion of the table.

However, whether an index is useful depends on the actual query and data distribution.

---

# 29. INDEX Selectivity

**Selectivity** describes how effectively an index distinguishes rows.

A highly selective column has many distinct values.

For example:

```text
employee_id
email
passport_number
```

usually have high selectivity.

A column such as:

```text
gender
status
```

may have lower selectivity.

---

## Example

Suppose there are:

```text
1,000,000 employees
```

and:

```text
employee_id
```

has:

```text
1,000,000 unique values
```

Searching:

```sql
WHERE employee_id = 500001
```

can identify a very small number of rows.

This is highly selective.

Now consider:

```sql
WHERE status = 'Active'
```

If 950,000 out of 1,000,000 rows are active, the condition selects most of the table.

In that situation, the optimizer may decide that scanning the table is cheaper than using the index.

---

# 30. INDEX and Storage

Indexes improve read performance, but they require additional storage.

Suppose your table contains:

```text
100 MB of table data
```

and you create several indexes.

The total disk usage may become significantly larger.

Conceptually:

```text
Table Data
    +
Index 1
    +
Index 2
    +
Index 3
    =
More Storage
```

The exact size depends on:

- Data types
- Number of rows
- Indexed columns
- Index structure
- Column lengths
- Number of indexes

---

# 31. Advantages of INDEX

## 31.1 Faster Data Retrieval

Indexes can significantly speed up searches on large tables.

Example:

```sql
SELECT *
FROM employees
WHERE employee_id = 100001;
```

---

## 31.2 Faster Filtering

Indexes can help queries containing:

```sql
WHERE
```

conditions.

Example:

```sql
SELECT *
FROM employees
WHERE salary > 70000;
```

---

## 31.3 Faster JOIN Operations

Indexes can improve access to join columns.

Example:

```sql
JOIN departments
ON employees.department_id = departments.department_id
```

---

## 31.4 Can Help with Sorting

Indexes can sometimes reduce sorting work for:

```sql
ORDER BY
```

queries.

---

## 31.5 Can Help with Grouping

Indexes may help certain:

```sql
GROUP BY
```

operations.

---

## 31.6 Enforce Uniqueness

A unique index prevents duplicate values.

```sql
CREATE UNIQUE INDEX idx_email
ON employees(email);
```

---

# 32. Disadvantages of INDEX

Indexes are not free.

## 32.1 Additional Storage

Every index consumes disk space.

---

## 32.2 Slower INSERT Operations

When inserting a row:

```sql
INSERT INTO employees
VALUES (...);
```

MySQL may need to update every relevant index.

Therefore, having many indexes can increase insert overhead.

---

## 32.3 Slower UPDATE Operations

Suppose you update an indexed column:

```sql
UPDATE employees
SET salary = 75000
WHERE employee_id = 101;
```

If `salary` is indexed, MySQL may need to update the index entry as well.

---

## 32.4 Slower DELETE Operations

When deleting a row:

```sql
DELETE FROM employees
WHERE employee_id = 101;
```

the relevant index entries must also be removed.

---

## 32.5 Too Many INDEXes Can Be Harmful

Creating an index on every column is not good database design.

For example:

```text
employee_name
city
salary
gender
status
age
joining_date
phone
email
department
...
```

Creating separate indexes on all of these columns may:

- Increase storage
- Increase write overhead
- Make maintenance more expensive
- Give the optimizer more choices without necessarily improving performance

Indexes should be created based on actual query patterns.

---

# 33. When Should You Create an INDEX?

Indexes are commonly useful for columns frequently used in:

### `WHERE`

```sql
WHERE employee_id = 1001
```

### `JOIN`

```sql
ON employees.department_id = departments.department_id
```

### `ORDER BY`

```sql
ORDER BY salary
```

### `GROUP BY`

```sql
GROUP BY department_id
```

### `UNIQUE` requirements

```text
email
username
employee_code
```

### Frequently searched columns

For example:

```text
email
employee_id
customer_id
order_id
product_id
```

---

# 34. When Should You Avoid an INDEX?

You should be careful about creating indexes on:

## 34.1 Very Small Tables

If a table contains only:

```text
10 rows
```

an index may provide little practical benefit.

---

## 34.2 Columns Rarely Used for Searching

If a column is never used for:

```text
WHERE
JOIN
ORDER BY
GROUP BY
```

or other operations that can benefit from indexing, an index may not be useful.

---

## 34.3 Low-Selectivity Columns

For example:

```text
is_active
```

with:

```text
TRUE
FALSE
```

may not be useful as a standalone index for every workload.

---

## 34.4 Too Many Indexes

Avoid blindly indexing every column.

Instead, analyze actual queries.

---

# 35. Real-World Example

Consider an e-commerce database.

## Customers

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100)
);
```

## Orders

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(30)
);
```

Suppose the application frequently runs:

```sql
SELECT *
FROM orders
WHERE customer_id = 101;
```

Create:

```sql
CREATE INDEX idx_orders_customer_id
ON orders(customer_id);
```

---

## Search Orders by Date

If the application frequently runs:

```sql
SELECT *
FROM orders
WHERE order_date >= '2026-01-01';
```

You might create:

```sql
CREATE INDEX idx_orders_order_date
ON orders(order_date);
```

---

## Search by Customer and Date

Suppose the common query is:

```sql
SELECT *
FROM orders
WHERE customer_id = 101
  AND order_date >= '2026-01-01';
```

A composite index could be useful:

```sql
CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date);
```

This is often preferable to automatically creating two separate indexes when this exact query pattern is common.

---

# 36. Complete INDEX Example

Let's create a complete employee database example.

## Step 1 — Create Table

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(150),
    department_id INT,
    city VARCHAR(100),
    salary DECIMAL(10,2),
    joining_date DATE
);
```

---

## Step 2 — Create an Email INDEX

```sql
CREATE UNIQUE INDEX idx_employee_email
ON employees(email);
```

This provides uniqueness and indexing for email.

---

## Step 3 — Create City INDEX

```sql
CREATE INDEX idx_employee_city
ON employees(city);
```

---

## Step 4 — Create Salary INDEX

```sql
CREATE INDEX idx_employee_salary
ON employees(salary);
```

---

## Step 5 — Create Department INDEX

```sql
CREATE INDEX idx_employee_department
ON employees(department_id);
```

---

## Step 6 — Create Composite INDEX

Suppose employees are frequently searched by:

```text
department
+
salary
```

Create:

```sql
CREATE INDEX idx_department_salary
ON employees(department_id, salary);
```

---

## Step 7 — Search Using INDEXed Columns

```sql
SELECT *
FROM employees
WHERE city = 'Ahmedabad';
```

---

```sql
SELECT *
FROM employees
WHERE salary > 60000;
```

---

```sql
SELECT *
FROM employees
WHERE department_id = 1;
```

---

```sql
SELECT *
FROM employees
WHERE department_id = 1
  AND salary > 60000;
```

---

## Step 8 — Check Query Plan

```sql
EXPLAIN
SELECT *
FROM employees
WHERE department_id = 1
  AND salary > 60000;
```

Use the execution plan to verify whether MySQL chooses the expected index.

---

## Step 9 — View All Indexes

```sql
SHOW INDEX FROM employees;
```

---

## Step 10 — Remove an Index

```sql
DROP INDEX idx_employee_salary
ON employees;
```

---

# 37. Best Practices

## 37.1 Index Based on Real Queries

Do not create indexes randomly.

Look at the queries your application actually runs.

---

## 37.2 Index Important Search Columns

For example:

```text
employee_id
customer_id
order_id
email
product_id
```

when they are frequently used for lookups.

---

## 37.3 Index JOIN Columns

For example:

```sql
ON employees.department_id = departments.department_id
```

An index on the relevant foreign-key side can be important.

---

## 37.4 Think Carefully About Composite Index Order

For:

```sql
INDEX (department_id, salary)
```

the order matters.

Design the column order based on common query patterns.

---

## 37.5 Don't Create Too Many Indexes

Every index has a cost.

Remember:

```text
More Indexes
     ↓
More Storage
     ↓
More INSERT/UPDATE/DELETE Work
```

---

## 37.6 Use EXPLAIN

Before and after adding an index, examine the query plan:

```sql
EXPLAIN
SELECT *
FROM employees
WHERE salary > 60000;
```

This helps you understand whether the optimizer is using the index.

---

## 37.7 Consider Data Distribution

An index is not automatically beneficial simply because a column appears in a `WHERE` clause.

The optimizer considers factors such as:

- Number of rows
- Selectivity
- Cardinality
- Available indexes
- Estimated cost
- Query structure

---

# 38. Final Summary

An **INDEX** is a database structure that helps MySQL find and access data more efficiently.

The simplest way to understand it is:

```text
Without INDEX
      |
      v
Search many rows
      |
      v
Potentially slower on large tables
```

With an appropriate index:

```text
Query
  |
  v
INDEX
  |
  v
Locate matching rows
  |
  v
Retrieve required data
```

The most important concepts are:

- An index is used primarily to improve data access.
- `PRIMARY KEY` automatically has an index.
- `UNIQUE` constraints use unique indexes.
- A normal index allows duplicate values.
- A composite index contains multiple columns.
- Column order matters in a composite index.
- The leftmost prefix rule is important for composite indexes.
- Indexes can help `WHERE`, `JOIN`, `ORDER BY`, and some `GROUP BY` queries.
- Indexes can help range conditions such as `BETWEEN`.
- Some `LIKE` patterns can use indexes, while leading wildcards generally prevent efficient use of a normal B-tree index.
- InnoDB uses a clustered index for the primary key and secondary indexes for other indexed access paths.
- `EXPLAIN` helps determine how MySQL plans to execute a query.
- High-cardinality columns are often good candidates for indexes.
- Indexes require additional storage.
- Too many indexes can slow down `INSERT`, `UPDATE`, and `DELETE`.
- Indexes should be designed according to actual query patterns.
- An index does **not** guarantee that MySQL will use it; the optimizer chooses the execution plan it estimates to be cheapest.

## One-Line Definition

> **A MySQL INDEX is a data structure that helps the database locate, filter, join, and sometimes sort data more efficiently without scanning every row of a table.**
