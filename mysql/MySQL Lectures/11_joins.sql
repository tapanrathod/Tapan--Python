-- Active: 1782301937005@@127.0.0.1@3306@joins_db
CREATE DATABASE joins_db;

USE joins_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10, 2),
    order_date DATE
    -- FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

INSERT INTO
    orders
VALUES (
        1001,
        101,
        'Samsung Galaxy S25',
        'Mobile',
        84999,
        '2025-01-10'
    ),
    (
        1002,
        102,
        'Boat Airdopes 311 Pro',
        'Earbuds',
        1799,
        '2025-01-11'
    ),
    (
        1003,
        103,
        'HP Pavilion Laptop',
        'Laptop',
        68999,
        '2025-01-13'
    ),
    (
        1004,
        101,
        'Noise Smart Watch',
        'Wearables',
        3499,
        '2025-01-15'
    ),
    (
        1005,
        105,
        'LG 43-inch Smart TV',
        'Electronics',
        32999,
        '2025-01-17'
    ),
    (
        1006,
        106,
        'Prestige Pressure Cooker',
        'Kitchen',
        2499,
        '2025-01-18'
    ),
    (
        1007,
        108,
        'Milton Water Bottle',
        'Home',
        699,
        '2025-01-20'
    ),
    (
        1008,
        109,
        'Wildcraft Backpack',
        'Fashion',
        1899,
        '2025-01-21'
    ),
    (
        1009,
        110,
        'Titan Analog Watch',
        'Accessories',
        4599,
        '2025-01-22'
    ),
    (
        1010,
        112,
        'Philips Trimmer',
        'Grooming',
        2199,
        '2025-01-25'
    ),
    (
        1011,
        113,
        'OnePlus Nord CE 5',
        'Mobile',
        26999,
        '2025-01-27'
    ),
    (
        1012,
        115,
        'Canon EOS R50',
        'Camera',
        58999,
        '2025-01-30'
    );

INSERT INTO
    customers
VALUES (
        101,
        'Aarav Patel',
        'aarav.patel@gmail.com',
        'Ahmedabad'
    ),
    (
        102,
        'Priya Sharma',
        'priya.sharma@gmail.com',
        'Mumbai'
    ),
    (
        103,
        'Rahul Verma',
        'rahul.verma@gmail.com',
        'Delhi'
    ),
    (
        104,
        'Sneha Iyer',
        'sneha.iyer@gmail.com',
        'Bengaluru'
    ),
    (
        105,
        'Arjun Reddy',
        'arjun.reddy@gmail.com',
        'Hyderabad'
    ),
    (
        106,
        'Neha Gupta',
        'neha.gupta@gmail.com',
        'Pune'
    ),
    (
        107,
        'Karan Singh',
        'karan.singh@gmail.com',
        'Jaipur'
    ),
    (
        108,
        'Ananya Nair',
        'ananya.nair@gmail.com',
        'Kochi'
    ),
    (
        109,
        'Rohan Mehta',
        'rohan.mehta@gmail.com',
        'Surat'
    ),
    (
        110,
        'Pooja Joshi',
        'pooja.joshi@gmail.com',
        'Indore'
    ),
    (
        111,
        'Vikram Shah',
        'vikram.shah@gmail.com',
        'Vadodara'
    ),
    (
        112,
        'Meera Desai',
        'meera.desai@gmail.com',
        'Rajkot'
    ),
    (
        113,
        'Aditya Kulkarni',
        'aditya.k@gmail.com',
        'Nagpur'
    ),
    (
        114,
        'Kavya Rao',
        'kavya.rao@gmail.com',
        'Chennai'
    ),
    (
        115,
        'Nikhil Jain',
        'nikhil.jain@gmail.com',
        'Lucknow'
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        product_name,
        category,
        amount,
        order_date
    )
VALUES (
        1096,
        201,
        'OnePlus 13',
        'Mobile',
        64999.00,
        '2025-06-10'
    ),
    (
        1097,
        202,
        'Dell Inspiron 15',
        'Laptop',
        58999.00,
        '2025-06-12'
    ),
    (
        1098,
        203,
        'Boat Rockerz 550',
        'Headphones',
        2499.00,
        '2025-06-15'
    ),
    (
        1099,
        204,
        'Samsung 32-inch Smart TV',
        'Electronics',
        28999.00,
        '2025-06-18'
    ),
    (
        1100,
        205,
        'Canon PIXMA Printer',
        'Printer',
        8499.00,
        '2025-06-20'
    );

