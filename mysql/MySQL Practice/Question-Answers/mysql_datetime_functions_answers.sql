-- Active: 1782301937005@@127.0.0.1@3306@datetime_fun

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male','Female'),
    city VARCHAR(50),
    state VARCHAR(50),
    join_date DATE
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    order_time TIME,
    order_datetime DATETIME,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- here REFERENCES means FOREIGN Key
);

-- Database
USE datetime_fun;



-- Tables Show
SHOW TABLES FROM datetime_fun;

-- # MySQL Date & Time Functions - Practice Questions


-- ## CURRENT_DATE() / CURDATE()

-- 1. Write a MySQL query to Display the current date.
SELECT CURRENT_DATE();

-- 2. Write a MySQL query to Display the current date with alias Today.
SELECT CURRENT_DATE() AS Today;

-- 3. Write a MySQL query to Compare CURDATE() and CURRENT_DATE().
SELECT CURDATE() = CURRENT_DATE();

-- 4. Write a MySQL query to Display tomorrow's date.
SELECT DATE_ADD(CURDATE(), INTERVAL 1 DAY);

-- 5. Write a MySQL query to Display yesterday's date.
SELECT DATE_SUB(CURDATE(), INTERVAL 1 DAY);

-- 6. Write a MySQL query to Extract current year.
SELECT YEAR(CURDATE());

-- 7. Write a MySQL query to Extract current month.
SELECT MONTH(CURDATE());

-- 8. Write a MySQL query to Extract current day.
SELECT DAY(CURDATE());

-- 9. Write a MySQL query to Display weekday name.
SELECT DAYNAME(CURDATE());

-- 10. Write a MySQL query to Format current date.
SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y');


-- ## CURRENT_TIME() / CURTIME()

-- 11. Write a MySQL query to Display current time.
SELECT CURRENT_TIME();

-- 12. Write a MySQL query to Alias current time.
SELECT CURRENT_TIME() AS CurrentTime;

-- 13. Write a MySQL query to Extract hour.
SELECT HOUR(CURTIME());

-- 14. Write a MySQL query to Extract minute.
SELECT MINUTE(CURTIME());

-- 15. Write a MySQL query to Extract second.
SELECT SECOND(CURTIME());

-- 16. Write a MySQL query to 12-hour format.
SELECT DATE_FORMAT(CURTIME(), '%h:%i:%s %p');

-- 17. Write a MySQL query to Add 30 minutes.
SELECT DATE_ADD(CURTIME(), INTERVAL 30 MINUTE);

-- 18. Write a MySQL query to Subtract 1 hour.
SELECT DATE_SUB(CURTIME(), INTERVAL 1 HOUR);


-- ## CURRENT_TIMESTAMP() / NOW()

-- 19. Write a MySQL query to Display current timestamp.
SELECT CURRENT_TIMESTAMP();

-- 20. Write a MySQL query to Compare NOW() and CURRENT_TIMESTAMP().
SELECT NOW(), CURRENT_TIMESTAMP();

-- 21. Write a MySQL query to Extract date.
SELECT DATE(NOW());

-- 22. Write a MySQL query to Extract time.
SELECT TIME(NOW());

-- 23. Write a MySQL query to Add 2 days.
SELECT NOW() + INTERVAL 2 DAY;

-- 24. Write a MySQL query to Subtract 5 hours.
SELECT NOW() - INTERVAL 5 HOUR;

-- 25. Write a MySQL query to Format timestamp.
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');

-- 26. Write a MySQL query to Display month name.
SELECT MONTHNAME(CURDATE());

-- 27. Write a MySQL query to Display weekday.
SELECT WEEKDAY(CURDATE());

-- 28. Write a MySQL query to Difference from fixed timestamp.
SELECT TIMEDIFF(NOW(), '2026-01-01 00:00:00');


-- ## UTC_DATE()/UTC_TIME()/UTC_TIMESTAMP()

-- 29. Write a MySQL query to Display UTC date.
SELECT UTC_DATE();

-- 30. Write a MySQL query to Display UTC time.
SELECT UTC_TIME();

-- 31. Write a MySQL query to Display UTC timestamp.
SELECT UTC_TIMESTAMP();

-- 32. Write a MySQL query to Compare NOW() and UTC_TIMESTAMP().
SELECT NOW() = UTC_TIMESTAMP();

-- 33. Write a MySQL query to Format UTC timestamp.
SELECT DATE_FORMAT(UTC_TIMESTAMP(), '%Y-%m-%d %H:%i:%s');

-- 34. Write a MySQL query to Extract UTC hour.
SELECT HOUR(UTC_TIME());


-- ## DATE()

-- 35. Write a MySQL query to Extract date from datetime.
SELECT DATE(NOW());

-- 36. Write a MySQL query to Show only date.
SELECT DATE(CURDATE());

