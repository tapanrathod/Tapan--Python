# MySQL Operators

MySQL operators are symbols or keywords used to perform operations on values, columns, or expressions.

---

# 1. Arithmetic Operators

Used for mathematical calculations.

| Operator  | Description         | Example               | Output |
| --------- | ------------------- | --------------------- | -----: |
| `+`     | Addition            | `SELECT 10 + 5;`    |     15 |
| `-`     | Subtraction         | `SELECT 10 - 5;`    |      5 |
| `*`     | Multiplication      | `SELECT 10 * 5;`    |     50 |
| `/`     | Division            | `SELECT 10 / 5;`    |      2 |
| `%`     | Modulus (Remainder) | `SELECT 10 % 3;`    |      1 |
| `MOD()` | Modulus Function    | `SELECT MOD(10,3);` |      1 |

### Examples

```sql
SELECT 15 + 10;
SELECT 20 - 8;
SELECT 7 * 6;
SELECT 20 / 5;
SELECT 17 % 5;
```

---

# 2. Comparison (Relational) Operators

Used to compare two values.

| Operator | Description              | Example             |
| -------- | ------------------------ | ------------------- |
| `=`    | Equal To                 | `Salary = 50000`  |
| `!=`   | Not Equal To             | `Salary != 50000` |
| `<>`   | Not Equal To             | `Salary <> 50000` |
| `>`    | Greater Than             | `Salary > 50000`  |
| `<`    | Less Than                | `Salary < 50000`  |
| `>=`   | Greater Than or Equal To | `Salary >= 50000` |
| `<=`   | Less Than or Equal To    | `Salary <= 50000` |

### Example

```sql
SELECT *
FROM Employees
WHERE Salary >= 60000;
```

---

# 3. Logical Operators

Used to combine multiple conditions.

| Operator | Description                         | Example                                |
| -------- | ----------------------------------- | -------------------------------------- |
| `AND`  | All conditions must be TRUE         | `Salary > 50000 AND Age > 30`        |
| `OR`   | At least one condition must be TRUE | `Department='IT' OR Department='HR'` |
| `NOT`  | Reverses a condition                | `NOT Department='Sales'`             |
| `XOR`  | Exactly one condition must be TRUE  | `Age > 30 XOR Salary > 70000`        |

### Example

```sql
SELECT *
FROM Employees
WHERE Department='IT'
AND Salary > 60000;
```

---

# 4. Assignment Operator

Used to assign values to variables.

| Operator | Description  | Example            |
| -------- | ------------ | ------------------ |
| `:=`   | Assign Value | `SET @x := 100;` |

### Example

```sql
SET @salary := 50000;
SELECT @salary;
```

---

# 5. Bitwise Operators

Used for binary operations.

| Operator | Description | Example            | Output |
| -------- | ----------- | ------------------ | -----: |
| `&`    | Bitwise AND | `SELECT 5 & 3;`  |      1 |
| `\|`    | Bitwise OR  | `SELECT 5 \| 3;`  |      7 |
| `^`    | Bitwise XOR | `SELECT 5 ^ 3;`  |      6 |
| `~`    | Bitwise NOT | `SELECT ~5;`     |     -6 |
| `<<`   | Left Shift  | `SELECT 5 << 1;` |     10 |
| `>>`   | Right Shift | `SELECT 5 >> 1;` |      2 |

---

# 6. BETWEEN Operator

Checks whether a value lies within a range.

### Syntax

```sql
SELECT *
FROM Employees
WHERE Salary BETWEEN 50000 AND 70000;
```

Equivalent to

```sql
Salary >= 50000 AND Salary <= 70000
```

---

# 7. IN Operator

Checks if a value exists in a list.

### Example

```sql
SELECT *
FROM Employees
WHERE Department IN ('IT','HR','Finance');
```

---

# 8. NOT IN Operator

Checks if a value does **not** exist in a list.

### Example

```sql
SELECT *
FROM Employees
WHERE Department NOT IN ('IT','HR');
```

---

# 9. LIKE Operator

Used for pattern matching.