DROP TABLE orders;

DROP TABLE customers;

SELECT * FROM customers;

SELECT * FROM orders;

-- JOINS START

-- LEFT, RIGHT, FULL, OUTER, CROSS, ANTI LEFT, ANTI RIGHT

-- BY DEFAULT JOIN : INNER JOIN

SELECT *
FROM orders as o
    JOIN customers as c ON o.customer_id = c.customer_id;

SELECT *
FROM customers as c
    JOIN orders as o ON o.customer_id = c.customer_id;

SELECT o.order_id, c.customer_name, c.city, o.product_name, o.category, o.amount
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id;

-- LEFT JOIN
SELECT c.customer_name, c.city, o.product_name, o.category, o.amount, o.order_id
FROM customers as c
    LEFT JOIN orders as o ON o.customer_id = c.customer_id;

-- RIGHT
SELECT c.customer_name, c.city, o.product_name, o.category, o.amount, o.order_id
FROM customers as c
    RIGHT JOIN orders as o ON o.customer_id = c.customer_id;

-- FULL JOIN  ***********************************
SELECT o.order_id, c.customer_name, c.city, o.product_name, o.category, o.amount
FROM customers as c
    JOIN orders as o ON o.customer_id = c.customer_id;

-- WITH CONDITIONS :
SELECT o.order_id, c.customer_name, c.city, o.product_name, o.category, o.amount
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
ORDER BY o.amount DESC;

SELECT o.order_id, c.customer_name, c.city, o.product_name, o.category, o.amount
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    o.amount >= 50000
ORDER BY o.order_id DESC;

SELECT c.customer_id, c.customer_name, sum(o.amount)
FROM customers as c
    INNER JOIN orders as o ON o.customer_id = c.customer_id
GROUP BY
    c.customer_id;

-- ANTI LEFT

SELECT *
FROM customers as c
    LEFT JOIN orders as o ON o.customer_id = c.customer_id
WHERE
    o.order_id IS NULL;

-------------------------------------------------------------------------------

DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS departments;

DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations (location_id)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT NULL,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

INSERT INTO
    locations
VALUES (1, 'New York', 'USA'),
    (2, 'London', 'UK'),
    (3, 'Mumbai', 'India'),
    (4, 'Berlin', 'Germany'),
    (5, 'Sydney', 'Australia');

INSERT INTO
    departments
VALUES (101, 'HR', 1),
    (102, 'Finance', 1),
    (103, 'IT', 2),
    (104, 'Marketing', 2),
    (105, 'Sales', 3),
    (106, 'Operations', 3),
    (107, 'Support', 4),
    (108, 'Research', 4),
    (109, 'Legal', 5),
    (110, 'Admin', 5);

INSERT INTO
    employees (
        employee_id,
        first_name,
        last_name,
        salary,
        department_id,
        hire_date
    )
