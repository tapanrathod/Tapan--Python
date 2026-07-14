# MySQL Aggregate Functions

Aggregate functions in MySQL perform calculations on a set of rows and return a **single value**. They are commonly used with the `GROUP BY` clause.

---

## Sample Employee Table

| EmpID | Name | Department | Salary | Age |
|------:|------|------------|-------:|----:|
| 1 | Alice | HR | 30000 | 25 |
| 2 | Bob | IT | 50000 | 30 |
| 3 | Charlie | IT | 60000 | 35 |
| 4 | David | HR | 40000 | 28 |
| 5 | Emma | Sales | 45000 | 32 |

---

# 1. COUNT()

## Definition
The `COUNT()` function returns the number of rows that match a specified condition.

### Syntax

```sql
SELECT COUNT(*) FROM Employee;
```

### Output

| COUNT(*) |
|----------|
| 5 |


### Example: Count Employees in IT Department

```sql
SELECT COUNT(*) AS Total_IT
FROM Employee
WHERE Department = 'IT';
```

### Output

| Total_IT |
|---------:|
| 2 |

---

# 2. SUM()

## Definition
The `SUM()` function returns the total sum of a numeric column.

### Syntax

```sql
SELECT SUM(Salary) AS Total_Salary
FROM Employee;
```

### Output

| Total_Salary |
|-------------:|
| 225000 |

---

# 3. AVG()

## Definition
The `AVG()` function returns the average value of a numeric column.

### Syntax

```sql
SELECT AVG(Salary) AS Average_Salary
FROM Employee;
```

### Calculation

```
(30000 + 50000 + 60000 + 40000 + 45000) / 5 = 45000
```

### Output

| Average_Salary |
|---------------:|
| 45000 |

---

# 4. MIN()

## Definition
The `MIN()` function returns the smallest value in a column.

### Syntax

```sql
SELECT MIN(Salary) AS Lowest_Salary
FROM Employee;
```

### Output

| Lowest_Salary |
|--------------:|
| 30000 |

---

# 5. MAX()

## Definition
The `MAX()` function returns the largest value in a column.

### Syntax

```sql
SELECT MAX(Salary) AS Highest_Salary
FROM Employee;
```

### Output

| Highest_Salary |
|---------------:|
| 60000 |

---

# Aggregate Functions with GROUP BY

The `GROUP BY` clause groups rows that have the same values in specified columns. Aggregate functions calculate results for each group.

### Example

```sql
SELECT Department,
       COUNT(*) AS Employees,
       SUM(Salary) AS Total_Salary,
       AVG(Salary) AS Average_Salary,
       MIN(Salary) AS Minimum_Salary,
       MAX(Salary) AS Maximum_Salary
FROM Employee
GROUP BY Department;
```

### Output

| Department | Employees | Total_Salary | Average_Salary | Minimum_Salary | Maximum_Salary |
|------------|----------:|-------------:|---------------:|---------------:|---------------:|
| HR | 2 | 70000 | 35000 | 30000 | 40000 |
| IT | 2 | 110000 | 55000 | 50000 | 60000 |
| Sales | 1 | 45000 | 45000 | 45000 | 45000 |

---

# Aggregate Functions with HAVING

The `HAVING` clause filters grouped records after aggregation.

### Example

```sql
SELECT Department,
       AVG(Salary) AS Avg_Salary
FROM Employee
GROUP BY Department
HAVING AVG(Salary) > 40000;
```

### Output

| Department | Avg_Salary |
|------------|-----------:|
| IT | 55000 |
| Sales | 45000 |

---

# Important Notes

- Aggregate functions return **one value** from multiple rows.
- `COUNT(*)` counts all rows, including rows containing `NULL` values.
- Other aggregate functions (`SUM`, `AVG`, `MIN`, `MAX`) ignore `NULL` values.
- Aggregate functions are frequently used with the `GROUP BY` clause.
- The `HAVING` clause is used to filter grouped results.

---

# Summary Table

| Function | Description | Example |
|----------|-------------|---------|
| `COUNT()` | Counts the number of rows or non-NULL values | `SELECT COUNT(*) FROM Employee;` |
| `SUM()` | Returns the total sum of numeric values | `SELECT SUM(Salary) FROM Employee;` |
| `AVG()` | Returns the average value | `SELECT AVG(Salary) FROM Employee;` |
| `MIN()` | Returns the smallest value | `SELECT MIN(Salary) FROM Employee;` |
| `MAX()` | Returns the largest value | `SELECT MAX(Salary) FROM Employee;` |

---

# Conclusion

MySQL provides five primary aggregate functions:

1. **COUNT()** – Counts rows.
2. **SUM()** – Calculates the total.
3. **AVG()** – Calculates the average.
4. **MIN()** – Finds the smallest value.
5. **MAX()** – Finds the largest value.

These functions are commonly used with `GROUP BY` and `HAVING` to generate reports and summarize data efficiently.