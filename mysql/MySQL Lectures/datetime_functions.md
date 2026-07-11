
# MySQL Date and Time Functions (MySQL 8.x)

---

# 1. Current Date and Time Functions

| Function                | Description                                   |
| ----------------------- | --------------------------------------------- |
| `NOW()`               | Returns the current date and time             |
| `CURRENT_TIMESTAMP()` | Returns the current date and time             |
| `LOCALTIME()`         | Returns the current local date and time       |
| `LOCALTIMESTAMP()`    | Returns the current local timestamp           |
| `CURDATE()`           | Returns the current date                      |
| `CURRENT_DATE()`      | Returns the current date                      |
| `CURTIME()`           | Returns the current time                      |
| `CURRENT_TIME()`      | Returns the current time                      |
| `SYSDATE()`           | Returns the system date and time at execution |
| `UTC_DATE()`          | Returns the current UTC date                  |
| `UTC_TIME()`          | Returns the current UTC time                  |
| `UTC_TIMESTAMP()`     | Returns the current UTC date and time         |

### Example

```sql
SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
```

---

# 2. Date Extraction Functions

| Function              | Description                        |
| --------------------- | ---------------------------------- |
| `YEAR(date)`        | Returns the year                   |
| `MONTH(date)`       | Returns the month number (1–12)   |
| `MONTHNAME(date)`   | Returns the month name             |
| `DAY(date)`         | Returns the day of the month       |
| `DAYOFMONTH(date)`  | Returns the day of the month       |
| `DAYOFWEEK(date)`   | Returns the weekday (1=Sunday)     |
| `DAYOFYEAR(date)`   | Returns the day number in the year |
| `DAYNAME(date)`     | Returns the weekday name           |
| `WEEK(date)`        | Returns the week number            |
| `WEEKDAY(date)`     | Returns weekday (0=Monday)         |
| `WEEKOFYEAR(date)`  | Returns the week number            |
| `YEARWEEK(date)`    | Returns the year and week          |
| `QUARTER(date)`     | Returns the quarter (1–4)         |
| `HOUR(time)`        | Returns the hour                   |
| `MINUTE(time)`      | Returns the minute                 |
| `SECOND(time)`      | Returns the second                 |
| `MICROSECOND(expr)` | Returns the microseconds           |

### Example

```sql
SELECT YEAR('2026-07-04');
SELECT MONTH(NOW());
SELECT DAYNAME(NOW());
SELECT HOUR(NOW());
```

---

# 3. Date Arithmetic Functions

| Function                                      | Description                                    |
| --------------------------------------------- | ---------------------------------------------- |
| `DATE_ADD(date, INTERVAL value unit)`       | Adds an interval to a date                     |
| `ADDDATE()`                                 | Adds days or an interval                       |
| `DATE_SUB(date, INTERVAL value unit)`       | Subtracts an interval from a date              |
| `SUBDATE()`                                 | Subtracts days or an interval                  |
| `DATEDIFF(date1, date2)`                    | Returns the difference in days                 |
| `TIMESTAMPDIFF(unit, datetime1, datetime2)` | Returns the difference in a specified unit     |
| `TIMESTAMPADD(unit, value, datetime)`       | Adds an interval to a timestamp                |
| `ADDTIME(expr1, expr2)`                     | Adds time values                               |
| `SUBTIME(expr1, expr2)`                     | Subtracts time values                          |
| `TIMEDIFF(expr1, expr2)`                    | Returns the difference between two time values |

### Example

```sql
SELECT DATE_ADD(NOW(), INTERVAL 10 DAY);
SELECT DATE_SUB(NOW(), INTERVAL 2 MONTH);
SELECT DATEDIFF('2026-12-31', '2026-01-01');
SELECT TIMESTAMPDIFF(YEAR, '2000-01-01', NOW());
```

---

# 4. Date Formatting and Parsing Functions

| Function                      | Description                 |
| ----------------------------- | --------------------------- |
| `DATE_FORMAT(date, format)` | Formats a date              |
| `TIME_FORMAT(time, format)` | Formats a time              |
| `STR_TO_DATE(str, format)`  | Converts a string to a date |

### Example

```sql
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y');
SELECT STR_TO_DATE('04-07-2026', '%d-%m-%Y');
```

---

# 5. Date Conversion Functions

| Function                   | Description                        |
| -------------------------- | ---------------------------------- |
| `DATE(expr)`             | Extracts the date part             |
| `TIME(expr)`             | Extracts the time part             |
| `TIMESTAMP(expr)`        | Creates or converts to a timestamp |
| `CAST(expr AS DATE)`     | Converts to DATE                   |
| `CAST(expr AS DATETIME)` | Converts to DATETIME               |
| `CONVERT(expr, type)`    | Converts data type                 |

### Example