VALUES (
        1,
        'Emp1',
        'Last1',
        41000,
        101,
        '2022-01-01'
    ),
    (
        2,
        'Emp2',
        'Last2',
        42000,
        102,
        '2022-01-02'
    ),
    (
        3,
        'Emp3',
        'Last3',
        43000,
        103,
        '2022-01-03'
    ),
    (
        4,
        'Emp4',
        'Last4',
        44000,
        104,
        '2022-01-04'
    ),
    (
        5,
        'Emp5',
        'Last5',
        45000,
        105,
        '2022-01-05'
    ),
    (
        6,
        'Emp6',
        'Last6',
        46000,
        106,
        '2022-01-06'
    ),
    (
        7,
        'Emp7',
        'Last7',
        47000,
        107,
        '2022-01-07'
    ),
    (
        8,
        'Emp8',
        'Last8',
        48000,
        108,
        '2022-01-08'
    ),
    (
        9,
        'Emp9',
        'Last9',
        49000,
        109,
        '2022-01-09'
    ),
    (
        10,
        'Emp10',
        'Last10',
        50000,
        110,
        '2022-01-10'
    ),
    (
        11,
        'Emp11',
        'Last11',
        41100,
        101,
        '2022-02-01'
    ),
    (
        12,
        'Emp12',
        'Last12',
        42100,
        102,
        '2022-02-02'
    ),
    (
        13,
        'Emp13',
        'Last13',
        43100,
        103,
        '2022-02-03'
    ),
    (
        14,
        'Emp14',
        'Last14',
        44100,
        104,
        '2022-02-04'
    ),
    (
        15,
        'Emp15',
        'Last15',
        45100,
        105,
        '2022-02-05'
    ),
    (
        16,
        'Emp16',
        'Last16',
        46100,
        106,
        '2022-02-06'
    ),
    (
        17,
        'Emp17',
        'Last17',
        47100,
        107,
        '2022-02-07'
    ),
    (
        18,
        'Emp18',
        'Last18',
        48100,
        108,
        '2022-02-08'
    ),
    (
        19,
        'Emp19',
        'Last19',
        49100,
        109,
        '2022-02-09'
    ),
    (
        20,
        'Emp20',
        'Last20',
        50100,
        NULL,
        '2022-02-10'
    ),
    (
        21,
        'Emp21',
        'Last21',
        41200,
        101,
        '2022-03-01'
    ),
    (
        22,
        'Emp22',
        'Last22',
        42200,
        102,
        '2022-03-02'
    ),
    (
        23,
        'Emp23',
        'Last23',
        43200,
        103,
        '2022-03-03'
    ),
    (
        24,
        'Emp24',
        'Last24',
        44200,
        104,
        '2022-03-04'
    ),
    (
        25,
        'Emp25',
        'Last25',
        45200,
        105,
        '2022-03-05'
    ),
    (
        26,
        'Emp26',
        'Last26',
        46200,
        106,
        '2022-03-06'
    ),
    (
        27,
        'Emp27',
        'Last27',
        47200,
        107,
        '2022-03-07'
    ),
    (
        28,
        'Emp28',
        'Last28',
        48200,
        108,
        '2022-03-08'
    ),
    (
        29,
        'Emp29',
        'Last29',
        49200,
        NULL,
        '2022-03-09'
    ),
    (
        30,
        'Emp30',
        'Last30',
        50200,
        110,
        '2022-03-10'
    ),
    (
        31,
        'Emp31',
        'Last31',
        41300,
        101,
        '2022-04-01'
    ),
    (
        32,
        'Emp32',
        'Last32',
        42300,
        102,
        '2022-04-02'
    ),
    (
        33,
        'Emp33',
        'Last33',
        43300,
        103,
        '2022-04-03'
    ),
    (
        34,
        'Emp34',
        'Last34',
        44300,
        104,
        '2022-04-04'
    ),
    (
        35,
        'Emp35',
        'Last35',
        45300,
        NULL,
        '2022-04-05'
    ),
    (
        36,
        'Emp36',
        'Last36',
        46300,
        106,
        '2022-04-06'
    ),
    (
        37,
        'Emp37',
        'Last37',
        47300,
        107,
        '2022-04-07'
    ),
    (
        38,
        'Emp38',
        'Last38',
        48300,
        108,
        '2022-04-08'
    ),
    (
        39,
        'Emp39',
        'Last39',
        49300,
        109,
        '2022-04-09'
    ),
    (
        40,
        'Emp40',
        'Last40',
        50300,
        110,
        '2022-04-10'
    ),
    (
        41,
        'Emp41',
        'Last41',
        41400,
        101,
        '2022-05-01'
    ),
    (
        42,
        'Emp42',
        'Last42',
        42400,
        102,
        '2022-05-02'
    ),
    (
        43,
        'Emp43',
        'Last43',
        43400,
        NULL,
        '2022-05-03'
    ),
    (
        44,
        'Emp44',
        'Last44',
        44400,
        104,
        '2022-05-04'
    ),
    (
        45,
        'Emp45',
        'Last45',
        45400,
        105,
        '2022-05-05'
    ),
    (
        46,
        'Emp46',
        'Last46',
        46400,
        106,
        '2022-05-06'
    ),
    (
        47,
        'Emp47',
        'Last47',
        47400,
        107,
        '2022-05-07'
    ),
    (
        48,
        'Emp48',
        'Last48',
        48400,
        108,
        '2022-05-08'
    ),
    (
        49,
        'Emp49',
        'Last49',
        49400,
        109,
        '2022-05-09'
    ),
    (
        50,
        'Emp50',
        'Last50',
        50400,
        110,
        '2022-05-10'
    ),
    (
        51,
        'Emp51',
        'Last51',
        41500,
        101,
        '2022-06-01'
    ),
    (
        52,
        'Emp52',
        'Last52',
        42500,
        NULL,
        '2022-06-02'
    ),
    (
        53,
        'Emp53',
        'Last53',
        43500,
        103,
        '2022-06-03'
    ),
    (
        54,
        'Emp54',
        'Last54',
        44500,
        104,
        '2022-06-04'
    ),
    (
        55,
        'Emp55',
        'Last55',
        45500,
        105,
        '2022-06-05'
    ),
    (
        56,
        'Emp56',
        'Last56',
        46500,
        106,
        '2022-06-06'
    ),
    (
        57,
        'Emp57',
        'Last57',
        47500,
        107,
        '2022-06-07'
    ),
    (
        58,
        'Emp58',
        'Last58',
        48500,
        NULL,
        '2022-06-08'
    ),
    (
        59,
        'Emp59',
        'Last59',
        49500,
        109,
        '2022-06-09'
    ),
    (
        60,
        'Emp60',
        'Last60',
        50500,
        110,
        '2022-06-10'
    ),
    (
        61,
        'Emp61',
        'Last61',
        41600,
        101,
        '2022-07-01'
    ),
    (
        62,
        'Emp62',
        'Last62',
        42600,
        102,
        '2022-07-02'
    ),
    (
        63,
        'Emp63',
        'Last63',
        43600,
        103,
        '2022-07-03'
    ),
    (
        64,
        'Emp64',
        'Last64',
        44600,
        104,
        '2022-07-04'
    ),
    (
        65,
        'Emp65',
        'Last65',
        45600,
        105,
        '2022-07-05'
    ),
    (
        66,
        'Emp66',
        'Last66',
        46600,
        NULL,
        '2022-07-06'
    ),
    (
        67,
        'Emp67',
        'Last67',
        47600,
        107,
        '2022-07-07'
    ),
    (
        68,
        'Emp68',
        'Last68',
        48600,
        108,
        '2022-07-08'
    ),
    (
        69,
        'Emp69',
        'Last69',
        49600,
        109,
        '2022-07-09'
    ),
    (
        70,
        'Emp70',
        'Last70',
        50600,
        110,
        '2022-07-10'
    ),
    (
        71,
        'Emp71',
        'Last71',
        41700,
        101,
        '2022-08-01'
    ),
    (
        72,
        'Emp72',
        'Last72',
        42700,
        102,
        '2022-08-02'
    ),
    (
        73,
        'Emp73',
        'Last73',
        43700,
        103,
        '2022-08-03'
    ),
    (
        74,
        'Emp74',
        'Last74',
        44700,
        NULL,
        '2022-08-04'
    ),
    (
        75,
        'Emp75',
        'Last75',
        45700,
        105,
        '2022-08-05'
    ),
    (
        76,
        'Emp76',
        'Last76',
        46700,
        106,
        '2022-08-06'
    ),
    (
        77,
        'Emp77',
        'Last77',
        47700,
        107,
        '2022-08-07'
    ),
    (
        78,
        'Emp78',
        'Last78',
        48700,
        108,
        '2022-08-08'
    ),
    (
        79,
        'Emp79',
        'Last79',
        49700,
        109,
        '2022-08-09'
    ),
    (
        80,
        'Emp80',
        'Last80',
        50700,
        110,
        '2022-08-10'
    ),
    (
        81,
        'Emp81',
        'Last81',
        41800,
        NULL,
        '2022-09-01'
    ),
    (
        82,
        'Emp82',
        'Last82',
        42800,
        102,
        '2022-09-02'
    ),
    (
        83,
        'Emp83',
        'Last83',
        43800,
        103,
        '2022-09-03'
    ),
    (
        84,
        'Emp84',
        'Last84',
        44800,
        104,
        '2022-09-04'
    ),
    (
        85,
        'Emp85',
        'Last85',
        45800,
        105,
        '2022-09-05'
    ),
    (
        86,
        'Emp86',
        'Last86',
        46800,
        106,
        '2022-09-06'
    ),
    (
        87,
        'Emp87',
        'Last87',
        47800,
        107,
        '2022-09-07'
    ),
    (
        88,
        'Emp88',
        'Last88',
        48800,
        108,
        '2022-09-08'
    ),
    (
        89,
        'Emp89',
        'Last89',
        49800,
        NULL,
        '2022-09-09'
    ),
    (
        90,
        'Emp90',
        'Last90',
        50800,
        110,
        '2022-09-10'
    ),
    (
        91,
        'Emp91',
        'Last91',
        41900,
        101,
        '2022-10-01'
    ),
    (
        92,
        'Emp92',
        'Last92',
        42900,
        102,
        '2022-10-02'
    ),
    (
        93,
        'Emp93',
        'Last93',
        43900,
        103,
        '2022-10-03'
    ),
    (
        94,
        'Emp94',
        'Last94',
        44900,
        104,
        '2022-10-04'
    ),
    (
        95,
        'Emp95',
        'Last95',
        45900,
        105,
        '2022-10-05'
    ),
    (
        96,
        'Emp96',
        'Last96',
        46900,
        106,
        '2022-10-06'
    ),
    (
        97,
        'Emp97',
        'Last97',
        47900,
        NULL,
        '2022-10-07'
    ),
    (
        98,
        'Emp98',
        'Last98',
        48900,
        108,
        '2022-10-08'
    ),
    (
        99,
        'Emp99',
        'Last99',
        49900,
        109,
        '2022-10-09'
    ),
    (
        100,
        'Emp100',
        'Last100',
        50900,
        110,
        '2022-10-10'
    );

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM locations;

