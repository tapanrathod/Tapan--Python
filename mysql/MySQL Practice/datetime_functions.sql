-- Active: 1782301937005@@127.0.0.1@3306@datetime_fun
-- ==========================================
-- Create Customers Table
-- ==========================================

CREATE DATABASE datetime_fun;

use datetime_fun;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male','Female'),
    city VARCHAR(50),
    state VARCHAR(50),
    join_date DATE
);

SHOW TABLES FROM datetime_fun;

-- ==========================================
-- Create Orders Table
-- ==========================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    order_time TIME,
    order_datetime DATETIME,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- here REFERENCES means FOREIGN Key
);

-- ==========================================
-- Insert Customers (20 Rows)
-- ==========================================

INSERT INTO customers
(first_name, last_name, gender, city, state, join_date)
VALUES
('Rahul','Sharma','Male','Ahmedabad','Gujarat','2022-01-15'),
('Priya','Patel','Female','Surat','Gujarat','2022-02-20'),
('Amit','Verma','Male','Mumbai','Maharashtra','2022-03-12'),
('Neha','Singh','Female','Pune','Maharashtra','2022-04-05'),
('Rohan','Mehta','Male','Jaipur','Rajasthan','2022-05-18'),
('Sneha','Joshi','Female','Delhi','Delhi','2022-06-10'),
('Karan','Kapoor','Male','Chandigarh','Punjab','2022-07-22'),
('Anjali','Desai','Female','Vadodara','Gujarat','2022-08-14'),
('Vikram','Yadav','Male','Lucknow','Uttar Pradesh','2022-09-01'),
('Pooja','Gupta','Female','Indore','Madhya Pradesh','2022-10-08'),
('Arjun','Reddy','Male','Hyderabad','Telangana','2023-01-11'),
('Kavya','Nair','Female','Kochi','Kerala','2023-02-18'),
('Suresh','Kumar','Male','Chennai','Tamil Nadu','2023-03-27'),
('Meera','Iyer','Female','Bengaluru','Karnataka','2023-04-15'),
('Nikhil','Shah','Male','Rajkot','Gujarat','2023-05-20'),
('Ritu','Malhotra','Female','Noida','Uttar Pradesh','2023-06-25'),
('Harsh','Pandya','Male','Ahmedabad','Gujarat','2023-07-30'),
('Divya','Saxena','Female','Bhopal','Madhya Pradesh','2023-08-17'),
('Manish','Chauhan','Male','Nagpur','Maharashtra','2023-09-22'),
('Aisha','Khan','Female','Kolkata','West Bengal','2023-10-10');

-- ==========================================
-- Insert Orders (40 Rows)
-- ==========================================