```sql
SELECT DATE(NOW());
SELECT TIME(NOW());
SELECT CAST('2026-07-04' AS DATE);
```

---

# 6. Unix Timestamp Functions

| Function                     | Description                           |
| ---------------------------- | ------------------------------------- |
| `UNIX_TIMESTAMP()`         | Returns the current Unix timestamp    |
| `UNIX_TIMESTAMP(date)`     | Converts a date to a Unix timestamp   |
| `FROM_UNIXTIME(timestamp)` | Converts a Unix timestamp to DATETIME |

### Example

```sql
SELECT UNIX_TIMESTAMP();
SELECT FROM_UNIXTIME(1783123200);
```

---

# 7. Date Creation Functions

| Function                           | Description                             |
| ---------------------------------- | --------------------------------------- |
| `MAKEDATE(year, dayofyear)`      | Creates a date from year and day number |
| `MAKETIME(hour, minute, second)` | Creates a time                          |
| `TIMESTAMP(date, time)`          | Creates a timestamp                     |

### Example

```sql
SELECT MAKEDATE(2026, 185);
SELECT MAKETIME(10, 30, 45);
SELECT TIMESTAMP('2026-07-04', '10:30:45');
```

---

# 8. Utility Functions

| Function                    | Description                                   |
| --------------------------- | --------------------------------------------- |
| `LAST_DAY(date)`          | Returns the last day of the month             |
| `TO_DAYS(date)`           | Returns the number of days since year 0       |
| `FROM_DAYS(days)`         | Converts day number to a date                 |
| `TO_SECONDS(expr)`        | Returns the number of seconds since year 0    |
| `SEC_TO_TIME(seconds)`    | Converts seconds to time                      |
| `TIME_TO_SEC(time)`       | Converts time to seconds                      |
| `EXTRACT(unit FROM date)` | Extracts a specified part from a date or time |

### Example

```sql
SELECT LAST_DAY(NOW());
SELECT SEC_TO_TIME(3600);
SELECT TIME_TO_SEC('01:30:00');
SELECT EXTRACT(YEAR FROM NOW());
```

---

# 9. Interval Units

These units are used with `DATE_ADD()`, `DATE_SUB()`, `TIMESTAMPADD()`, and `TIMESTAMPDIFF()`.

- `MICROSECOND`
- `SECOND`
- `MINUTE`
- `HOUR`
- `DAY`
- `WEEK`
- `MONTH`
- `QUARTER`
- `YEAR`
- `SECOND_MICROSECOND`
- `MINUTE_MICROSECOND`
- `MINUTE_SECOND`
- `HOUR_MICROSECOND`
- `HOUR_SECOND`
- `HOUR_MINUTE`
- `DAY_MICROSECOND`
- `DAY_SECOND`
- `DAY_MINUTE`
- `DAY_HOUR`
- `YEAR_MONTH`

### Example

```sql
SELECT DATE_ADD(NOW(), INTERVAL 5 DAY);
SELECT DATE_ADD(NOW(), INTERVAL 3 MONTH);
SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR);
```

---

# 10. Most Frequently Used MySQL Date & Time Functions

- `NOW()`
- `CURDATE()`
- `CURTIME()`
- `DATE()`
- `TIME()`
- `YEAR()`
- `MONTH()`
- `DAY()`
- `HOUR()`
- `MINUTE()`
- `SECOND()`
- `DATE_ADD()`
- `DATE_SUB()`
- `DATEDIFF()`
- `TIMESTAMPDIFF()`
- `DATE_FORMAT()`
- `STR_TO_DATE()`
- `LAST_DAY()`
- `DAYNAME()`
- `MONTHNAME()`
- `EXTRACT()`
- `UNIX_TIMESTAMP()`
- `FROM_UNIXTIME()`

---

# Summary

## Current Date & Time

- `NOW()`
- `CURDATE()`
- `CURTIME()`
- `SYSDATE()`
- `CURRENT_TIMESTAMP()`

## Extract Date Parts

- `YEAR()`
- `MONTH()`
- `DAY()`
- `DAYNAME()`
- `MONTHNAME()`
- `HOUR()`
- `MINUTE()`
- `SECOND()`
- `EXTRACT()`

## Date Arithmetic

- `DATE_ADD()`
- `DATE_SUB()`
- `DATEDIFF()`
- `TIMESTAMPADD()`
- `TIMESTAMPDIFF()`

## Formatting

- `DATE_FORMAT()`
- `TIME_FORMAT()`
- `STR_TO_DATE()`

## Conversion

- `CAST()`
- `CONVERT()`
- `DATE()`
- `TIME()`
- `TIMESTAMP()`

## Utilities

- `LAST_DAY()`
- `MAKEDATE()`
- `MAKETIME()`
- `SEC_TO_TIME()`
- `TIME_TO_SEC()`
- `UNIX_TIMESTAMP()`
- `FROM_UNIXTIME()`
