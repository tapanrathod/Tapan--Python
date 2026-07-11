/*
=> List of Core Aggregate Functions :
Function - Purpose
COUNT() - Number of rows

SUM() - Total value

AVG() - Average value

MIN() - Smallest value

MAX() - Largest value

GROUP_CONCAT() - Combine values into one string

VARIANCE() / VAR_POP() - Variance

STDDEV() / STDDEV_POP() - Standard deviation

*/

/*
===> 1️⃣ COUNT() – Row Counting :

1. Basic :
-> Counts all rows (including NULLs)

Ex. :
SELECT COUNT(*) FROM employees;

2. COUNT(column) :
-> Counts non-NULL values only

Ex. :
SELECT COUNT(email) FROM employees;

3. COUNT(DISTINCT) :
-> Counts unique values

Ex. : 
SELECT COUNT(DISTINCT department) FROM employees;

NOTE : COUNT(*)  ≠  COUNT(column)
*/

/*
===> 2️⃣ SUM() – Total Calculation :

-> Calculates the total of non-NULL numeric values
-> Works only on numeric columns
-> NULL values are ignored

1. Basic :
Ex. :
SELECT SUM(salary) FROM employees;

2. SUM with condition (using CASE) :
Ex. :
SELECT SUM(
    CASE 
        WHEN department = 'IT' THEN salary 
        ELSE 0 
    END
) AS total_it_salary
FROM employees;

3. SUM with DISTINCT :
-> Removes duplicate values before summing

Ex. :
SELECT SUM(DISTINCT salary) FROM employees;

*/

/*
===> 3️⃣ AVG() – Average Value :

-> Calculates average of non-NULL values
-> Result is always DECIMAL
-> NULL values are ignored

1. Basic :
Ex. :
SELECT AVG(salary) FROM employees;

2. AVG with condition :
Ex. :
SELECT AVG(
    CASE 
        WHEN department = 'HR' THEN salary 
        ELSE NULL 
    END
) AS avg_hr_salary
FROM employees;

3. Manual AVG (Interview concept) :
Ex. :
SELECT SUM(salary) / COUNT(salary) FROM employees;

NOTE :
AVG() ≠ SUM() / COUNT(*)

*/

/*
===> 4️⃣ MIN() – Minimum Value :

-> Returns the smallest value
-> Works on numbers, strings, and dates
-> NULL values are ignored

1. Basic :
Ex. :
SELECT MIN(salary) FROM employees;

2. MIN with DATE :
Ex. :
SELECT MIN(joining_date) FROM employees;

3. MIN with GROUP BY :
Ex. :
SELECT department, MIN(salary)
FROM employees
GROUP BY department;

*/

/*
===> 5️⃣ MAX() – Maximum Value :

-> Returns the largest value
-> Works on numbers, strings, and dates
-> NULL values are ignored

1. Basic :
Ex. :
SELECT MAX(salary) FROM employees;

2. MAX with DATE :
Ex. :
SELECT MAX(order_date) FROM orders;

3. MAX with GROUP BY :
Ex. :
SELECT department, MAX(salary)
FROM employees
GROUP BY department;

*/

/*
===> 6️⃣ GROUP_CONCAT() – Combine Multiple Rows :

-> Combines multiple row values into a single string
-> Works only with GROUP BY

1. Basic :
Ex. :
SELECT department, GROUP_CONCAT(name)
FROM employees
GROUP BY department;

2. With custom separator :
Ex. :
SELECT department,
GROUP_CONCAT(name SEPARATOR ', ')
FROM employees
GROUP BY department;

3. With ORDER BY :
Ex. :
SELECT department,
GROUP_CONCAT(name ORDER BY name ASC)
FROM employees
GROUP BY department;

4. Increase max length (important) :
Ex. :
SET SESSION group_concat_max_len = 100000;

*/

/*
===> 7️⃣ VARIANCE() / VAR_POP() – Variance :

-> Measures how far values are spread from the average
-> NULL values are ignored

1. Basic :
Ex. :
SELECT VARIANCE(salary) FROM employees;

2. Population Variance :
Ex. :
SELECT VAR_POP(salary) FROM employees;

3. Sample Variance :
Ex. :
SELECT VAR_SAMP(salary) FROM employees;

*/

/*
===> 8️⃣ STDDEV() / STDDEV_POP() – Standard Deviation :

-> Measures dispersion of values
-> Square root of variance

1. Basic :
Ex. :
SELECT STDDEV(salary) FROM employees;

2. Population Standard Deviation :
Ex. :
SELECT STDDEV_POP(salary) FROM employees;

3. Sample Standard Deviation :
Ex. :
SELECT STDDEV_SAMP(salary) FROM employees;

*/

/*
===> 9️⃣ GROUP BY – Aggregate Per Group :

-> Groups rows having same values
-> Used with aggregate functions

Ex. :
SELECT department, COUNT(*) 
FROM employees
GROUP BY department;

Multiple columns :
SELECT department, gender, AVG(salary)
FROM employees
GROUP BY department, gender;

RULE :
Every selected column must be
- Aggregated OR
- Present in GROUP BY

*/

/*
===> 🔟 HAVING – Filter Aggregated Results :

-> Used to filter groups
-> WHERE cannot be used with aggregate functions

Wrong ❌ :
WHERE COUNT(*) > 5

Correct ✅ :
Ex. :
SELECT department, COUNT(*) 
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

Difference :
WHERE → filters rows
HAVING → filters groups

*/


/*
===> 1️⃣1️⃣ Aggregate with JOIN (Real World) :

Ex. :
SELECT d.name, COUNT(e.id)
FROM departments d
LEFT JOIN employees e ON d.id = e.dept_id
GROUP BY d.name;

*/

/*
===> 1️⃣2️⃣ Aggregate with Subquery :

Ex. :
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

*/


/*
===> NULL Behavior (Very Important) :

COUNT(*)        -> Counts NULL
COUNT(column)   -> Ignores NULL
SUM()           -> Ignores NULL
AVG()           -> Ignores NULL
MIN() / MAX()   -> Ignores NULL

*/

