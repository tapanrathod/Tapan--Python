-- Active: 1782301937005@@127.0.0.1@3306@students
-- constraints :
-- primary key
-- foreign key
-- check
-- not null
-- enum
-- default

-- database :

use students; -- database name


-- create table :

create table if not exists students (
	id int primary key not null, -- id must not null values
    age int check(age >= 18) not null, -- age must be greater than or equal to 18 and not null values
    phone bigint unique not null -- phone must be unique and not null values -- "bigint" datatype exceeds the limits of standard numeric types in the memory
);


-- insert data :

insert into students values (1, 45, 5437656879); -- it will insert singe data on id = 1

insert into students values (2, 20, 1234554); -- it will insert singe data on id = 2

insert into students (id, age, phone) values -- to cerate multiple ids and insert multiple data
(3, 34, 5435345), -- id = 3
(4, 34, 5735345), -- id = 4
(5, 34, 5735445), -- id = 5
(6, 34, 5738345), -- id = 6
(7, 34, 5731345); -- id = 7


-- read data :

select * from students; -- use "*" to select all columns

select * from students where age >= 34; -- it will select all columns where age >= 34 in the table

select id, phone from students; -- it will select  "id" and "phone" column in the table

select age, id from students; -- it will select  "age" and "id" columns in the table [no need to insert columns names as mentioned in the table]


-- update data :

update students set age = 45 where id = 2; -- it will update "age" on id = 2

delete from students where id = 5;


drop table students;


-- CREATE TABLE students (
--     id PRIMARY KEY not NULL UNIQUE AUTO_INCREMENT,
--     gender ENUM('Male', 'Female', 'Other'),
--     age INT CHECK(age >= 18),
--     country VARCHAR(20) DEFAULT "India",
--     exam_id FOREIGN KEY REFERENCES exams(id) 
-- );  


CREATE Table customers (

    id int PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    customer_name VARCHAR(50) not null,
    age int CHECk(age >= 18),
    country VARCHAR(20) DEFAULT "India",
    gender ENUM('Male', 'Female', 'Other')
);


CREATE TABLE orders (
    order_id int PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    product VARCHAR(20) not null,
    price int NOT NULL,
    quantity int NOT NULL check (quantity > 0),
    customer_id int,

   FOREIGN KEY (customer_id) REFERENCES customers(id)
);


TRUNCATE TABLE customers;

DROP Table orders;
DROP Table customers;


insert into customers values (1, "abc", 34, "India", "Male");
insert into customers values (2, "abc", 34, "India", "Male");
insert into customers values (3, "abc", 34, "India", "Male");
insert into customers values (4, "abc", 34, "India", "Male");
insert into customers values (5, "abc", 34, "India", "Male");
insert into customers values (6, "abc", 34, "India", "Male");
insert into customers values (7, "abc", 34, "India", "Male");
insert into customers values (8, "abc", 34, "India", "Male");

select * FROM customers;