-- 37. Write a MySQL query to Compare DATE() with CURDATE().
SELECT DATE(NOW()) = CURDATE();

-- 38. Write a MySQL query to Today's records.
SELECT * FROM orders WHERE DATE(order_datetime) = CURDATE();

-- 39. Write a MySQL query to Extract date from NOW().
SELECT DATE(NOW());

-- 40. Write a MySQL query to Distinct dates.
SELECT DISTINCT DATE(order_datetime), product_name FROM orders;
SELECT DISTINCT MONTHNAME(order_datetime), product_name FROM orders;
SELECT DISTINCT MONTHNAME(order_datetime) FROM orders;

SELECT DATE(order_datetime),product_name FROM orders;
SELECT MONTHNAME(order_datetime) FROM orders;

-- 41. Write a MySQL query to Count by date.
SELECT DATE(order_datetime), COUNT(*) FROM orders GROUP BY DATE(order_datetime);

-- 42. Write a MySQL query to Earliest date.
SELECT MIN(order_datetime) FROM orders;


-- ## TIME()

-- 43. Write a MySQL query to Extract time from datetime.
SELECT TIME(NOW());

-- 44. Write a MySQL query to Show only time.
SELECT TIME(CURTIME());

-- 45. Write a MySQL query to Time from NOW().
SELECT TIME(NOW());

-- 46. Write a MySQL query to After 18:00.
SELECT * FROM orders WHERE TIME(order_time) > '18:00:00';

-- 47. Write a MySQL query to Before 09:00.
SELECT * FROM orders WHERE TIME(order_time) < '09:00:00';

-- 48. Write a MySQL query to Distinct times.
SELECT DISTINCT TIME(order_datetime) FROM orders;


-- ## YEAR()/MONTH()/MONTHNAME()/DAY()/DAYNAME()

-- 49. Write a MySQL query to Extract year.
SELECT YEAR(CURDATE());

-- 50. Write a MySQL query to Extract month.
SELECT MONTH(CURDATE());

-- 51. Write a MySQL query to Month name.
SELECT MONTHNAME(CURDATE());

-- 52. Write a MySQL query to Day of month.
SELECT DAY(CURDATE());

-- 53. Write a MySQL query to Weekday name.
SELECT DAYNAME(CURDATE());

-- 54. Write a MySQL query to Orders in 2025.
SELECT * FROM orders WHERE YEAR(order_datetime) = 2025;

-- 55. Write a MySQL query to January records.
SELECT * FROM orders WHERE MONTH(order_datetime) = 1;

-- 56. Write a MySQL query to Count by month.
SELECT MONTH(order_datetime), COUNT(*) FROM orders GROUP BY MONTH(order_datetime);

-- 57. Write a MySQL query to Count by weekday.
SELECT DAYNAME(order_datetime), COUNT(*) FROM orders GROUP BY DAYNAME(order_datetime);

-- 58. Write a MySQL query to Joined Monday.
SELECT * FROM orders WHERE DAYNAME(order_datetime) = 'Monday';

-- 59. Write a MySQL query to December records.
SELECT * FROM orders WHERE MONTH(order_datetime) = 12;

-- 60. Write a MySQL query to Sort by month.
SELECT * FROM orders ORDER BY MONTH(order_datetime);


-- ## HOUR()/MINUTE()/SECOND()

-- 61. Write a MySQL query to Extract hour.
SELECT HOUR(order_time) FROM orders;

-- 62. Write a MySQL query to Extract minute.
SELECT MINUTE(order_time) FROM orders;

-- 63. Write a MySQL query to Extract second.
SELECT SECOND(order_time) FROM orders;

-- 64. Write a MySQL query to After 6 PM.
SELECT * FROM orders WHERE HOUR(order_time) > 18;

-- 65. Write a MySQL query to Before 10 AM.
SELECT * FROM orders WHERE HOUR(order_time) < 10;

-- 66. Write a MySQL query to Count by hour.
SELECT HOUR(order_time), COUNT(*) FROM orders GROUP BY HOUR(order_time);

-- 67. Write a MySQL query to 12th hour.
SELECT DATE_FORMAT(order_time, '%h %p') FROM orders;

-- 68. Write a MySQL query to Sort by hour.
SELECT * FROM orders ORDER BY HOUR(order_time);


-- ## DATE_FORMAT()

-- 69. Write a MySQL query to DD-MM-YYYY.
SELECT DATE_FORMAT(order_datetime, '%d-%m-%Y') FROM orders;

-- 70. Write a MySQL query to DD/MM/YYYY.
SELECT DATE_FORMAT(order_datetime, '%d/%m/%Y') FROM orders;

-- 71. Write a MySQL query to Month DD, YYYY.
SELECT DATE_FORMAT(order_datetime, '%M %d, %Y') FROM orders;

