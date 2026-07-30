-- new dataset for practice questions : 

DROP DATABASE IF EXISTS join_practice_db;
CREATE DATABASE join_practice_db;
USE join_practice_db;

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    membership VARCHAR(20)
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO customers VALUES
(101,'Aarav','Ahmedabad','Gold'),
(102,'Priya','Mumbai','Silver'),
(103,'Rahul','Delhi','Gold'),
(104,'Sneha','Bengaluru','Bronze'),
(105,'Arjun','Hyderabad','Silver'),
(106,'Neha','Pune','Gold'),
(107,'Karan','Jaipur','Bronze'),
(108,'Ananya','Kochi','Gold'),
(109,'Rohan','Surat','Silver'),
(110,'Pooja','Indore','Bronze'),
(111,'Vikram','Vadodara','Gold'),
(112,'Meera','Rajkot','Silver');

-- Multiple orders, duplicate categories,
-- customers without orders,
-- orphan orders (999,998),
-- repeated products and dates

INSERT INTO orders VALUES
(1001,101,'iPhone 16','Mobile',85000,'2025-01-01'),
(1002,101,'Samsung S25','Mobile',78000,'2025-01-05'),
(1003,101,'Boat Airdopes','Audio',1999,'2025-01-06'),

(1004,102,'Dell Inspiron','Laptop',62000,'2025-01-03'),
(1005,102,'HP Pavilion','Laptop',68000,'2025-01-15'),

(1006,103,'LG TV','Electronics',45000,'2025-01-08'),
(1007,103,'Sony TV','Electronics',62000,'2025-01-10'),
(1008,103,'Mi TV','Electronics',30000,'2025-01-11'),

(1009,104,'Nike Shoes','Fashion',4500,'2025-01-12'),

(1010,105,'Canon R50','Camera',56000,'2025-01-13'),
(1011,105,'Tripod','Camera',3500,'2025-01-14'),

(1012,106,'Mixer','Kitchen',2500,'2025-01-14'),
(1013,106,'Cooker','Kitchen',1800,'2025-01-18'),
(1014,106,'Air Fryer','Kitchen',6500,'2025-01-19'),

-- customer 107 no orders

(1015,108,'Realme Buds','Audio',2499,'2025-01-20'),

-- customer 109 multiple categories
(1016,109,'Gaming Mouse','Computer',1500,'2025-01-20'),
(1017,109,'Mechanical Keyboard','Computer',5200,'2025-01-21'),
(1018,109,'Monitor','Computer',14500,'2025-01-21'),

-- customer 110 one expensive order
(1019,110,'MacBook Air','Laptop',98000,'2025-01-22'),

-- customer 111 no orders
-- customer 112 multiple orders
(1020,112,'Samsung Tab','Tablet',32000,'2025-01-22'),
(1021,112,'Power Bank','Accessories',1800,'2025-01-22'),
(1022,112,'USB Cable','Accessories',499,'2025-01-23'),

-- orphan orders
(1023,998,'Unknown Phone','Mobile',25000,'2025-01-25'),
(1024,999,'Ghost Laptop','Laptop',70000,'2025-01-26');



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

