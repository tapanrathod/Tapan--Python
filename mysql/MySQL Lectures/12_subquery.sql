-- Active: 1782301937005@@127.0.0.1@3306@subquery_db
CREATE DATABASE subquery_db;

USE subquery_db;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID)
);

INSERT INTO
    Departments (DepartmentID, DepartmentName)
VALUES (1, 'Human Resources'),
    (2, 'Information Technology'),
    (3, 'Finance'),
    (4, 'Sales'),
    (5, 'Marketing'),
    (6, 'Operations'),
    (7, 'Research & Development');

INSERT INTO
    Employees (
        EmployeeID,
        EmployeeName,
        DepartmentID,
        Salary,
        HireDate
    )
VALUES (
        51,
        'Ankit Sharma',
        1,
        48000,
        '2021-01-15'
    ),
    (
        52,
        'Rohit Patel',
        2,
        62000,
        '2020-03-22'
    ),
    (
        53,
        'Sandeep Verma',
        3,
        57000,
        '2019-07-18'
    ),
    (
        54,
        'Vikas Singh',
        4,
        51000,
        '2022-05-10'
    ),
    (
        55,
        'Nitin Mehta',
        5,
        54000,
        '2021-09-14'
    ),
    (
        56,
        'Ajay Kumar',
        6,
        46000,
        '2023-02-11'
    ),
    (
        57,
        'Manoj Shah',
        7,
        72000,
        '2018-12-01'
    ),
    (
        58,
        'Pankaj Joshi',
        2,
        68000,
        '2020-06-19'
    ),
    (
        59,
        'Deepak Patel',
        3,
        59000,
        '2021-08-25'
    ),
    (
        60,
        'Kunal Desai',
        1,
        53000,
        '2022-10-07'
    ),
    (
        61,
        'Harsh Patel',
        2,
        75000,
        '2019-04-15'
    ),
    (
        62,
        'Jignesh Shah',
        5,
        61000,
        '2020-11-28'
    ),
    (
        63,
        'Bhavesh Parmar',
        4,
        56000,
        '2021-03-16'
    ),
    (
        64,
        'Tushar Mehta',
        6,
        49000,
        '2022-07-30'
    ),
    (
        65,
        'Parth Patel',
        7,
        81000,
        '2018-09-21'
    ),
    (
        66,
        'Dhruv Shah',
        2,
        70000,
        '2019-01-09'
    ),
    (
        67,
        'Mehul Patel',
        3,
        64000,
        '2020-02-27'
    ),
    (
        68,
        'Hitesh Solanki',
        4,
        52000,
        '2021-05-12'
    ),
    (
        69,
        'Hardik Trivedi',
        5,
        58000,
        '2022-06-18'
    ),
    (
        70,
        'Yash Chauhan',
        1,
        50000,
        '2023-01-08'
    ),
    (
        71,
        'Dev Patel',
        2,
        76000,
        '2019-08-24'
    ),
    (
        72,
        'Krunal Shah',
        3,
        67000,
        '2020-10-11'
    ),
    (
        73,
        'Vishal Mehta',
        6,
        55000,
        '2021-11-05'
    ),
    (
        74,
        'Gaurav Sharma',
        7,
        83000,
        '2018-03-29'
    ),
    (
        75,
        'Rakesh Kumar',
        4,
        51000,
        '2022-04-13'
    ),
    (
        76,
        'Sanjay Patel',
        5,
        59000,
        '2021-07-20'
    ),
    (
        77,
        'Mukesh Shah',
        1,
        47000,
        '2023-03-15'
    ),
    (
        78,
        'Ashish Verma',
        2,
        69000,
        '2020-09-26'
    ),
    (
        79,
        'Prakash Singh',
        3,
        62000,
        '2019-06-04'
    ),
    (
        80,
        'Nilesh Patel',
        6,
        54000,
        '2022-08-09'
    ),
    (
        81,
        'Ravi Mehta',
        7,
        79000,
        '2018-11-17'
    ),
    (
        82,
        'Amit Shah',
        4,
        56000,
        '2021-12-01'
    ),
    (
        83,
        'Sachin Patel',
        2,
        72000,
        '2020-01-14'
    ),
    (
        84,
        'Hemant Joshi',
        3,
        61000,
        '2019-05-22'
    ),
    (
        85,
        'Chirag Shah',
        5,
        58000,
        '2022-02-10'
    ),
    (
        86,
        'Nirav Patel',
        1,
        49000,
        '2023-06-08'
    ),
    (
        87,
        'Kishan Parmar',
        6,
        53000,
        '2021-10-27'
    ),
    (
        88,
        'Alpesh Mehta',
        7,
        85000,
        '2018-07-19'
    ),
    (
        89,
        'Raj Patel',
        2,
        71000,
        '2020-04-16'
    ),
    (
        90,
        'Mayur Shah',
        3,
        63000,
        '2019-09-30'
    ),
    (
        91,
        'Anil Kumar',
        4,
        52000,
        '2022-03-07'
    ),
    (
        92,
        'Sunil Sharma',
        5,
        60000,
        '2021-06-11'
    ),
    (
        93,
        'Mahesh Patel',
        1,
        48000,
        '2023-04-22'
    ),
    (
        94,
        'Ketan Shah',
        6,
        56000,
        '2022-01-18'
    ),
    (
        95,
        'Jay Patel',
        2,
        74000,
        '2019-02-26'
    ),
    (
        96,
        'Rohan Trivedi',
        3,
        66000,
        '2020-08-05'
    ),
    (
        97,
        'Akshay Mehta',
        7,
        82000,
        '2018-10-12'
    ),
    (
        98,
        'Rahul Desai',
        4,
        55000,
        '2021-09-09'
    ),
    (
        99,
        'Milan Patel',
        5,
        59000,
        '2022-12-14'
    ),
    (
        100,
        'Chetan Shah',
        2,
        78000,
        '2019-11-03'
    );

SELECT * FROM employees;

SELECT * FROM departments;

SELECT MAX(e.`Salary`), d.`DepartmentName`
FROM employees e
    JOIN departments d ON e.DepartmentID = d.DepartmentID
GROUP BY
    d.`DepartmentName`

SELECT MAX(`Salary`), `DepartmentID`
FROM employees
GROUP BY
    `DepartmentID`;

SELECT *
FROM employees
WHERE (`DepartmentID`, `Salary`) IN (
        SELECT `DepartmentID`, MAX(`Salary`)
        FROM employees
        GROUP BY
            `DepartmentID`
    )
ORDER BY `Salary`

SELECT *
FROM employees
WHERE
    `Salary` >= (
        SELECT MAX(salary)
        FROM employees
    );

SELECT MAX(salary) FROM employees;

SELECT MAX(salary) as max_s, `DepartmentID`
FROM employees
GROUP BY
    `DepartmentID`
ORDER BY max_s DESC
LIMIT 1;

SELECT MAX(max_salary), `DepartmentID`
FROM (
        SELECT MAX(salary) as max_salary, `DepartmentID`
        FROM employees
        GROUP BY
            `DepartmentID`
    ) max_salaries
GROUP BY
    `DepartmentID`;







SELECT
    `EmployeeName`,
    Salary,
    (
        SELECT AVG(Salary)
        FROM Employees
    ) AS AverageSalary
FROM Employees;







SELECT *
FROM
(
    SELECT DepartmentID,
           AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) AS DeptSalary;