| Pattern | Meaning                 |
| ------- | ----------------------- |
| `%`   | Zero or More Characters |
| `_`   | Exactly One Character   |

### Examples

Names starting with **A**

```sql
SELECT *
FROM Employees
WHERE EmployeeName LIKE 'A%';
```

Names ending with **a**

```sql
SELECT *
FROM Employees
WHERE EmployeeName LIKE '%a';
```

Names whose second letter is **m**

```sql
SELECT *
FROM Employees
WHERE EmployeeName LIKE '_m%';
```

---

# 10. IS NULL

Checks for NULL values.

```sql
SELECT *
FROM Employees
WHERE Salary IS NULL;
```

---

# 11. IS NOT NULL

Checks for non-NULL values.

```sql
SELECT *
FROM Employees
WHERE Salary IS NOT NULL;
```

---

# 12. EXISTS Operator

Returns TRUE if the subquery returns at least one row.

```sql
SELECT *
FROM Employees
WHERE EXISTS (
    SELECT *
    FROM Employees
    WHERE Salary > 90000
);
```

---

# 13. ANY Operator

Compares a value with **any** value returned by a subquery.

### Example

```sql
SELECT *
FROM Employees
WHERE Salary > ANY (
    SELECT Salary
    FROM Employees
    WHERE Department='HR'
);
```

---

# 14. ALL Operator

Compares a value with **all** values returned by a subquery.

### Example

```sql
SELECT *
FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE Department='HR'
);
```

---

# 15. DISTINCT Keyword

Returns only unique values.

```sql
SELECT DISTINCT Department
FROM Employees;
```

---

# 16. REGEXP Operator

Used for advanced pattern matching.	

Names starting with A, B, or C

```sql
SELECT *
FROM Employees
WHERE EmployeeName REGEXP '^[ABC]';
```

Names ending with a

```sql
SELECT *
FROM Employees
WHERE EmployeeName REGEXP 'a$';
```

---

# Operator Precedence (Highest to Lowest)

| Priority | Operators                                                                                                   |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| 1        | `()` (Parentheses)                                                                                        |
| 2        | `BINARY`, `COLLATE`                                                                                     |
| 3        | `!`, `NOT`                                                                                              |
| 4        | `*`, `/`, `%`, `DIV`, `MOD`                                                                       |
| 5        | `+`, `-`                                                                                                |
| 6        | `<<`, `>>`                                                                                              |
| 7        | `&`                                                                                                       |
| 8        | `^`                                                                                                       |
| 9        | `\|`                                                                                                       |
| 10       | `=`, `>`, `<`, `>=`, `<=`, `!=`, `<>`, `LIKE`, `IN`, `BETWEEN`, `IS NULL`, `REGEXP` |
| 11       | `AND`, `&&`                                                                                             |
| 12       | `XOR`                                                                                                     |
| 13       | `OR`, `\|\|`                                                                                              |

---

# Summary

| Category   | Operators                                                                                                                       |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------- |
| Arithmetic | `+`, `-`, `*`, `/`, `%`, `MOD()`                                                                                    |
| Comparison | `=`, `!=`, `<>`, `>`, `<`, `>=`, `<=`                                                                             |
| Logical    | `AND`, `OR`, `NOT`, `XOR`                                                                                               |
| Assignment | `:=`                                                                                                                          |
| Bitwise    | `&`, `\|`, `^`, `~`, `<<`, `>>`                                                                                      |
| Special    | `BETWEEN`, `IN`, `NOT IN`, `LIKE`, `IS NULL`, `IS NOT NULL`, `EXISTS`, `ANY`, `ALL`, `DISTINCT`, `REGEXP` |

---

# Conclusion

MySQL operators are grouped into the following categories:

- **Arithmetic Operators** – Perform mathematical calculations.
- **Comparison Operators** – Compare values.
- **Logical Operators** – Combine multiple conditions.
- **Assignment Operator** – Assign values to variables.
- **Bitwise Operators** – Perform binary operations.
- **Special Operators** – Used for searching, filtering, pattern matching, and subqueries.

Understanding these operators is essential for writing efficient SQL queries.