INSERT INTO orders
(customer_id, order_date, order_time, order_datetime, product_name, quantity, price)
VALUES
(1,'2024-01-05','10:15:20','2024-01-05 10:15:20','Laptop',1,65000),
(2,'2024-01-08','11:20:15','2024-01-08 11:20:15','Mouse',2,800),
(3,'2024-01-12','09:30:40','2024-01-12 09:30:40','Keyboard',1,1800),
(4,'2024-01-18','14:10:00','2024-01-18 14:10:00','Monitor',1,12500),
(5,'2024-01-22','16:45:35','2024-01-22 16:45:35','Headphones',2,2500),
(6,'2024-02-02','12:30:10','2024-02-02 12:30:10','Tablet',1,22000),
(7,'2024-02-08','15:20:45','2024-02-08 15:20:45','Smart Watch',1,9000),
(8,'2024-02-14','17:10:30','2024-02-14 17:10:30','Printer',1,11000),
(9,'2024-02-20','13:05:25','2024-02-20 13:05:25','USB Drive',3,700),
(10,'2024-02-28','18:40:50','2024-02-28 18:40:50','External HDD',1,6000),
(11,'2024-03-03','09:10:20','2024-03-03 09:10:20','Camera',1,45000),
(12,'2024-03-08','10:35:45','2024-03-08 10:35:45','Speaker',2,3500),
(13,'2024-03-15','11:50:15','2024-03-15 11:50:15','SSD',1,5500),
(14,'2024-03-20','14:40:10','2024-03-20 14:40:10','Router',1,2800),
(15,'2024-03-27','16:55:20','2024-03-27 16:55:20','Power Bank',2,1800),
(16,'2024-04-02','10:05:45','2024-04-02 10:05:45','Mobile',1,32000),
(17,'2024-04-07','13:15:30','2024-04-07 13:15:30','Charger',2,900),
(18,'2024-04-13','15:25:50','2024-04-13 15:25:50','Webcam',1,2400),
(19,'2024-04-19','17:40:10','2024-04-19 17:40:10','Microphone',1,4200),
(20,'2024-04-25','19:10:35','2024-04-25 19:10:35','Projector',1,28000),
(1,'2024-05-01','10:00:00','2024-05-01 10:00:00','Laptop Bag',1,1800),
(2,'2024-05-05','11:30:20','2024-05-05 11:30:20','Mouse Pad',2,300),
(3,'2024-05-09','12:45:15','2024-05-09 12:45:15','Keyboard',1,2000),
(4,'2024-05-14','14:20:40','2024-05-14 14:20:40','Monitor',2,13000),
(5,'2024-05-20','16:35:50','2024-05-20 16:35:50','SSD',1,6500),
(6,'2024-05-28','09:15:10','2024-05-28 09:15:10','Tablet',1,25000),
(7,'2024-06-03','11:40:25','2024-06-03 11:40:25','Smartphone',1,42000),
(8,'2024-06-09','13:30:40','2024-06-09 13:30:40','Printer Ink',3,1200),
(9,'2024-06-15','15:20:10','2024-06-15 15:20:10','Router',1,3200),
(10,'2024-06-21','17:05:55','2024-06-21 17:05:55','Camera Lens',1,15000),
(11,'2024-07-02','10:50:25','2024-07-02 10:50:25','Tripod',1,3000),
(12,'2024-07-08','12:10:30','2024-07-08 12:10:30','Bluetooth Speaker',1,4000),
(13,'2024-07-15','14:45:15','2024-07-15 14:45:15','Gaming Mouse',1,2500),
(14,'2024-07-20','16:30:50','2024-07-20 16:30:50','Gaming Keyboard',1,4500),
(15,'2024-07-26','18:20:40','2024-07-26 18:20:40','Graphics Card',1,38000),
(16,'2024-08-05','09:40:20','2024-08-05 09:40:20','RAM',2,4200),
(17,'2024-08-11','11:25:10','2024-08-11 11:25:10','CPU Cooler',1,3500),
(18,'2024-08-17','13:50:30','2024-08-17 13:50:30','Cabinet',1,5000),
(19,'2024-08-23','15:15:45','2024-08-23 15:15:45','UPS',1,7500),
(20,'2024-08-30','18:55:55','2024-08-30 18:55:55','LED TV',1,55000);



SELECT * FROM customers;
SELECT * FROM orders;


SELECT first_name, last_name, MONTH(join_date) as month_number, MONTHNAME(join_date) as monthName FROM customers;

SELECT TIME(order_datetime) as order_date2 from orders;

SELECT CURRENT_TIMESTAMP();


SELECT DATE_FORMAT(CURRENT_DATE(), "%d/%m/%y");

SELECT DATE_FORMAT(CURRENT_DATE(), "%D %M %Y");

SELECT DATEDIFF("2024-07-07", "2024-07-04");

SELECT DATE_ADD("2024-07-04", INTERVAL 40 DAY); 

SELECT DATE_SUB("2024-07-04", INTERVAL 4 DAY); 


SELECT DATE_ADD(order_date, INTERVAL 4 DAY) FROM orders; 

select TIMESTAMPADD(DAY, 4, order_datetime), order_id FROM orders;

SELECT UNIX_TIMESTAMP();

SELECT UNIX_TIMESTAMP(order_datetime) FROM orders;


SELECT UTC_TIMESTAMP();