-- 72. Write a MySQL query to YYYY/MM/DD.
SELECT DATE_FORMAT(order_datetime, '%Y/%m/%d') FROM orders;

-- 73. Write a MySQL query to Weekday and month.
SELECT DATE_FORMAT(order_datetime, '%W, %M') FROM orders;

-- 74. Write a MySQL query to Datetime with time.
SELECT DATE_FORMAT(order_datetime, '%Y-%m-%d %H:%i:%s') FROM orders;

-- 75. Write a MySQL query to Month-Year.
SELECT DATE_FORMAT(order_datetime, '%M-%Y') FROM orders;

-- 76. Write a MySQL query to 12-hour AM/PM.
SELECT DATE_FORMAT(order_time, '%h %p') FROM orders;

-- 77. Write a MySQL query to Abbreviated month.
SELECT DATE_FORMAT(order_datetime, '%b') FROM orders;

-- 78. Write a MySQL query to Formatted report.
SELECT CONCAT(first_name, ' joined on ', DATE_FORMAT(join_date, '%W, %D %M %Y')) AS Report FROM customers;


-- ## DATE_ADD()/DATE_SUB()

-- 79. Write a MySQL query to Add 7 days.
SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY);

-- 80. Write a MySQL query to Add 1 month.
SELECT DATE_ADD(order_date, INTERVAL 1 MONTH) FROM orders;

-- 81. Write a MySQL query to Add 1 year.
SELECT DATE_ADD(order_date, INTERVAL 1 YEAR) FROM orders;

-- 82. Write a MySQL query to Subtract 10 days.
SELECT DATE_SUB(CURDATE(), INTERVAL 10 DAY);

-- 83. Write a MySQL query to Subtract 2 months.
SELECT DATE_SUB(order_date, INTERVAL 2 MONTH) FROM orders;

-- 84. Write a MySQL query to Subtract 1 year.
SELECT DATE_SUB(order_date, INTERVAL 1 YEAR) FROM orders;

-- 85. Write a MySQL query to Add 5 hours.
SELECT DATE_ADD(order_datetime, INTERVAL 5 HOUR) FROM orders;

-- 86. Write a MySQL query to Subtract 30 minutes.
SELECT DATE_SUB(order_datetime, INTERVAL 30 MINUTE) FROM orders;

-- 87. Write a MySQL query to Delivery after 15 days.
SELECT order_date, DATE_ADD(order_date, INTERVAL 15 DAY) AS delivery_date FROM orders;

-- 88. Write a MySQL query to Reminder before 3 days.
SELECT order_date, DATE_SUB(order_date, INTERVAL 3 DAY) AS reminder_date FROM orders;


-- ## DATEDIFF()

-- 89. Write a MySQL query to Days since join.
SELECT customer_id, DATEDIFF(CURDATE(), join_date) AS days_since_join FROM customers;

-- 90. Write a MySQL query to Days since order.
SELECT order_id, DATEDIFF(CURDATE(), order_date) AS days_since_order FROM orders;

-- 91. Write a MySQL query to Days between two dates.
SELECT DATEDIFF('2026-12-31', '2026-01-01');

-- 92. Write a MySQL query to Older than 365 days.
SELECT * FROM customers WHERE DATEDIFF(CURDATE(), join_date) > 365;

-- 93. Write a MySQL query to Newest using DATEDIFF.
SELECT * FROM customers WHERE DATEDIFF(CURDATE(), join_date) = (SELECT MAX(DATEDIFF(CURDATE(), join_date)) FROM customers);

-- 94. Write a MySQL query to Age in days.
SELECT customer_id, DATEDIFF(CURDATE(), join_date) / 365 AS age_in_days FROM customers;


-- ## TIMESTAMPDIFF()

-- 95. Write a MySQL query to Difference in years.
SELECT * FROM orders ORDER BY DATEDIFF(CURDATE(), order_date) ASC LIMIT 1;

-- 96. Write a MySQL query to Difference in months.
SELECT * FROM orders ORDER BY DATEDIFF(CURDATE(), order_date) ASC LIMIT 1;

-- 97. Write a MySQL query to Difference in days.
SELECT * FROM orders ORDER BY DATEDIFF(CURDATE(), order_date) ASC LIMIT 1;

-- 98. Write a MySQL query to Difference in hours.
SELECT * FROM orders ORDER BY DATEDIFF(CURDATE(), order_date) ASC LIMIT 1;

-- 99. Write a MySQL query to Difference in minutes.
SELECT order_id, TIMESTAMPDIFF(MINUTE, order_datetime, NOW()) AS minutes_passed FROM orders;

-- 100. Write a MySQL query to Difference in seconds.
SELECT order_id, TIMESTAMPDIFF(SECOND, order_datetime, NOW()) AS seconds_passed FROM orders;