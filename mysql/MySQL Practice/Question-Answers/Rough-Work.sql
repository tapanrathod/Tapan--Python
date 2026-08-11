-- Active: 1782301937005@@127.0.0.1@3306@joins_db
select * from customers;
select * from orders;
select * from locations;
select * from departments;
select * from employees;
SELECT * FROM employee_self; -- Manager ID


SELECT e1.first_name,
       e1.last_name,
       MAX()
FROM employees e1
LEFT JOIN employees e2 ON e1.employee_id = e2.employee_id
AND e1.salary < e2.salary;


SELECT d.department_name,
       e1.first_name,
       e1.last_name,
       e1.salary
FROM employees e1
JOIN departments d
    ON e1.department_id = d.department_id
LEFT JOIN employees e2
    ON e1.department_id = e2.department_id
   AND e1.salary < e2.salary
WHERE e2.employee_id IS NULL;