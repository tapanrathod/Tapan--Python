-- Active: 1782301937005@@127.0.0.1@3306@students_practice
CREATE DATABASE students_practice; 

use students_practice;

create table students (
    id int,
    name varchar(20),
    age int,
    subjects VARCHAR(10),
    marks int
);

insert into students values (1, "Tapan", 28, "Maths", 60); -- insert values as it is like above

insert into students values ( 2, "Rathod", 27, "Science", 71 );

insert into students (name, id, age, subjects, marks)

values ("Reddic", 3, 25, "English", 72); -- insert values as above

select * from students