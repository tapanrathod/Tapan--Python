-- Active: 1782301937005@@127.0.0.1@3306@students
ALTER TABLE customers ADD COLUMN phone bigint not null unique; 

-- SHOW TABLES FROM students;

select * from customers;

ALTER Table customers DROP COLUMN phone;

ALTER Table customers MODIFY customer_name VARCHAR(100);

ALTER TABLE customers RENAME COLUMN id to customer_id;


CREATE Table customers (
    id int,
    customer_name VARCHAR(50),
    age int ,
    country VARCHAR(20),
    gender VARCHAR(20)
)

ALTER TABLE  customers ADD CONSTRAINT pk_id PRIMARY KEY (id);

ALTER TABLE customers ADD COLUMN phone bigint;

ALTER TABLE customers ADD CONSTRAINT uq_phone UNIQUE (phone);



SHOW CREATE TABLE customers;

CREATE TABLE orders (
    order_id int,
    product VARCHAR(20) not null,
    price int NOT NULL,
    quantity int NOT NULL,
    customer_id int
);

SHOW CREATE TABLE orders;

ALTER TABLE orders ADD CONSTRAINT pk_order_id PRIMARY KEY (order_id);

ALTER TABLE orders ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(id);
ALTER TABLE orders ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE RESTRICT;

ALTER TABLE orders DROP CONSTRAINT fk_customer_id;

ALTER TABLE customers ADD CONSTRAINT ck_age  CHECK(age >= 18);


CREATE TABLE `customers` (
  `id` int NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `phone` bigint DEFAULT NULL,


  
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `orders` (
  `order_id` int DEFAULT NULL,
  `product` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  KEY `fk_customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci