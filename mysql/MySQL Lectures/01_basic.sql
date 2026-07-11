-- Active: 1782301937005@@127.0.0.1@3306@students
-- CREATE DATABASE students;

use students;

create table students ( id int, name varchar(20), age int );

insert into students values (1, "abc", 10);

insert into students values (10, "abc", 1);

insert into students (name, id, age) values ("xyz", 3, 10);

select * from students;