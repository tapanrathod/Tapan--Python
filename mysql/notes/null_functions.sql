/****************************************************************************************
                        NULL FUNCTIONS – WITH RESULTS
****************************************************************************************/

/*
TABLE: users

id | name        | salary | bonus | city
-----------------------------------------
1  | Amit Patel  | 60000  | NULL  | Delhi
2  | Ravi Shah   | 45000  | 5000  | Mumbai
3  | Neha Joshi  | 30000  | NULL  | NULL
*/


/*
1. IS NULL
*/
 /*
SELECT name FROM users WHERE city IS NULL;
*/

/*
Result:
Neha Joshi
*/


/*
2. IS NOT NULL
*/
 /*
SELECT name FROM users WHERE bonus IS NOT NULL;
*/

/*
Result:
Ravi Shah
*/


/*
3. IFNULL()
*/
 /*
SELECT name, IFNULL(bonus, 0) FROM users;
*/

/*
Result:
Amit Patel | 0
Ravi Shah  | 5000
Neha Joshi | 0
*/


/*
4. COALESCE()
*/
 /*
SELECT name, COALESCE(bonus, salary, 0) FROM users;
*/

/*
Result:
Amit Patel | 60000
Ravi Shah  | 5000
Neha Joshi | 30000
*/


/*
5. NULLIF()
*/
 /*
SELECT name, NULLIF(salary, 30000) FROM users;
*/

/*
Result:
Amit Patel | 60000
Ravi Shah  | 45000
Neha Joshi | NULL
*/
