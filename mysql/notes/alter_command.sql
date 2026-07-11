/*
Basic Syntax : 

ALTER TABLE table_name
action;
*/

/*
==> 1. ADD Operations :

1. Add Column :

ALTER TABLE users
ADD column_name datatype;

Ex. : 

ALTER TABLE users
ADD age INT;

2. : Add with constraints :

ALTER TABLE users
ADD email VARCHAR(100) NOT NULL UNIQUE;

3. Add Multiple Columns :
ALTER TABLE users
ADD (
    phone VARCHAR(15),
    city VARCHAR(50)
);


4. Add Column at Specific Position :

Ex. :
ALTER TABLE users
ADD dob DATE AFTER name;

Ex. :
ALTER TABLE users
ADD id INT FIRST;


5. Add Constraints :

5.1 PRIMARY KEY : 
ALTER TABLE users
ADD CONSTRAINT pk_users PRIMARY KEY (id);

5.2 UNIQUE
ALTER TABLE users
ADD CONSTRAINT uq_users_email UNIQUE (email);

5.3 FOREIGN KEY
ALTER TABLE users
ADD CONSTRAINT fk_users_dept
FOREIGN KEY (dept_id) REFERENCES departments(id);

5.4 CHECK
ALTER TABLE users
ADD CONSTRAINT chk_users_age CHECK (age >= 18);


*/


/*
===> 2. MODIFY Operations : 

1. Modify Column Data Type :

ALTER TABLE users
MODIFY age BIGINT;


2. Modify Column with Constraints :

ALTER TABLE users
MODIFY salary DECIMAL(10,2) NOT NULL DEFAULT 0;

3. Increase Column Size (Safe) :
ALTER TABLE users
MODIFY name VARCHAR(200);

*/


/*
===> 3. CHANGE Operations :

1. rename a column and optionally change type : 

ALTER TABLE users
CHANGE old_name new_name datatype;

Ex. :
ALTER TABLE users
CHANGE fullname name VARCHAR(100);

*/


/*
===> 4. DROP Operations :

1. Drop Column : 
ALTER TABLE users
DROP COLUMN age;


2. Drop Constraint :

2.1  PRIMARY KEY :
ALTER TABLE users DROP PRIMARY KEY;


2.2 UNIQUE / CHECK :
ALTER TABLE users DROP CONSTRAINT uq_users_email;

2.3 FOREIGN KEY :
ALTER TABLE users DROP FOREIGN KEY fk_users_dept;

2.4 Drop Index :
ALTER TABLE users DROP INDEX idx_name;

*/


/*
===> 5. RENAME Operations : 

1. Rename Column : 
ALTER TABLE users
RENAME COLUMN old_name TO new_name;

2. Rename Table : 
ALTER TABLE users RENAME TO customers;
OR
RENAME TABLE users TO customers;

*/


/*
===> 6. DEFAULT Operations :

1. Add DEFAULT :
ALTER TABLE users
MODIFY status VARCHAR(20) DEFAULT 'active';

2.  Remove DEFAULT :
ALTER TABLE users
ALTER status DROP DEFAULT;

*/


/*
===> 7. INDEX Operations L 

1. Add Index
ALTER TABLE users
ADD INDEX idx_name (name);

2. Add UNIQUE Index
ALTER TABLE users
ADD UNIQUE idx_email (email);

*/
