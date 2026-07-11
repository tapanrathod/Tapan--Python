/****************************************************************************************
                            SQL JOINS – WITH RESULTS (MySQL)
****************************************************************************************/

/*
JOIN = combine rows from two or more tables
based on related columns.
*/


/*==============================================================================
                            SAMPLE TABLE DATA
==============================================================================*/

/*
TABLE: departments

id | dept_name
----------------
1  | IT
2  | HR
3  | Sales


TABLE: employees

id | name  | dept_id | manager_id
----------------------------------
1  | Amit  | 1       | NULL
2  | Ravi  | 2       | 1
3  | Neha  | NULL    | 1
*/


/*==============================================================================
                            1. INNER JOIN
==============================================================================*/

/*
Query :
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.id;

Logic :
-> Returns only matching rows from both tables
-> dept_id must exist in both tables

Result :
name | dept_name
----------------
Amit | IT
Ravi | HR

(Remember: INNER JOIN = COMMON DATA)
*/


/*==============================================================================
                            2. LEFT JOIN
==============================================================================*/

/*
Query :
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.id;

Logic :
-> All rows from LEFT table (employees)
-> Matching rows from RIGHT table
-> No match → NULL

Result :
name | dept_name
----------------
Amit | IT
Ravi | HR
Neha | NULL

(Remember: LEFT JOIN = ALL LEFT)
*/


/*==============================================================================
                            3. RIGHT JOIN
==============================================================================*/

/*
Query :
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.id;

Logic :
-> All rows from RIGHT table (departments)
-> Matching rows from LEFT table
-> No match → NULL

Result :
name | dept_name
----------------
Amit | IT
Ravi | HR
NULL | Sales

(Remember: RIGHT JOIN = ALL RIGHT)
*/


/*==============================================================================
                            4. FULL OUTER JOIN
==============================================================================*/

/*
MySQL does NOT support FULL JOIN directly
We simulate using UNION

Query :
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.id

UNION

SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.id;

Logic :
-> All rows from BOTH tables
-> Matched + Unmatched

Result :
name | dept_name
----------------
Amit | IT
Ravi | HR
Neha | NULL
NULL | Sales

(Remember: FULL JOIN = LEFT + RIGHT)
*/


/*==============================================================================
                            5. CROSS JOIN
==============================================================================*/

/*
Query :
SELECT e.name, d.dept_name
FROM employees e
CROSS JOIN departments d;

Logic :
-> Cartesian Product
-> Each employee joins with every department

Result :
name | dept_name
----------------
Amit | IT
Amit | HR
Amit | Sales
Ravi | IT
Ravi | HR
Ravi | Sales
Neha | IT
Neha | HR
Neha | Sales

Rows = employees (3) × departments (3) = 9

(Remember: CROSS JOIN = ALL COMBINATIONS)
*/


/*==============================================================================
                            6. SELF JOIN
==============================================================================*/

/*
Purpose :
-> Join table with itself
-> Used for hierarchy (manager-employee)

Query :
SELECT e1.name AS employee,
       e2.name AS manager
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.id;

Logic :
-> e1.manager_id points to e2.id

Result :
employee | manager
-------------------
Amit     | NULL
Ravi     | Amit
Neha     | Amit

(Remember: SELF JOIN = SAME TABLE)
*/


/*==============================================================================
                            7. JOIN with WHERE
==============================================================================*/

/*
Query :
SELECT e.name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.id
WHERE d.dept_name = 'IT';

Logic :
-> Join first
-> Then filter rows

Result :
name | dept_name
----------------
Amit | IT
*/


/*==============================================================================
                        8. JOIN with AGGREGATE
==============================================================================*/

/*
Query :
SELECT d.dept_name, COUNT(e.id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.id = e.dept_id
GROUP BY d.dept_name;

Logic :
-> Count employees per department
-> LEFT JOIN keeps all departments

Result :
dept_name | total_employees
----------------------------
IT        | 1
HR        | 1
Sales     | 0
*/


/*==============================================================================
                        9. JOIN MULTIPLE TABLES
==============================================================================*/

/*
Example Structure :
orders → customers → cities

Query :
SELECT o.order_id, c.name, ci.city_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN cities ci ON c.city_id = ci.id;

Result (Example) :
order_id | name  | city_name
----------------------------
101      | Amit  | Delhi
102      | Ravi  | Mumbai

(Remember: JOIN can chain multiple tables)
*/


/*==============================================================================
                        10. JOIN vs SUBQUERY
==============================================================================*/

/*
JOIN :
SELECT e.name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.id;

Result :
Amit | IT
Ravi | HR

Subquery :
SELECT name,
(SELECT dept_name FROM departments WHERE id = e.dept_id)
FROM employees e;

Result :
Amit | IT
Ravi | HR
Neha | NULL

(Remember: JOIN = faster + readable)
*/


/*==============================================================================
                        11. ON vs WHERE (VERY IMPORTANT)
==============================================================================*/

/*
LEFT JOIN example :

❌ Wrong :
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.id
WHERE d.dept_name = 'IT';

Result :
Amit | IT

(LEFT JOIN becomes INNER JOIN)

✅ Correct :
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.id AND d.dept_name = 'IT';

Result :
Amit | IT
Ravi | NULL
Neha | NULL
*/


/*==============================================================================
                        12. JOIN TYPES MEMORY MAP
==============================================================================*/

/*
INNER JOIN  -> common rows only
LEFT JOIN   -> all left
RIGHT JOIN  -> all right
FULL JOIN   -> left + right
CROSS JOIN  -> combinations
SELF JOIN   -> same table
*/


/*==============================================================================
                        QUICK REMEMBER RESULTS
==============================================================================*/

/*
INNER  -> matched only
LEFT   -> left + NULL
RIGHT  -> right + NULL
FULL   -> everything
CROSS  -> multiplication
SELF   -> hierarchy
*/
