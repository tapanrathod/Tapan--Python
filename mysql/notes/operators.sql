/*
===> 1. Arithmetic Operators : 

Used for mathematical calculations.

Operator - Meaning
+ -	Addition
- -	Subtraction
* -	Multiplication
/ -	Division
% or MOD -	Modulus (remainder)

Ex. : 
SELECT 10 + 5;        -- 15
SELECT 10 - 5;        -- 5
SELECT 10 * 5;        -- 50
SELECT 10 / 3;        -- 3.3333
SELECT 10 % 3;        -- 1

SELECT salary * 0.10 AS bonus FROM employees;
*/

/*
===> 2. Comparison (Relational) Operators : 

Used to compare values.

Operator - Meaning
= - Equal
!= or <> - Not equal
> - Greater than
< - Less than
>= - Greater than or equal
<= - Less than or equal
<=> - NULL-safe equal

Ex. : 
SELECT * FROM users WHERE age >= 18;
SELECT * FROM users WHERE status != 'active';

SELECT * FROM users WHERE email <=> NULL;
-> <=> works even with NULL
*/

/*
===> 3. Logical Operators

Used to combine conditions.

Operator - Meaning
AND - Both conditions true
OR - Any condition true
NOT - Negates condition

Ex. :

SELECT * FROM users
WHERE age >= 18 AND city = 'Delhi';

SELECT * FROM users
WHERE city = 'Mumbai' OR city = 'Pune';

SELECT * FROM users
WHERE NOT status = 'inactive';

*/

/*
===> 4.BETWEEN Operator

Used for range filtering (inclusive).

Ex. :
SELECT * FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-01-31';

SELECT * FROM employees
WHERE salary BETWEEN 30000 AND 60000;

*/

/*
===> 5.IN Operator : 

Used to match multiple values.

Ex. : 
SELECT * FROM users
WHERE city IN ('Delhi', 'Mumbai', 'Chennai');

With SUBQUERY : 
SELECT * FROM users
WHERE city IN ('Delhi', 'Mumbai', 'Chennai');

*/

/*
===> 6. LIKE Operator (Pattern Matching) : 

Used with wildcards.

Wildcard - Meaning
% - Any number of characters
_ - Exactly one character


Ex. : 
SELECT * FROM users WHERE name LIKE 'A%';
SELECT * FROM users WHERE name LIKE '%sh%';
SELECT * FROM users WHERE name LIKE '_a%';


*/

/*
===> 7️. REGEXP Operator (Advanced Pattern Matching) : 

SELECT * FROM users
WHERE email REGEXP '^[a-z0-9._%+-]+@[a-z]+\\.com$';

*/

/*
===> 8. IS NULL / IS NOT NULL :

Used to check NULL values.

SELECT * FROM users WHERE phone IS NULL;
SELECT * FROM users WHERE phone IS NOT NULL;

-> = NULL does NOT work

*/

/*
===> 9. EXISTS Operator :

Checks if a subquery returns rows.

SELECT * FROM users u
WHERE EXISTS (
SELECT 1 FROM orders o WHERE o.user_id = u.id
);

✔ Stops checking after first match
✔ Faster in many cases

*/

/*
===> 10. ANY / ALL Operators :

Used with subqueries.

ANY : 
SELECT * FROM products
WHERE price > ANY (SELECT price FROM products WHERE category='Electronics');

ALL : 
SELECT * FROM products
WHERE price > ALL (SELECT price FROM products WHERE category='Books');

*/

/*
===> 11. Assignment Operator :

Used mainly in variables & procedures.

SET @x := 10;
SELECT @x;

*/

/*
===> 12. String Operators : 

CONCAT
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users;

CONCAT_WS
SELECT CONCAT_WS('-', city, state, country) FROM users;

*/

/*
===> 13. Conditional Operators / Expressions : 

IF() :

SELECT IF(age >= 18, 'Adult', 'Minor') FROM users;

CASE :

SELECT
CASE
WHEN salary > 50000 THEN 'High'
WHEN salary >= 30000 THEN 'Medium'
ELSE 'Low'
END AS salary_level
FROM employees;

*/

/*
===> 14. Set Operators (Important Concept) :

MySQL supports:
UNION
UNION ALL

Operator - Duplicate Removal
UNION - Yes
UNION ALL - No

Ex. : 
SELECT city FROM customers
UNION
SELECT city FROM suppliers;

*/

