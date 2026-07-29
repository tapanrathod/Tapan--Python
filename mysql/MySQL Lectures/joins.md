# MySQL JOIN Practice Guide

# Customer & Orders Database

This guide uses two related tables:

- **customers** → Stores customer information.
- **orders** → Stores orders placed by customers.

A customer can place **zero, one, or many orders**.

---

# Database Schema

## customers

| Column | Type | Description |
|---------|------|-------------|
| customer_id | INT | Unique customer ID (Primary Key) |
| customer_name | VARCHAR(100) | Customer's full name |
| email | VARCHAR(100) | Email address |
| city | VARCHAR(50) | Customer's city |

Example

| customer_id | customer_name | city |
|-------------|---------------|------|
| 101 | Aarav Patel | Ahmedabad |
| 102 | Priya Sharma | Mumbai |

---

## orders

| Column | Type | Description |
|---------|------|-------------|
| order_id | INT | Unique Order ID |
| customer_id | INT | Customer who placed the order |
| product_name | VARCHAR(100) | Purchased product |
| category | VARCHAR(50) | Product category |
| amount | DECIMAL | Order amount |
| order_date | DATE | Purchase date |

Example

| order_id | customer_id | product_name |
|----------|-------------|--------------|
|1001|101|Samsung Galaxy S25|
|1002|102|Boat Airdopes|

Notice that **customer_id** in the **orders** table refers to the **customer_id** in the **customers** table.

This relationship is called a **Foreign Key**.

---

# Relationship Diagram

```
customers
+----------------------+
| customer_id (PK)     |
| customer_name        |
| email                |
| city                 |
+----------------------+
          |
          |
          | customer_id
          |
          V
orders
+----------------------+
| order_id (PK)        |
| customer_id (FK)     |
| product_name         |
| category             |
| amount               |
| order_date           |
+----------------------+
```

One customer can have many orders.

Example

```
Aarav Patel
    |
    +---- Samsung Galaxy S25
    |
    +---- Noise Smart Watch
    |
    +---- Boat Earbuds
```

---

# What is a JOIN?

A JOIN combines data from two or more tables based on a common column.

Here the common column is

```
customer_id
```

Without JOIN

```
customers

101 Aarav Patel
102 Priya Sharma
103 Rahul Verma
```

```
orders

1001 101 Samsung Galaxy
1002 101 Smart Watch
1003 103 Laptop
```

These tables are separate.

JOIN combines them into one result.

---

# INNER JOIN

## Query

```sql
SELECT
    c.customer_name,
    o.product_name,
    o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
```

---

## Explanation

The database compares

```
customers.customer_id
```

with

```
orders.customer_id
```

If both IDs are equal,

the row is returned.

If they do not match,

the row is ignored.

---

### Example

customers

|ID|Name|
|--|----|
|101|Aarav|
|102|Priya|
|103|Rahul|

orders

|Order|Customer|
|------|--------|
|1001|101|
|1002|103|

Result

|Customer|Product|
|---------|-------|
|Aarav|Samsung Galaxy|
|Rahul|Laptop|

Priya does **not** appear because she has no order.

---

# LEFT JOIN

## Query

```sql
SELECT
    c.customer_name,
    o.product_name,
    o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
```

---

## Explanation

LEFT JOIN returns

- Every customer
- Matching orders if available

If there is no order,

SQL returns **NULL**.

---

Example

customers

|ID|Name|
|--|----|
|101|Aarav|
|102|Priya|
|103|Rahul|

orders

|Customer|Product|
|--------|-------|
|101|Phone|
|103|Laptop|

Result

|Customer|Product|
|---------|-------|
|Aarav|Phone|
|Priya|NULL|
|Rahul|Laptop|

Notice

Priya still appears.

---

# RIGHT JOIN

## Query

```sql
SELECT
    c.customer_name,
    o.product_name
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
```

---

## Explanation

RIGHT JOIN returns

- Every order
- Customer information if available

If a customer record is missing,

customer columns become NULL.

Although uncommon,

RIGHT JOIN is useful when you want every record from the second table.

---

# Customers Without Orders

## Query

