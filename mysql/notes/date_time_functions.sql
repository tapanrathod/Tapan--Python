/****************************************************************************************
                        DATE & TIME FUNCTIONS – WITH RESULTS
****************************************************************************************/

/*
TABLE: users

id | join_date  | last_login
-----------------------------------------
1  | 2023-01-10 | 2024-12-20 10:30:00
2  | 2023-03-15 | 2024-12-21 09:00:00
3  | 2023-06-01 | NULL
*/


/*
1. NOW()
*/
 /*
SELECT NOW();
*/

/*
Result:
2026-01-19 11:30:00 (example)
*/


/*
2. CURDATE() / CURTIME()
*/
 /*
SELECT CURDATE(), CURTIME();
*/


/*
3. YEAR(), MONTH(), DAY()
*/
 /*
SELECT YEAR(join_date), MONTH(join_date), DAY(join_date) FROM users;
*/


/*
4. DATE_FORMAT()
*/
 /*
SELECT DATE_FORMAT(join_date, '%d-%m-%Y') FROM users;
*/


/*
5. DATEDIFF()
*/
 /*
SELECT DATEDIFF(CURDATE(), join_date) FROM users;
*/


/*
6. DATE_ADD()
*/
 /*
SELECT DATE_ADD(join_date, INTERVAL 1 YEAR) FROM users;
*/


/*
7. TIMESTAMPDIFF()
*/
 /*
SELECT TIMESTAMPDIFF(YEAR, join_date, CURDATE()) FROM users;
*/