SELECT e.first_name, e.last_name, e.salary, d.department_name, d.department_id, l.city, l.country
FROM
    employees e
    LEFT JOIN departments d ON d.department_id = e.department_id
    LEFT JOIN locations l ON d.location_id = l.location_id
WHERE
    d.department_id IS NULL;

SELECT c.customer_name, COUNT(o.order_id) total_orders
FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_name;

SELECT *
FROM customers
    LEFT JOIN orders ON customers.customer_id = orders.customer_id;

SELECT *
FROM customers
    RIGHT JOIN orders ON customers.customer_id = orders.customer_id;

-- FULL JOIN :

SELECT *
FROM customers
    LEFT JOIN orders ON customers.customer_id = orders.customer_id
UNION
SELECT *
FROM customers
    RIGHT JOIN orders ON customers.customer_id = orders.customer_id;

-- ANTI FULL JOIN :
SELECT *
FROM customers
    LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE
    orders.order_id IS NULL
UNION
SELECT *
FROM customers
    RIGHT JOIN orders ON customers.customer_id = orders.customer_id
WHERE
    customers.customer_id IS NULL;

-- CROSS JOIN

SELECT *
FROM customers as c
    CROSS JOIN orders as o
ORDER BY c.customer_id;

-------------------------------------------------------

