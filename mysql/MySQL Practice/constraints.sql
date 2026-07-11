-- constraints :


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

select * from students; -- use "*" to select multiple columns

select * from students where age >= 34; -- it will select "age" column in the table

select id, phone from students; -- it will select  "id" and "phone" column in the table

select age, id from students; -- it will select  "age" and "id" columns in the table [no need to insert columns names as mentioned in the table]


-- update data :

update students set age = 45 where id = 2; -- it will update "age" on id = 2
