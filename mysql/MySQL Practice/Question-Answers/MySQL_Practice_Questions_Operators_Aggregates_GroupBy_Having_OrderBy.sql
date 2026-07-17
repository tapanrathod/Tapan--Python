-- MySQL Practice Questions

-- Topics Covered

-- Operators
-- Aggregate Functions
-- GROUP BY
-- HAVING
-- ORDER BY


-- DataBase
USE EmployeeDB;

-- ## Part A – Comparison Operators

-- 1. Display all employees whose salary is greater than 70,000.

SELECT * FROM Employees WHERE Salary > 70000;

-- 2. Display employees whose salary is less than or equal to 60,000.

SELECT * FROM Employees WHERE Salary <= 60000;

-- 3. Display employees whose age is greater than 30.

SELECT * FROM Employees WHERE Age > 30;

-- 4. Show EmployeeName and Salary of employees whose experience is at least 5 years.

SELECT EmployeeName, Salary FROM Employees WHERE Experience >= 5;

-- 5. Display employees whose salary is not equal to 65,000.

SELECT * FROM Employees WHERE Salary <> 65000;
SELECT * FROM Employees WHERE Salary != 65000;

-- 6. Display employees whose department is Finance.

SELECT * FROM Employees WHERE Department = "Finance";

-- 7. Display employees whose age is less than 28.

SELECT * FROM Employees WHERE Age < 28;

-- 8. Find employees whose salary is exactly 50,000.

SELECT * FROM Employees WHERE Salary = 50000;

-- 9. Display employees whose experience is greater than 10 years.

SELECT * FROM Employees WHERE Experience > 10;

-- 10. Display employees whose salary is less than 50,000.

SELECT * FROM Employees WHERE Salary < 50000;


-- ## Part B – Logical Operators

-- 11. Display employees whose salary is between 60,000 and 80,000 using AND.

SELECT * FROM Employees WHERE Salary >= 60000 AND Salary <= 80000;

-- 12. Find employees from the IT department whose salary is greater than 70,000.

SELECT * FROM Employees WHERE Department = "IT" AND Salary > 70000;

-- 13. Display employees who belong to HR or Sales.

SELECT * FROM Employees WHERE Department = "HR" OR Department = "Sales";

-- 14. Display employees who are not in the IT department.

SELECT * FROM Employees WHERE Department <> "IT";
SELECT * FROM Employees WHERE NOT(Department = "IT");

-- 15. Find employees whose age is greater than 30 and experience is greater than 8 years.

SELECT * FROM Employees WHERE Age > 30 AND Experience > 8;

-- 16. Display employees whose department is Marketing or Finance.

SELECT * FROM Employees WHERE Department = "Marketing" OR Department = "Finance";

-- 17. Display employees who are not from Ahmedabad.

SELECT * FROM Employees WHERE City <> "Ahmedabad";
SELECT * FROM Employees WHERE NOT(City = "Ahmedabad");

-- 18. Find employees whose salary is greater than 60,000 and city is Surat.

SELECT * FROM Employees WHERE Salary > 60000 AND City = "Surat";

-- 19. Display employees whose department is neither IT nor HR.

SELECT * FROM Employees WHERE Department <> "IT" AND Department <> "HR";
SELECT * FROM Employees WHERE NOT(Department = "IT" OR Department = "HR");

-- 20. Display employees where exactly one of the following is true: Age is below 30 OR Salary is above 70,000 (Use XOR).

SELECT * FROM Employees WHERE Age < 30 XOR Salary > 70000;


-- ## Part C – BETWEEN

-- 21. Display employees whose salary is between 50,000 and 70,000.

SELECT * FROM Employees WHERE Salary BETWEEN 50000 AND 70000;

-- 22. Display employees whose age is between 25 and 35.

SELECT * FROM Employees WHERE Age BETWEEN 25 AND 35;

-- 23. Find employees whose experience is between 5 and 10 years.

SELECT * FROM Employees WHERE Experience BETWEEN 5 AND 10;

-- 24. Display employees whose bonus is between 3,000 and 6,000.

SELECT * FROM Employees WHERE Bonus BETWEEN 3000 AND 6000;

-- 25. Find employees whose salary is not between 60,000 and 80,000.

SELECT * FROM Employees WHERE Salary NOT BETWEEN 60000 AND 80000;


-- ## Part D – IN / NOT IN

-- 26. Display employees from IT and HR departments.

SELECT * FROM Employees WHERE Department IN("IT", "HR");
SELECT * FROM Employees WHERE Department = "IT" OR Department = "HR";

-- 27. Display employees from Sales, Finance, and Marketing.

