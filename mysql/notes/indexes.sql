/****************************************************************************************
                                INDEXES – COMPLETE NOTES
                                (MySQL, With Results)
****************************************************************************************/

/*
INDEX = database object used to SPEED UP data retrieval

-> Index does NOT change table data
-> Index improves SELECT performance
-> Index slightly slows INSERT / UPDATE / DELETE
-> Index uses extra disk space

Think of INDEX like:
Book index → find page faster
Database index → find rows faster
*/


/*==============================================================================
                            SAMPLE TABLE
==============================================================================*/

/*
TABLE: users

id | name        | email              | city     | salary
---------------------------------------------------------
1  | Amit Patel  | amit@gmail.com     | Delhi    | 60000
2  | Ravi Shah   | ravi@yahoo.com     | Mumbai   | 45000
3  | Neha Joshi  | neha@gmail.com     | Delhi    | 30000
4  | Kiran Mehta | kiran@gmail.com    | Pune     | 25000
*/


/*==============================================================================
                            1. CREATE INDEX
==============================================================================*/

/*
Create a normal (NON-UNIQUE) index
*/

 /*
CREATE INDEX idx_city
ON users(city);
*/

/*
Effect :
Before index → full table scan
After index  → fast lookup on city
*/


/*==============================================================================
                            2. USING INDEX (SELECT)
==============================================================================*/

/*
Query :
SELECT * FROM users WHERE city = 'Delhi';

Result :
id | name        | city   | salary
-----------------------------------
1  | Amit Patel  | Delhi  | 60000
3  | Neha Joshi  | Delhi  | 30000

(Index idx_city is used)
*/


/*==============================================================================
                            3. UNIQUE INDEX
==============================================================================*/

/*
Ensures NO duplicate values
*/

 /*
CREATE UNIQUE INDEX idx_email
ON users(email);
*/

/*
Effect :
✔ Fast search
✔ Enforces uniqueness

Duplicate insert ❌ :
INSERT INTO users VALUES (5, 'Test', 'amit@gmail.com', 'Goa', 20000);

ERROR :
Duplicate entry 'amit@gmail.com'
*/


/*==============================================================================
                            4. COMPOSITE INDEX (MULTI-COLUMN)
==============================================================================*/

/*
Index on multiple columns
Order MATTERS
*/

 /*
CREATE INDEX idx_city_salary
ON users(city, salary);
*/

/*
Query :
SELECT * FROM users
WHERE city = 'Delhi' AND salary > 40000;

Result :
id | name       | salary
-------------------------
1  | Amit Patel | 60000

(Index is used)
*/


/*
Query using only salary :
SELECT * FROM users WHERE salary > 40000;

(Index NOT used fully)
*/


/*==============================================================================
                            5. PRIMARY KEY INDEX
==============================================================================*/

/*
PRIMARY KEY automatically creates UNIQUE INDEX
*/

 /*
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
*/

/*
Index name is auto-created
Search by PRIMARY KEY is fastest
*/


/*==============================================================================
                            6. FOREIGN KEY INDEX
==============================================================================*/

/*
MySQL automatically creates index
on FOREIGN KEY columns
*/

 /*
FOREIGN KEY (dept_id) REFERENCES departments(id);
*/


/*==============================================================================
                            7. SHOW INDEX
==============================================================================*/

/*
View indexes on table
*/

 /*
SHOW INDEX FROM users;
*/

/*
Result (example) :
Key_name       | Column_name | Non_unique
-----------------------------------------
PRIMARY        | id          | 0
idx_city       | city        | 1
idx_email      | email       | 0
idx_city_salary| city        | 1
idx_city_salary| salary     | 1
*/


/*==============================================================================
                            8. DROP INDEX
==============================================================================*/

/*
Remove index
*/

 /*
DROP INDEX idx_city ON users;
*/


/*==============================================================================
                            9. WHEN INDEX IS USED
==============================================================================*/

/*
Index is USED when:
✔ WHERE condition
✔ JOIN condition
✔ ORDER BY
✔ GROUP BY
✔ No leading wildcard

Example (Index used) :
SELECT * FROM users WHERE name LIKE 'A%';

Example (Index NOT used) :
SELECT * FROM users WHERE name LIKE '%A%';
*/


/*==============================================================================
                            10. EXPLAIN – CHECK INDEX USAGE
==============================================================================*/

/*
Use EXPLAIN to see query execution plan
*/

 /*
EXPLAIN SELECT * FROM users WHERE city = 'Delhi';
*/

/*
Important columns :
type  → index usage type
key   → index used
rows  → rows scanned

Good sign :
type = ref / range
Bad sign :
type = ALL (full table scan)
*/


/*==============================================================================
                            11. INDEX TYPES (INTERVIEW)
==============================================================================*/

/*
PRIMARY INDEX     → PRIMARY KEY
UNIQUE INDEX      → UNIQUE constraint
NORMAL INDEX      → performance
COMPOSITE INDEX   → multiple columns
FULLTEXT INDEX    → text search
SPATIAL INDEX     → spatial data
*/


/*==============================================================================
                            12. INDEX vs FULL SCAN
==============================================================================*/

/*
Without index :
-> Scan ALL rows
-> Slow for large tables

With index :
-> Scan only required rows
-> Very fast
*/


/*==============================================================================
                            13. COMMON MISTAKES
==============================================================================*/

/*
❌ Too many indexes
❌ Index on small table
❌ Index on frequently updated column
❌ Wrong column order in composite index
❌ Using functions on indexed column
   (WHERE UPPER(name) = 'AMIT')
*/


/*==============================================================================
                            14. BEST PRACTICES
==============================================================================*/

/*
✔ Index columns used in WHERE
✔ Index JOIN columns
✔ Use composite index wisely
✔ Remove unused indexes
✔ Always check with EXPLAIN
*/


/*==============================================================================
                            QUICK MEMORY MAP
==============================================================================*/

/*
INDEX → speed up SELECT
PRIMARY KEY → auto index
UNIQUE → no duplicates
COMPOSITE → order matters
EXPLAIN → check usage
LIKE 'A%' → index used
LIKE '%A%' → index ignored
*/