/*
===> 15. Operator Precedence (Very Important) :

Order of execution:

1.()
2.* / %
3.+ -
4.Comparison (=, >, <)
5.NOT
6.AND
7.OR

*/

/*
==============================
LIKE Operator – Complete Guide
==============================

-> LIKE is used for PATTERN MATCHING in string data
-> Mostly used in WHERE clause
-> Works with WILDCARDS
-> Used to search partial values

SYNTAX :
SELECT * FROM table_name
WHERE column_name LIKE pattern;
*/

/*
===> 1️⃣ Wildcards Used in LIKE :

1. %  (Percent)
-> Matches ZERO or MORE characters

2. _  (Underscore)
-> Matches EXACTLY ONE character
*/

/*
===> 2️⃣ Basic LIKE Examples :

-- Starts with 'A'
SELECT * FROM users
WHERE name LIKE 'A%';

-- Ends with 'a'
SELECT * FROM users
WHERE name LIKE '%a';

-- Contains 'sh'
SELECT * FROM users
WHERE name LIKE '%sh%';

-- Exactly 3 characters
SELECT * FROM users
WHERE name LIKE '___';

-- Second character is 'a'
SELECT * FROM users
WHERE name LIKE '_a%';

*/

/*
===> 3️⃣ LIKE with Numbers (Converted to String) :

-- Works only after implicit string conversion
SELECT * FROM products
WHERE price LIKE '1%';

*/


/*
===> 4️⃣ Case Sensitivity in LIKE :

-> Case sensitivity depends on COLLATION
-> Default collation is case-insensitive

Case-insensitive (default) :
'a' LIKE 'A'  -> TRUE

Case-sensitive :
Use BINARY keyword

Ex. :
SELECT * FROM users
WHERE BINARY name LIKE 'A%';

*/

/*
===> 5️⃣ NOT LIKE :

SELECT * FROM users
WHERE name NOT LIKE 'A%';

*/

/*
===> 6️⃣ LIKE with ESCAPE (Special Characters) :

-> Used when searching %, _ literally

Ex. :
SELECT * FROM files
WHERE file_name LIKE '%\%%' ESCAPE '\';

-- Finds filenames containing %

*/

/*
===> 7️⃣ LIKE with WHERE + AND / OR :

SELECT * FROM users
WHERE name LIKE 'A%' 
AND city LIKE '%Delhi%';

*/

/*
===> 8️⃣ LIKE with JOIN (Real-World Usage) :

SELECT u.name, d.dept_name
FROM users u
JOIN departments d ON u.dept_id = d.id
WHERE d.dept_name LIKE '%Tech%';

*/

/*
===> 9️⃣ Performance Impact of LIKE :

Fast ✅ :
LIKE 'A%'

Slow ❌ :
LIKE '%A%'
LIKE '%A'

Reason :
-> Leading wildcard disables index usage
*/

/*
===> 🔟 LIKE vs = (Important Difference) :

=  -> Exact match
LIKE -> Pattern match

Ex. :
name = 'Amit'      -> only Amit
name LIKE 'Amit%'  -> Amit, Amith, Amitabh
*/

/*
===> 1️⃣1️⃣ LIKE vs REGEXP :

LIKE :
✔ Simple
✔ Fast
✔ Limited patterns

REGEXP :
✔ Powerful patterns
❌ Slower

Ex. REGEXP :
SELECT * FROM users
WHERE email REGEXP '^[a-z0-9._%+-]+@[a-z]+\\.com$';

*/

/*
===> 1️⃣2️⃣ Common Mistakes :

❌ Using LIKE for exact match
❌ Forgetting wildcard
❌ Expecting LIKE to work fast with % at start
❌ Using LIKE with numeric logic
*/

/*
===> 1️⃣3️⃣ Interview Questions :

Q: Does LIKE support indexes?
✔ YES (only without leading %)

Q: Can LIKE match numbers?
✔ YES (converted to string)

Q: Difference between % and _ ?
✔ % → any length
✔ _ → exactly one character
*/


/*
===> 1️⃣4️⃣ Real-World Use Cases :

✔ Search box
✔ Filter names
✔ Email/domain search
✔ Partial match reports
*/

/*
===> 🔥 Quick Cheat Sheet :

'A%'   -> starts with A
'%a'   -> ends with a
'%sh%' -> contains sh
'_a%'  -> second letter a
'___'  -> exactly 3 letters
*/