SELECT first_name
FROM employees
WHERE department_id
    IN (
        SELECT department_id
        FROM departments
        WHERE
            department_name IN ("IT", "Finance")
    )


SELECT
    e.first_name,
    (
        SELECT d.department_name
        FROM departments d
        WHERE d.department_id = e.department_id
    ) AS department_name
FROM employees e
WHERE e.department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'Finance')
);


SELECT * FROM departments;


-- ----------------- SELF JOIN ------------------
CREATE TABLE Employee_self (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Title VARCHAR(50),
    ManagerID INT
);


INSERT INTO Employee_self (EmpID, EmpName, Title, ManagerID) VALUES
(1, 'Rajesh Sharma', 'CEO', NULL),

(2, 'Amit Verma', 'General Manager', 1),
(3, 'Priya Patel', 'General Manager', 1),

(4, 'Rahul Mehta', 'Project Manager', 2),
(5, 'Neha Shah', 'Project Manager', 2),
(6, 'Vikram Singh', 'Project Manager', 3),
(7, 'Pooja Nair', 'Project Manager', 3),

(8, 'Arjun Reddy', 'Team Lead', 4),
(9, 'Sneha Iyer', 'Team Lead', 4),
(10, 'Karan Joshi', 'Team Lead', 5),
(11, 'Meera Kulkarni', 'Team Lead', 5),
(12, 'Ankit Gupta', 'Team Lead', 6),
(13, 'Divya Menon', 'Team Lead', 6),
(14, 'Rohit Mishra', 'Team Lead', 7),
(15, 'Kavita Desai', 'Team Lead', 7),