```sql
SELECT
    c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

---

## Explanation

Step 1

LEFT JOIN returns every customer.

Example

|Customer|Order|
|---------|-----|
|Aarav|1001|
|Priya|NULL|
|Rahul|1003|

Step 2

```
WHERE o.order_id IS NULL
```

filters only rows where no order exists.

Final Result

|Customer|
|---------|
|Priya|

This is one of the most common interview questions.

---

# Customers Who Placed Orders

```sql
SELECT
    DISTINCT c.customer_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
```

## Explanation

A customer may place multiple orders.

Without DISTINCT

```
Aarav
Aarav
Aarav
```

With DISTINCT

```
Aarav
```

Only one row is shown.

---

# Total Spending by Customer

```sql
SELECT
    c.customer_name,
    SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
```

---

## Explanation

SUM()

Adds all order amounts.

Suppose

|Customer|Amount|
|---------|------|
|Aarav|85000|
|Aarav|3500|
|Aarav|1800|

Result

|Customer|Total|
|---------|-----|
|Aarav|90300|

GROUP BY tells MySQL

"Group all Aarav's orders together before calculating."

---

# Total Number of Orders

```sql
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
```

---

## Explanation

COUNT()

Counts rows.

Example

|Customer|Orders|
|---------|------|
|Aarav|3|
|Priya|0|
|Rahul|1|

LEFT JOIN ensures customers without orders are still included.

---

# Average Order Amount

```sql
SELECT
    AVG(amount) AS average_order
FROM orders;
```

AVG()

Calculates the average amount.

Formula

```
Total Amount
------------
Total Orders
```

---

# Highest Order

```sql
SELECT *
FROM orders
ORDER BY amount DESC
LIMIT 1;
```

Explanation

```
DESC
```

Sorts from highest to lowest.

```
LIMIT 1
```

Returns only the first row.

---

# Lowest Order

```sql
SELECT *
FROM orders
ORDER BY amount ASC
LIMIT 1;
```

ASC means

Lowest → Highest.

---

# Orders Above ₹50,000

```sql
SELECT *
FROM orders
WHERE amount > 50000;
```

Only expensive purchases are returned.

---

# Orders Between Two Dates

```sql
SELECT *
FROM orders
WHERE order_date
BETWEEN '2025-01-01'
AND '2025-03-31';
```

Returns orders placed during the specified date range.

---

# Customers from Ahmedabad

```sql
SELECT *
FROM customers
WHERE city='Ahmedabad';
```

Returns every customer living in Ahmedabad.

---

# Search Customers by Name

```sql
SELECT *
FROM customers
WHERE customer_name LIKE 'A%';
```

Matches

```
Aarav
Ananya
Arjun
Aditi
```

because they start with A.

---

# Total Sales

```sql
SELECT
SUM(amount)
AS total_sales
FROM orders;
```

Adds every order amount together.

---

# Sales by Product Category

```sql
SELECT
category,
SUM(amount) AS total_sales
FROM orders
GROUP BY category;
```

Example Result

|Category|Sales|
|----------|------|
|Mobile|245000|
|Laptop|315000|
|Camera|82000|

---

# Order Customers by Total Spending

```sql
SELECT
c.customer_name,
SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
```

The biggest spender appears first.

---

# Summary

| JOIN | Returns |
|-------|----------|
| INNER JOIN | Only matching records |
| LEFT JOIN | All customers + matching orders |
| RIGHT JOIN | All orders + matching customers |

---

# Interview Questions

### 1. Find customers without orders.

Hint:

Use LEFT JOIN and check for NULL.

---

### 2. Find customers with more than one order.

Hint:

Use

- GROUP BY
- COUNT()
- HAVING

---

### 3. Find the customer who spent the most.

Hint:

Use

- SUM()
- GROUP BY
- ORDER BY DESC

---

### 4. Find total sales for each category.

Hint:

Use

```
GROUP BY category
```

---

### 5. Find all mobile purchases.

Hint

```
WHERE category='Mobile'
```

---

This dataset covers the SQL concepts most commonly asked in assignments, practical exams, and technical interviews:
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Aggregate functions (`SUM`, `COUNT`, `AVG`, `MIN`, `MAX`)
- `DISTINCT`
- `LIKE`
- `BETWEEN`
- `LIMIT`