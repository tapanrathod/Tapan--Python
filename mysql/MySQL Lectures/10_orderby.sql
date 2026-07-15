SELECT * FROM employees;

SELECT * FROM employees ORDER BY `Salary`;

SELECT * FROM employees ORDER BY `Department` ASC;
SELECT * FROM employees ORDER BY `Department` DESC;

SELECT * FROM employees ORDER BY `Department` ASC, `Salary` DESC;
SELECT * FROM employees ORDER BY `Gender` ASC, `Salary` DESC;

SELECT * FROM employees ORDER BY `Salary` DESC LIMIT 3;

-- group by department min max avg sum of top 2