SELECT * FROM Employees WHERE Department IN("Sales", "Finance", "Marketing");
SELECT * FROM Employees WHERE Department = "Sales" OR Department = "Finance" OR Department = "Marketing";

-- 28. Display employees not working in HR or Marketing.

SELECT * FROM Employees WHERE Department NOT IN("HR", "Marketing");
SELECT * FROM Employees WHERE NOT(Department = "HR" OR Department = "Marketing");

-- 29. Find employees from Ahmedabad or Surat.

SELECT * FROM Employees WHERE City IN("Ahmedabad", "Surat");
SELECT * FROM Employees WHERE City = "Ahmedabad" OR City = "Surat";

-- 30. Display employees whose ManagerID is 101 or 104.

SELECT * FROM Employees WHERE ManagerID IN(101, 104);
SELECT * FROM Employees WHERE ManagerID = 101 OR ManagerID = 104;


-- ## Part E – LIKE

-- 31. Display employees whose names start with 'A'.

SELECT * FROM Employees WHERE EmployeeName LIKE "A%";

-- 32. Display employees whose names end with 'a'.

SELECT * FROM Employees WHERE EmployeeName LIKE "%a";

-- 33. Display employees whose names contain the letter 'h'.

SELECT * FROM Employees WHERE EmployeeName LIKE "%h%";

-- 34. Display employees whose names start with 'M'.

SELECT * FROM Employees WHERE EmployeeName LIKE "M%";

-- 35. Display employees whose names have exactly five letters.

SELECT * FROM Employees WHERE EmployeeName LIKE "_____";
SELECT * FROM Employees WHERE LENGTH(EmployeeName) = 5;

-- 36. Display employees whose names start with 'P' and contain at least six characters.

SELECT * FROM Employees WHERE EmployeeName LIKE "P______%";
SELECT * FROM Employees WHERE EmployeeName LIKE "P%_____";

-- 37. Display employees whose city starts with 'A'.

SELECT * FROM Employees WHERE City LIKE "A%";

-- 38. Display employees whose department ends with 'ing'.

SELECT * FROM Employees WHERE Department LIKE "%ing";

-- 39. Display employees whose names contain 'ra'.

SELECT * FROM Employees WHERE EmployeeName LIKE "%ra%";

-- 40. Display employees whose city contains 'kot'.

SELECT * FROM Employees WHERE City LIKE "%kot%";


-- ## Part F – NULL

-- 41. Display employees whose Bonus is NULL.

SELECT * FROM Employees WHERE Bonus IS NULL;

-- 42. Display employees whose Bonus is NOT NULL.

SELECT * FROM Employees WHERE Bonus IS NOT NULL;

-- 43. Count employees whose Bonus is NULL.

SELECT COUNT(*) FROM Employees WHERE Bonus IS NULL;

-- 44. Count employees whose Bonus is NOT NULL.

SELECT COUNT(*) FROM Employees WHERE Bonus IS NOT NULL;

-- 45. Display employee names having no bonus.

SELECT EmployeeName FROM Employees WHERE Bonus IS NULL;


-- ## Part G – COUNT()

-- 46. Count all employees.

SELECT COUNT(*) FROM Employees;

-- 47. Count employees working in Marketing.

SELECT COUNT(*) FROM Employees WHERE Department = "Marketing";

-- 48. Count female employees.

SELECT COUNT(*) FROM Employees WHERE Gender = "F";

-- 49. Count male employees.

SELECT COUNT(*) FROM Employees WHERE Gender = "M";

-- 50. Count employees earning more than 70,000.

SELECT COUNT(*) FROM Employees WHERE Salary > 70000;

-- 51. Count employees in each department.

SELECT COUNT(*) FROM Employees GROUP BY Department;

-- 52. Count employees in each city.

SELECT COUNT(*) FROM Employees GROUP BY City;

-- 53. Count employees by gender.

SELECT COUNT(*) FROM Employees GROUP BY Gender;

-- 54. Count distinct departments.

SELECT COUNT(DISTINCT Department) FROM Employees;

-- 55. Count distinct cities.

SELECT COUNT(DISTINCT City) FROM Employees;


-- ## Part H – Aggregate Functions

-- 56. Find the minimum salary.

SELECT MIN(Salary) FROM Employees;

-- 57. Find the maximum salary.

SELECT MAX(Salary) FROM Employees;

-- 58. Find the average salary.

SELECT AVG(Salary) FROM Employees;

-- 59. Find the total salary of all employees.

SELECT SUM(Salary) FROM Employees;

-- 60. Find the average bonus.

SELECT AVG(Bonus) FROM Employees;

