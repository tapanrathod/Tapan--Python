/****************************************************************************************
                        SQL SUBQUERIES – COMPLETE NOTES WITH RESULTS
****************************************************************************************/

/*
SUBQUERY = a query inside another query
Also called NESTED QUERY or INNER QUERY

Types of Subqueries :
1. Single-row subquery
2. Multiple-row subquery
3. Multiple-column subquery
4. Correlated subquery
5. Subquery with IN / ANY / ALL
6. Subquery with EXISTS / NOT EXISTS
7. Subquery in SELECT
8. Subquery in FROM (Derived Table)
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

id | name  | salary | dept_id
--------------------------------
1  | Amit  | 60000  | 1
2  | Ravi  | 45000  | 2
3  | Neha  | 30000  | 1
4  | Kiran | 25000  | NULL
*/


/*==============================================================================
                    1. SINGLE-ROW SUBQUERY
==============================================================================*/

/*
-> Returns ONLY ONE value
-> Used with =, >, <, >=, <=

Query :
Find employee(s) with maximum salary
*/

 /*
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
*/

/*
Subquery Result :
MAX(salary) = 60000

Final Result :
id | name | salary | dept_id
-----------------------------
1  | Amit | 60000  | 1
*/


/*==============================================================================
                    2. MULTI-ROW SUBQUERY (IN)
==============================================================================*/

/*
-> Returns multiple values
-> Used with IN

Query :
Find employees working in IT department
*/

 /*
SELECT *
FROM employees
WHERE dept_id IN (
    SELECT id FROM departments WHERE dept_name = 'IT'
);
*/

/*
Subquery Result :
id
---
1

Final Result :
id | name | salary | dept_id
-----------------------------
1  | Amit | 60000  | 1
3  | Neha | 30000  | 1
*/


/*==============================================================================
                    3. SUBQUERY with NOT IN
==============================================================================*/

/*
Query :
Find employees NOT working in any department
*/

 /*
SELECT *
FROM employees
WHERE dept_id NOT IN (SELECT id FROM departments);
*/

/*
Final Result :
id | name  | salary | dept_id
--------------------------------
4  | Kiran | 25000  | NULL

⚠ NOT IN with NULL can be dangerous
*/


/*==============================================================================
                    4. SUBQUERY with ANY
==============================================================================*/

/*
ANY → condition true for AT LEAST ONE value

Query :
Find employees earning more than ANY HR employee
*/

 /*
SELECT *
FROM employees
WHERE salary > ANY (
    SELECT salary FROM employees WHERE dept_id = 2
);
*/

/*
Subquery Result (HR salaries) :
45000

Final Result :
id | name | salary
-------------------
1  | Amit | 60000
*/


/*==============================================================================
                    5. SUBQUERY with ALL
==============================================================================*/

/*
ALL → condition true for ALL values

Query :
Find employees earning more than ALL HR employees
*/

 /*
SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary FROM employees WHERE dept_id = 2
);
*/

/*
Subquery Result :
45000

Final Result :
id | name | salary
-------------------
1  | Amit | 60000
*/


/*==============================================================================
                    6. CORRELATED SUBQUERY
==============================================================================*/

/*
-> Subquery depends on outer query
-> Executed for EACH ROW

Query :
Find employees earning more than
the average salary of their department
*/

 /*
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);
*/

/*
Explanation :
Each employee compares salary
with average of their own department

Final Result :
id | name | salary | dept_id
--------------------------------
1  | Amit | 60000  | 1
*/


/*==============================================================================
                    7. EXISTS SUBQUERY
==============================================================================*/

/*
EXISTS → returns TRUE if subquery returns rows

Query :
Find departments having employees
*/

 /*
SELECT *
FROM departments d
WHERE EXISTS (
    SELECT 1 FROM employees e
    WHERE e.dept_id = d.id
);
*/

/*
Final Result :
id | dept_name
---------------
1  | IT
2  | HR
*/


/*==============================================================================
                    8. NOT EXISTS SUBQUERY
==============================================================================*/

/*
Query :
Find departments WITHOUT employees
*/

 /*
SELECT *
FROM departments d
WHERE NOT EXISTS (
    SELECT 1 FROM employees e
    WHERE e.dept_id = d.id
);
*/

/*
Final Result :
id | dept_name
---------------
3  | Sales
*/


/*==============================================================================
                    9. SUBQUERY in SELECT
==============================================================================*/

/*
-> Returns a scalar value per row

Query :
Show employee name and department name
*/

 /*
SELECT name,
(SELECT dept_name FROM departments WHERE id = e.dept_id) AS department
FROM employees e;
*/

/*
Final Result :
name  | department
-------------------
Amit  | IT
Ravi | HR
Neha | IT
Kiran| NULL
*/


/*==============================================================================
                    10. SUBQUERY in FROM (DERIVED TABLE)
==============================================================================*/

/*
-> Subquery acts as a temporary table

Query :
Find employees whose salary is above average
*/

 /*
SELECT *
FROM (
    SELECT * FROM employees
    WHERE salary > (SELECT AVG(salary) FROM employees)
) AS high_salary_employees;
*/

/*
Average salary = 40000

Final Result :
id | name | salary | dept_id
-----------------------------
1  | Amit | 60000  | 1
2  | Ravi | 45000  | 2
*/


/*==============================================================================
                    11. SUBQUERY vs JOIN
==============================================================================*/

/*
Subquery :
SELECT *
FROM employees
WHERE dept_id IN (
    SELECT id FROM departments WHERE dept_name = 'IT'
);

JOIN :
SELECT e.*
FROM employees e
JOIN departments d
ON e.dept_id = d.id
WHERE d.dept_name = 'IT';

Result (same) :
Amit
Neha

JOIN is usually faster and preferred
*/


/*==============================================================================
                    12. COMMON MISTAKES
==============================================================================*/

/*
❌ Using = with multi-row subquery
❌ Using NOT IN with NULL
❌ Forgetting correlation condition
❌ Poor performance for large tables
*/


/*==============================================================================
                    13. INTERVIEW MEMORY MAP
==============================================================================*/

/*
=       -> single-row subquery
IN      -> multi-row subquery
ANY     -> at least one
ALL     -> all values
EXISTS  -> row existence check
SELECT  -> scalar subquery
FROM    -> derived table
*/


/*==============================================================================
                    QUICK RESULT MEMORY
==============================================================================*/

/*
MAX salary        -> Amit
IT employees      -> Amit, Neha
No department     -> Kiran
Dept with staff   -> IT, HR
Dept without staff-> Sales
*/
