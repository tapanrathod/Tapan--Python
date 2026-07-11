-- Active: 1768297845798@@127.0.0.1@3306@learn
/*
==============================
FOREIGN KEY – Complete Guide
==============================

-> A FOREIGN KEY is used to create a relationship between two tables
-> It ensures REFERENTIAL INTEGRITY
-> Child table column refers to PRIMARY KEY or UNIQUE key of parent table

Parent Table  → Referenced table
Child Table   → Table having foreign key

RULES :
✔ Parent column must be PRIMARY KEY or UNIQUE
✔ Data types must match
✔ Parent table must exist first
✔ InnoDB engine is required
*/

/*
===> 1️⃣ Basic FOREIGN KEY Syntax (CREATE TABLE) :

CREATE TABLE departments (
id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

CREATE TABLE employees (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
CONSTRAINT fk_emp_dept
FOREIGN KEY (dept_id)
REFERENCES departments(id)
);

*/

/*
===> 2️⃣ FOREIGN KEY using ALTER TABLE :

ALTER TABLE employees
ADD CONSTRAINT fk_emp_dept
FOREIGN KEY (dept_id)
REFERENCES departments(id);

*/

/*
===> 3️⃣ FOREIGN KEY with ON DELETE Rules :

-- ON DELETE CASCADE
-- Deletes child rows automatically when parent is deleted

FOREIGN KEY (dept_id)
REFERENCES departments(id)
ON DELETE CASCADE;


-- ON DELETE SET NULL
-- Sets foreign key column to NULL

FOREIGN KEY (dept_id)
REFERENCES departments(id)
ON DELETE SET NULL;


-- ON DELETE RESTRICT / NO ACTION
-- Prevents delete if child rows exist (default behavior)

FOREIGN KEY (dept_id)
REFERENCES departments(id)
ON DELETE RESTRICT;

*/

/*
===> 4️⃣ FOREIGN KEY with ON UPDATE Rules :

FOREIGN KEY (dept_id)
REFERENCES departments(id)
ON UPDATE CASCADE;

*/

/*
===> 5️⃣ All FOREIGN KEY Actions Summary :

ON DELETE / ON UPDATE options :

CASCADE     -> Auto delete / update child rows
SET NULL    -> Set foreign key to NULL
RESTRICT    -> Prevent delete / update
NO ACTION   -> Same as RESTRICT

NOTE :
SET DEFAULT is NOT supported in MySQL

*/

/*
===> 6️⃣ Composite FOREIGN KEY (Multiple Columns) :

CREATE TABLE orders (
order_id INT,
product_id INT,
PRIMARY KEY (order_id, product_id)
);

CREATE TABLE order_items (
order_id INT,
product_id INT,
qty INT,
CONSTRAINT fk_order_item
FOREIGN KEY (order_id, product_id)
REFERENCES orders(order_id, product_id)
);

*/

/*
===> 7️⃣ DROP FOREIGN KEY :

ALTER TABLE employees
DROP FOREIGN KEY fk_emp_dept;

*/

/*
===> 8️⃣ View FOREIGN KEY Constraints :

SHOW CREATE TABLE employees;

-- OR (advanced)
SELECT *
FROM information_schema.KEY_COLUMN_USAGE
WHERE table_name = 'employees';

*/

/*
===> 9️⃣ Common FOREIGN KEY Errors :

❌ Cannot add foreign key constraint
CAUSES :
- Parent column not PRIMARY/UNIQUE
- Data type mismatch
- Orphan records exist
- Parent table does not exist
- Engine is not InnoDB
*/

/*
===> 🔟 FOREIGN KEY vs JOIN (Important Concept) :

FOREIGN KEY :
✔ Data integrity
✔ Enforced by database
✔ Prevents invalid data

JOIN :
✔ Used for fetching data
✔ No integrity enforcement

Foreign key is NOT required to use JOIN
*/

/*
===> 1️⃣1️⃣ Best Practices :

✔ Always name foreign keys
✔ Use ON DELETE rules carefully
✔ Avoid CASCADE in critical tables
✔ Index foreign key columns
✔ Use foreign keys in production databases
*/

/*
===> 1️⃣2️⃣ Interview Points :

Q: Can NULL be inserted in foreign key?
✔ YES (unless NOT NULL)

Q: Can a table have multiple foreign keys?
✔ YES

Q: Can foreign key reference same table?
✔ YES (Self Join)

Q: Is foreign key mandatory?
✔ NO (but recommended)

*/