(16, 'Suresh Yadav', 'Software Engineer', 8),
(17, 'Anjali Rao', 'Software Engineer', 8),
(18, 'Nitin Choudhary', 'Software Engineer', 9),
(19, 'Ritika Kapoor', 'Software Engineer', 9),
(20, 'Harsh Patel', 'Software Engineer', 10),
(21, 'Simran Kaur', 'Software Engineer', 10),
(22, 'Manoj Kumar', 'Software Engineer', 11),
(23, 'Deepika Sinha', 'Software Engineer', 11),
(24, 'Gaurav Bansal', 'Software Engineer', 12),
(25, 'Ayesha Khan', 'Software Engineer', 12),
(26, 'Sandeep Mishra', 'Software Engineer', 13),
(27, 'Nisha Reddy', 'Software Engineer', 13),
(28, 'Abhishek Jain', 'Software Engineer', 14),
(29, 'Shreya Ghosh', 'Software Engineer', 14),
(30, 'Rakesh Pandey', 'Software Engineer', 15),
(31, 'Pallavi Joshi', 'Software Engineer', 15),

(32, 'Varun Malhotra', 'QA Engineer', 8),
(33, 'Bhavna Trivedi', 'QA Engineer', 9),
(34, 'Hemant Soni', 'QA Engineer', 10),
(35, 'Isha Arora', 'QA Engineer', 11),
(36, 'Akash Tiwari', 'QA Engineer', 12),
(37, 'Komal Agrawal', 'QA Engineer', 13),
(38, 'Yash Parmar', 'QA Engineer', 14),
(39, 'Preeti Dubey', 'QA Engineer', 15),

(40, 'Sachin Saxena', 'HR Executive', 2),
(41, 'Monika Bhatia', 'HR Executive', 2),
(42, 'Ravi Solanki', 'Finance Executive', 3),
(43, 'Swati Chawla', 'Finance Executive', 3),

(44, 'Ajay Thakur', 'Business Analyst', 4),
(45, 'Rekha Pillai', 'Business Analyst', 5),
(46, 'Tarun Arora', 'Business Analyst', 6),
(47, 'Sonal Verma', 'Business Analyst', 7),

(48, 'Naveen Shetty', 'Intern', 16),
(49, 'Muskan Gupta', 'Intern', 20),
(50, 'Aditya Bhatt', 'Intern', 24);

SELECT * FROM employee_self;

SELECT *
FROM employee_self as a
JOIN employee_self as b
ON a.managerid = b.empid;

SELECT a.`EmpID`, a.`EmpName`, b.`EmpName`, b.`Title` as manage_title
FROM employee_self as a
JOIN employee_self as b
ON a.managerid = b.empid;


SELECT a.`EmpID`, a.`EmpName`, b.`EmpName`, b.`ManagerID`,b.`Title` as manage_title
FROM employee_self as a
JOIN employee_self as b
ON a.managerid = b.empid;

SELECT a.`EmpID`, a.`EmpName`, b.`EmpName`, b.`ManagerID`,b.`Title` as manage_title
FROM employee_self as a
JOIN employee_self as b
ON a.managerid = b.empid
AND a.`ManagerID` > b.`ManagerID`
ORDER BY b.`Title`



-- GROUP BY
SELECT  b.`Title`, COUNT(b.`Title`) as no_employess
FROM employee_self as a
JOIN employee_self as b
ON a.managerid = b.empid
GROUP BY b.`Title`;

SELECT b.`Title` as manage_title, COUNT(b.`Title`) as no_employess
FROM employee_self as a
JOIN employee_self as b
ON a.managerid = b.empid
AND a.`ManagerID` > b.`ManagerID`
GROUP BY b.`Title`
ORDER BY b.`Title`;


SELECT
    b.EmpName AS Manager_Name,
    b.Title AS Manager_Title,
    COUNT(a.EmpID) AS No_Of_Employees
FROM employee_self AS a
JOIN employee_self AS b
    ON a.ManagerID = b.EmpID
GROUP BY
    b.EmpID,
    b.EmpName,
    b.Title;


SELECT
    a.Title AS Title,
    COUNT(*) AS No_Employees,
    b.Title AS `Under`
FROM employee_self AS a
JOIN employee_self AS b
    ON a.ManagerID = b.EmpID
GROUP BY
    a.Title,
    b.Title;