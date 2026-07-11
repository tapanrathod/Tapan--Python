/****************************************************************************************
                        STRING FUNCTIONS – WITH RESULTS
****************************************************************************************/

/*
TABLE: users

id | name        | email              | city
-----------------------------------------------
1  | Amit Patel  | amit@gmail.com     | Delhi
2  | Ravi Shah   | ravi@yahoo.com     | Mumbai
3  | Neha Joshi  | neha@gmail.com     | NULL
*/


/*
1. CONCAT() – Join strings
*/
 /*
SELECT CONCAT(name, ' - ', city) FROM users;
*/

/*
Result:
Amit Patel - Delhi
Ravi Shah - Mumbai
NULL
*/


/*
2. CONCAT_WS() – Ignore NULL
*/
 /*
SELECT CONCAT_WS(' | ', name, city) FROM users;
*/

/*
Result:
Amit Patel | Delhi
Ravi Shah | Mumbai
Neha Joshi
*/


/*
3. LENGTH() vs CHAR_LENGTH()
*/
 /*
SELECT name, LENGTH(name), CHAR_LENGTH(name) FROM users;
*/


/*
4. UPPER() / LOWER()
*/
 /*
SELECT UPPER(name), LOWER(email) FROM users;
*/


/*
5. SUBSTRING()
*/
 /*
SELECT SUBSTRING(name, 1, 4) FROM users;
*/

/*
Result:
Amit
Ravi
Neha
*/


/*
6. TRIM()
*/
 /*
SELECT TRIM('   Hello SQL   ');
*/

/*
Result:
Hello SQL
*/


/*
7. REPLACE()
*/
 /*
SELECT REPLACE(email, 'gmail.com', 'company.com') FROM users;
*/


/*
8. INSTR()
*/
 /*
SELECT INSTR(email, '@') FROM users;
*/