-- 61. Find the highest bonus.

SELECT MAX(Bonus) FROM Employees;

-- 62. Find the minimum age.

SELECT MIN(Age) FROM Employees;

-- 63. Find the maximum experience.

SELECT MAX(Experience) FROM Employees;

-- 64. Find the total bonus paid.

SELECT SUM(Bonus) FROM Employees;

-- 65. Find the average experience.

SELECT AVG(Experience) FROM Employees;


-- ## Part I – GROUP BY

-- 66. Display the number of employees in each department.

SELECT COUNT(*) FROM Employees GROUP BY Department;

-- 67. Display the number of employees in each city.

SELECT COUNT(*) FROM Employees GROUP BY City;

-- 68. Find the minimum salary department-wise.

SELECT Department, MIN(Salary) FROM Employees GROUP BY Department;

-- 69. Find the maximum salary department-wise.

SELECT Department, MAX(Salary) FROM Employees GROUP BY Department;

-- 70. Find the average salary department-wise.

SELECT Department, AVG(Salary) FROM Employees GROUP BY Department;
-- 71. Find the total salary department-wise.

SELECT Department, SUM(Salary) FROM Employees GROUP BY Department;

-- 72. Display employee count by gender.

SELECT Gender, COUNT(*) FROM Employees GROUP BY Gender;

-- 73. Find the average salary for each gender.

SELECT Gender, AVG(Salary) FROM Employees GROUP BY Gender;

-- 74. Display department-wise minimum, maximum, average, sum, and count of salaries.

SELECT Department, MIN(Salary), MAX(Salary), AVG(Salary), SUM(Salary), COUNT(Salary) FROM Employees GROUP BY Department;

-- 75. Display department-wise and gender-wise salary statistics.

SELECT Department, Gender,
    MIN(Salary) as min_salary,
    MAX(Salary) as max_salary,
    AVG(Salary) as avg_salary,
    SUM(Salary) as sum_salary,
    COUNT(Salary) as count_salary
FROM Employees GROUP BY Department, Gender;

-- 76. Find total bonus department-wise.

SELECT Department, SUM(Bonus) FROM Employees GROUP BY Department;

-- 77. Find average experience department-wise.

SELECT Department, AVG(Experience) FROM Employees GROUP BY Department;

-- 78. Find maximum age in each department.

SELECT Department, MAX(Age) FROM Employees GROUP BY Department;

-- 79. Count employees in each city and department.

SELECT City, Department, COUNT(*) FROM Employees GROUP BY City, Department;

-- 80. Find total salary city-wise.

SELECT City, SUM(Salary) FROM Employees GROUP BY City;


-- ## Part J – HAVING

-- 81. Display departments whose average salary is at least 70,000.

SELECT Department, AVG(Salary) FROM Employees GROUP BY Department HAVING AVG(Salary) >= 70000;

-- 82. Display departments having more than 3 employees.

SELECT Department, COUNT(*) FROM Employees GROUP BY Department HAVING COUNT(*) > 3;

-- 83. Display departments whose total salary exceeds 2,00,000.

SELECT Department, SUM(Salary) FROM Employees GROUP BY Department HAVING SUM(Salary) > 200000;

-- 84. Find departments whose maximum salary is greater than 80,000.

SELECT Department, MAX(Salary) FROM Employees GROUP BY Department HAVING MAX(Salary) > 80000;

-- 85. Find departments whose minimum salary is below 45,000.

SELECT Department, MIN(Salary) FROM Employees GROUP BY Department HAVING MIN(Salary) < 45000;

-- 86. Display cities having more than two employees.

SELECT City, COUNT(*) FROM Employees GROUP BY City HAVING COUNT(*) > 2;

-- 87. Display genders having an average salary greater than 60,000.

SELECT Gender, AVG(Salary) FROM Employees GROUP BY Gender HAVING AVG(Salary) > 60000;

-- 88. Display departments whose employee count is exactly three.

SELECT Department, COUNT(*) FROM Employees GROUP BY Department HAVING COUNT(*) = 3;

-- 89. Display departments where total bonus is greater than 10,000.

SELECT Department, SUM(Bonus) FROM Employees GROUP BY Department HAVING SUM(Bonus) > 10000;

-- 90. Display departments whose average experience is greater than 8 years.

SELECT Department, AVG(Experience) FROM Employees GROUP BY Department HAVING AVG(Experience) > 8;


-- ## Part K – ORDER BY

-- 91. Display all employees sorted by salary in ascending order.

SELECT * FROM Employees ORDER BY Salary ASC;
SELECT * FROM Employees ORDER BY Salary;

