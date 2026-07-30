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