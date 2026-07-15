-- Active: 1782301937005@@127.0.0.1@3306@group_aggregate

SELECT * FROM employees;

SELECT COUNT(*) as NumberOfRows, `Department`
FROM employees
GROUP BY
    Department;

SELECT COUNT(*) as NumberOfRows, `gender`
FROM employees
GROUP BY
    gender;


SELECT
    `Department`,
    MIN(salary) as min_salary,
    MAX(salary) as max_salary,
    AVG(salary) as avg_salary,
    SUM(salary) as sum_salary,
    COUNT(salary) as count_rows
FROM employees
GROUP BY
    `Department`;

SELECT
    `Department`,
    `Gender`,
    MIN(salary) as min_salary,
    MAX(salary) as max_salary,
    AVG(salary) as avg_salary,
    SUM(salary) as sum_salary,
    COUNT(salary) as count_rows
FROM employees
GROUP BY
    `gender`,
    department;


-- having clause

SELECT
    `Department`,
    MIN(salary) as min_salary,
    MAX(salary) as max_salary,
    AVG(salary) as avg_salary,
    SUM(salary) as sum_salary,
    COUNT(salary) as count_rows
FROM employees
GROUP BY
    `Department`
HAVING avg_salary >= 70000;

SELECT
    `Department`,
    MIN(salary) as min_salary,
    MAX(salary) as max_salary,
    AVG(salary) as avg_salary,
    SUM(salary) as sum_salary,
    COUNT(salary) as count_rows
FROM employees
WHERE `Salary` >= 70000
GROUP BY
    `Department`
HAVING avg_salary >= 70000;