-- 92. Display all employees sorted by salary in descending order.

SELECT * FROM Employees ORDER BY Salary DESC;

-- 93. Display employees sorted alphabetically by EmployeeName.

SELECT * FROM Employees ORDER BY EmployeeName;

-- 94. Display employees sorted by Department.

SELECT * FROM Employees ORDER BY Department;

-- 95. Display employees sorted by Department (ascending) and Salary (descending).

SELECT * FROM Employees ORDER BY Department, Salary DESC;

-- 96. Display employees sorted by Gender and Salary.

SELECT * FROM Employees ORDER BY Gender, Salary;

-- 97. Display employees sorted by Age in descending order.

SELECT * FROM Employees ORDER BY Age DESC;

-- 98. Display employees sorted by Experience in ascending order.

SELECT * FROM Employees ORDER BY Experience;

-- 99. Display employees sorted by City and EmployeeName.

SELECT * FROM Employees ORDER BY City, EmployeeName;

-- 100. Display employees sorted by Bonus in descending order.

SELECT * FROM Employees ORDER BY Bonus DESC;


-- ## Part L – ORDER BY with LIMIT

-- 101. Display the top 3 highest-paid employees.

SELECT * FROM Employees ORDER BY Salary DESC LIMIT 3;

-- 102. Display the top 5 lowest-paid employees.

SELECT * FROM Employees ORDER BY Salary ASC LIMIT 5;

-- 103. Display the highest-paid employee.

SELECT * FROM Employees ORDER BY Salary DESC LIMIT 1;

-- 104. Display the second highest-paid employee.

SELECT * FROM Employees ORDER BY Salary DESC LIMIT 1 OFFSET 1;

-- 105. Display the top 2 employees with the highest bonus.

SELECT * FROM Employees ORDER BY Bonus DESC LIMIT 2;

-- 106. Display the youngest three employees.

SELECT * FROM Employees ORDER BY Age ASC LIMIT 3;

-- 107. Display the oldest five employees.

SELECT * FROM Employees ORDER BY Age DESC LIMIT 5;

-- 108. Display the first four employees alphabetically.

SELECT * FROM Employees ORDER BY EmployeeName ASC LIMIT 4;

-- 109. Display the top three employees from the IT department based on salary.

SELECT * FROM Employees WHERE Department = "IT" ORDER BY Salary DESC LIMIT 3;

-- 110. Display the top two highest-paid employees from each department. (Challenge)

SELECT 
    EmployeeID, 
    EmployeeName, 
    Department, 
    Salary
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS salary_rank
    FROM Employees
) AS ranked_employees
WHERE salary_rank <= 2; -- AI


-- ## Challenge Questions

-- 111. Find the average salary of employees from Ahmedabad.

SELECT AVG(Salary) FROM Employees WHERE City = "Ahmedabad";

-- 112. Find the highest salary in every city.

SELECT City, MAX(Salary) FROM Employees GROUP BY City;

-- 113. Display departments having at least two employees with salary greater than 60,000.

SELECT Department, COUNT(*) FROM Employees WHERE Salary > 60000 GROUP BY Department HAVING COUNT(*) >= 2;

-- 114. Find the department with the highest average salary.

SELECT Department, AVG(Salary) as avg_salary FROM Employees GROUP BY Department ORDER BY avg_salary DESC LIMIT 1;

-- 115. Display cities ordered by total salary paid.

SELECT City, SUM(Salary) as total_salary FROM Employees GROUP BY City ORDER BY total_salary DESC;

-- 116. Find the department that has the maximum number of employees.

SELECT Department, COUNT(*) as employee_count FROM Employees GROUP BY Department ORDER BY employee_count DESC LIMIT 1;

-- 117. Display departments ordered by employee count in descending order.

SELECT Department, COUNT(*) as employee_count FROM Employees GROUP BY Department ORDER BY employee_count DESC;

-- 118. Find the top three departments based on total salary.

SELECT Department, SUM(Salary) as total_salary FROM Employees GROUP BY Department ORDER BY total_salary DESC LIMIT 3;

-- 119. Display the average salary of male and female employees separately and sort by average salary.

SELECT Gender, AVG(Salary) as avg_salary FROM Employees GROUP BY Gender ORDER BY avg_salary;

-- 120. Display department-wise salary statistics sorted by average salary in descending order.

SELECT Department, 
       MIN(Salary) as min_salary, 
       MAX(Salary) as max_salary, 
       AVG(Salary) as avg_salary, 
       SUM(Salary) as total_salary, 
       COUNT(*) as employee_count
FROM Employees
GROUP BY Department
ORDER BY avg_salary DESC;