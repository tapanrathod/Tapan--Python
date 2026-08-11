# MySQL Subqueries - Complete Guide

## What is a Subquery?

A **subquery** (also called an **inner query** or **nested query**) is a SQL query written inside another SQL query.

The **inner query executes first**, and its result is passed to the **outer query**.

## Basic Syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name operator (
    SELECT column_name
    FROM another_table
);
```

## Why Use Subqueries?

- Filter data based on another query.
- Compare values with AVG(), MAX(), MIN(), etc.
- Avoid hardcoding values.
- Simplify complex queries.
- Can replace temporary tables in many situations.

## Sample Database

### Employees

| EmpID | Name  | DepartmentID | Salary |
| ----: | ----- | -----------: | -----: |
|     1 | John  |            1 |  50000 |
|     2 | David |            2 |  65000 |
|     3 | Alice |            1 |  55000 |
|     4 | Emma  |            3 |  80000 |
|     5 | Chris |            2 |  70000 |

### Departments

| DepartmentID | DepartmentName |
| -----------: | -------------- |
|            1 | HR             |
|            2 | IT             |
|            3 | Finance        |

---

# Types of Subqueries

## 1. Single Row Subquery

Returns exactly one row.

```sql
SELECT *
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);
```

The inner query returns one value (average salary), which the outer query uses for comparison.

---

## 2. Multiple Row Subquery

Returns multiple rows.

Common operators:

- IN
- ANY
- ALL
- EXISTS

```sql
SELECT *
FROM Employees
WHERE DepartmentID IN
(
    SELECT DepartmentID
    FROM Departments
    WHERE DepartmentName IN ('HR','IT')
);
```

---

## 3. Multiple Column Subquery

Returns more than one column.

```sql
SELECT *
FROM Employees
WHERE (DepartmentID, Salary) IN
(
    SELECT DepartmentID, MAX(Salary)
    FROM Employees
    GROUP BY DepartmentID
);
```

---

## 4. Correlated Subquery

References the outer query.

```sql
SELECT Name, Salary, DepartmentID
FROM Employees e1
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees e2
    WHERE e1.DepartmentID = e2.DepartmentID
);
```

The subquery executes once for each row of the outer query.

---

## 5. Scalar Subquery

Returns exactly one value.

```sql
SELECT
    Name,
    Salary,
    (
        SELECT AVG(Salary)
        FROM Employees
    ) AS AverageSalary
FROM Employees;
```

---

# Subquery in SELECT

```sql
SELECT Name,
       Salary,
       (
           SELECT MAX(Salary)
           FROM Employees
       ) AS HighestSalary
FROM Employees;
```

# Subquery in WHERE

```sql
SELECT *
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);
```

# Subquery in FROM

```sql
SELECT *
FROM
(
    SELECT DepartmentID,
           AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) AS DeptSalary;
```

# Subquery in HAVING

```sql
SELECT DepartmentID,
       AVG(Salary)
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) >
(
    SELECT AVG(Salary)
    FROM Employees
);
```

# EXISTS

```sql
SELECT *
FROM Departments d
WHERE EXISTS
(
    SELECT *
    FROM Employees e
    WHERE e.DepartmentID = d.DepartmentID
);
```

# NOT EXISTS

```sql
SELECT *
FROM Departments d
WHERE NOT EXISTS
(
    SELECT *
    FROM Employees e
    WHERE e.DepartmentID = d.DepartmentID
);
```

# ANY

```sql
SELECT *
FROM Employees
WHERE Salary > ANY
(
    SELECT Salary
    FROM Employees
    WHERE DepartmentID = 1
);
```

# ALL

```sql
SELECT *
FROM Employees
WHERE Salary > ALL
(
    SELECT Salary
    FROM Employees
    WHERE DepartmentID = 1
);
```

# IN

```sql
SELECT *
FROM Employees
WHERE DepartmentID IN
(
    SELECT DepartmentID
    FROM Departments
    WHERE DepartmentName = 'IT'
);
```

# NOT IN

```sql
SELECT *
FROM Employees
WHERE DepartmentID NOT IN
(
    SELECT DepartmentID
    FROM Departments
    WHERE DepartmentName = 'Finance'
);
```

> **Note:** `NOT IN` may behave unexpectedly if the subquery returns `NULL`. Use `NOT EXISTS` when appropriate.

# Advantages

- Easy to understand
- Reduces hardcoding
- Useful with aggregate functions
- Can be used in SELECT, FROM, WHERE, and HAVING
- Helps simplify filtering logic

# Disadvantages

- Correlated subqueries can be slow.
- Nested queries may be harder to maintain.
- JOINs or CTEs may perform better for complex reports.

# JOIN vs Subquery

### Subquery

```sql
SELECT Name
FROM Employees
WHERE DepartmentID =
(
    SELECT DepartmentID
    FROM Departments
    WHERE DepartmentName='IT'
);
```

### JOIN

```sql
SELECT e.Name
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName='IT';
```

## When to Use

| Situation                         | Recommended         |
| --------------------------------- | ------------------- |
| Filtering by a derived value      | Subquery            |
| Need columns from multiple tables | JOIN                |
| Large datasets                    | JOIN (often faster) |
| Simple aggregate comparison       | Subquery            |

# Best Practices

1. Use aliases for readability.
2. Avoid unnecessary nested subqueries.
3. Prefer EXISTS over IN for very large datasets in many cases.
4. Index columns used in joins and filtering.
5. Use JOINs or CTEs if they make the query clearer.

# Interview Questions

1. What is a subquery?
2. What is a correlated subquery?
3. Difference between IN and EXISTS?
4. Difference between ANY and ALL?
5. Can subqueries be used in UPDATE and DELETE?
6. Which executes first: inner or outer query?
7. When should you use JOIN instead of a subquery?

# Summary

| Type            | Returns                | Operators                           |
| --------------- | ---------------------- | ----------------------------------- |
| Single-row      | One row                | =, >, <, >=, <=                     |
| Multiple-row    | Many rows              | IN, ANY, ALL, EXISTS                |
| Multiple-column | Multiple columns       | Tuple comparison                    |
| Correlated      | Depends on outer query | Varies                              |
| Scalar          | Single value           | Anywhere a single value is expected |

## Conclusion

Subqueries are one of the most powerful features of MySQL. They allow you to write dynamic, flexible, and readable SQL by nesting one query inside another. Mastering single-row, multiple-row, correlated, scalar, and multi-column subqueries will help you solve real-world database problems and perform well in SQL interviews.
