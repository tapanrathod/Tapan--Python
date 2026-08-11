# MySQL Transactions — Detailed Explanation

A **transaction in MySQL** is a group of one or more SQL statements that are treated as **one logical unit of work**.

The main purpose of a transaction is to ensure that the database remains **correct and consistent**, even if something goes wrong while executing multiple SQL operations.

For example, consider transferring ₹10,000 from one bank account to another:

1. Deduct ₹10,000 from Account A.
2. Add ₹10,000 to Account B.

Both operations must succeed together. If the deduction succeeds but the deposit fails, the database becomes incorrect.

A transaction solves this problem:

```sql
START TRANSACTION;

-- Deduct ₹10,000 from Account A
-- Add ₹10,000 to Account B

COMMIT;
```

If something goes wrong:	

```sql
ROLLBACK;
```

---

## 1. What is a Transaction?

A transaction is a sequence of SQL operations that MySQL executes as a **single unit**.

Example:

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 101;

UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 102;

COMMIT;
```

Here, the two `UPDATE` statements belong to the same transaction.

If both are successful:

```sql
COMMIT;
```

makes the changes permanent.

If something goes wrong:

```sql
ROLLBACK;
```

undoes the changes made during the transaction.

---

## 2. Why Do We Need Transactions?

Without transactions, multiple related operations can leave the database in an inconsistent state.

Suppose:

```text
Account A = ₹50,000
Account B = ₹20,000
```

You transfer ₹10,000 from A to B.

The correct result should be:

```text
Account A = ₹40,000
Account B = ₹30,000
```

But imagine this happens:

```sql
UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 101;
```

This succeeds.

Then:

```sql
UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 102;
```

fails because of some error.

Now the database could contain:

```text
Account A = ₹40,000
Account B = ₹20,000
```

₹10,000 has effectively disappeared.

A transaction prevents this situation.

---

# 3. ACID Properties

Transactions are commonly explained using the **ACID** properties.

ACID stands for:

| Property    | Meaning     |
| ----------- | ----------- |
| **A** | Atomicity   |
| **C** | Consistency |
| **I** | Isolation   |
| **D** | Durability  |

These are fundamental concepts in database transactions.

---

## A — Atomicity

**Atomicity means all operations in a transaction happen successfully, or none of them happen.**

Think of it as:

> **All or Nothing**

Example:

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 101;

UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 102;

COMMIT;
```

If both operations succeed:

```sql
COMMIT;
```

If one fails:

```sql
ROLLBACK;
```

The first operation is also undone.

### Example

Before:

```text
Account A = ₹50,000
Account B = ₹20,000
```

After successful transaction:

```text
Account A = ₹40,000
Account B = ₹30,000
```

If transaction fails:

```text
Account A = ₹50,000
Account B = ₹20,000
```

The database returns to its previous state.

---

# 4. C — Consistency

**Consistency means a transaction must take the database from one valid state to another valid state.**

Suppose you have this rule:

```text
balance >= 0
```

Before transaction:

```text
Account A = ₹50,000
```

After withdrawing ₹10,000:

```text
Account A = ₹40,000
```

The database remains valid.

Consistency can be maintained through:

- Primary keys
- Foreign keys
- UNIQUE constraints
- NOT NULL constraints
- CHECK constraints
- Data types
- Business rules
- Application logic

---

# 5. I — Isolation

**Isolation means transactions running at the same time should not improperly interfere with each other.**

Imagine two users accessing the same account simultaneously.

```text
Transaction A
Transaction B
```

Both may try to modify the same data.

MySQL uses locking and isolation mechanisms to control this behavior.

Isolation is especially important in:

- Banking
- E-commerce
- Ticket booking
- Inventory systems
- Payment systems
- Payroll systems

---

# 6. D — Durability

**Durability means that once a transaction is committed, its changes should survive system failures.**

For example:

```sql
COMMIT;
```

After this, the transaction is considered permanently committed.

Even if the MySQL server subsequently crashes, committed changes are designed to be recovered when the server restarts.

This is one of the important reasons to use a transactional storage engine such as **InnoDB**.

---

# 7. Basic Transaction Commands

The most important MySQL transaction commands are:

```sql
START TRANSACTION;
```

```sql
COMMIT;
```

```sql
ROLLBACK;
```

```sql
SAVEPOINT;
```

```sql
ROLLBACK TO SAVEPOINT;
```

```sql
RELEASE SAVEPOINT;
```

You may also see:

```sql
BEGIN;
```

used to start a transaction.

---

# 8. START TRANSACTION

This starts a new transaction.

```sql
START TRANSACTION;
```

Example:

```sql
START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;

COMMIT;
```

The salary update becomes permanent after `COMMIT`.

---

# 9. COMMIT

`COMMIT` permanently saves the changes made by the current transaction.

Example:

```sql
START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;

COMMIT;
```

The sequence is:

```text
START TRANSACTION
       ↓
UPDATE
       ↓
COMMIT
       ↓
Changes permanently saved
```

---

# 10. ROLLBACK

`ROLLBACK` cancels changes made during the current transaction.

Example:

```sql
START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;

ROLLBACK;
```

The salary increase is undone.

Conceptually:

```text
Before transaction
       ↓
START TRANSACTION
       ↓
UPDATE
       ↓
ROLLBACK
       ↓
Back to previous state
```

---

# 11. SAVEPOINT

A **SAVEPOINT** allows you to create a point inside a transaction to which you can partially roll back.

Example:

```sql
START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;

SAVEPOINT salary_update;

UPDATE employees
SET salary = salary + 10000
WHERE employee_id = 102;

ROLLBACK TO SAVEPOINT salary_update;

COMMIT;
```

What happened?

```text
START TRANSACTION
       ↓
Update employee 101
       ↓
SAVEPOINT
       ↓
Update employee 102
       ↓
ROLLBACK TO SAVEPOINT
       ↓
Employee 102 update is undone
       ↓
Employee 101 update remains
       ↓
COMMIT
```

So the first update remains, while the second update is cancelled.

---

# 12. RELEASE SAVEPOINT

After you no longer need a savepoint, you can remove it:

```sql
RELEASE SAVEPOINT salary_update;
```

Example:

```sql
START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;

SAVEPOINT sp1;

UPDATE employees
SET salary = salary + 3000
WHERE employee_id = 102;

RELEASE SAVEPOINT sp1;

COMMIT;
```

---

# 13. ROLLBACK TO SAVEPOINT

This rolls back only the work performed **after** the specified savepoint.

Example:

```sql
START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;

SAVEPOINT sp1;

UPDATE employees
SET salary = salary + 3000
WHERE employee_id = 102;

ROLLBACK TO SAVEPOINT sp1;

COMMIT;
```

The first update remains.

The second update is undone.

---

# 14. Multiple SAVEPOINTs

You can create multiple savepoints.

```sql
START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;

SAVEPOINT sp1;

UPDATE employees
SET salary = salary + 3000
WHERE employee_id = 102;

SAVEPOINT sp2;

UPDATE employees
SET salary = salary + 2000
WHERE employee_id = 103;

ROLLBACK TO SAVEPOINT sp2;

COMMIT;
```

The update for employee `103` is undone.

The updates for employees `101` and `102` remain.

---

# 15. Practical Example — Bank Transfer

Let's create a simple banking table.

```sql
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(12,2)
);
```

Insert some data:

```sql
INSERT INTO accounts
(account_id, account_holder, balance)
VALUES
(101, 'Rahul Sharma', 50000),
(102, 'Amit Patel', 20000);
```

Check the data:

```sql
SELECT * FROM accounts;
```

Result:

```text
101 | Rahul Sharma | 50000
102 | Amit Patel   | 20000
```

Now transfer ₹10,000 from Rahul to Amit.

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 101;

UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 102;

COMMIT;
```

Now:

```sql
SELECT * FROM accounts;
```

Result:

```text
101 | Rahul Sharma | 40000
102 | Amit Patel   | 30000
```

Both operations were successfully committed.

---

# 16. Using ROLLBACK

Suppose we start another transaction:

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 101;

UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 102;

ROLLBACK;
```

Now check:

```sql
SELECT * FROM accounts;
```

The balances remain:

```text
101 | Rahul Sharma | 40000
102 | Amit Patel   | 30000
```

The ₹5,000 transfer was cancelled.

---

# 17. Transactions and INSERT

Transactions are not limited to `UPDATE`.

You can use transactions with:

```text
INSERT
UPDATE
DELETE
```

Example:

```sql
START TRANSACTION;

INSERT INTO employees
(employee_id, employee_name, department_id, salary)
VALUES
(101, 'Rahul Sharma', 3, 45000);

UPDATE departments
SET employee_count = employee_count + 1
WHERE department_id = 3;

COMMIT;
```

Both changes are committed together.

---

# 18. Transactions and DELETE

Example:

```sql
START TRANSACTION;

DELETE FROM employees
WHERE employee_id = 101;

DELETE FROM employee_projects
WHERE employee_id = 101;

COMMIT;
```

If something goes wrong before committing:

```sql
ROLLBACK;
```

Both deletes can be undone.

---

# 19. Transactions and INSERT + UPDATE

Suppose a company hires a new employee.

You may need to:

1. Insert employee.
2. Update department information.
3. Insert employee's project assignment.

These operations should logically happen together.

```sql
START TRANSACTION;

INSERT INTO employees
(employee_id, employee_name, department_id, salary)
VALUES
(151, 'Rajesh Patel', 3, 50000);

UPDATE departments
SET employee_count = employee_count + 1
WHERE department_id = 3;

INSERT INTO employee_projects
(employee_id, project_id)
VALUES
(151, 10);

COMMIT;
```

If any operation fails:

```sql
ROLLBACK;
```

---

# 20. AUTOCOMMIT

MySQL normally has **autocommit enabled**.

You can check it with:

```sql
SELECT @@autocommit;
```

If the result is:

```text
1
```

autocommit is enabled.

If:

```text
0
```

autocommit is disabled.

---

# 21. What Does AUTOCOMMIT Mean?

When autocommit is enabled, individual SQL statements are automatically committed when they complete successfully.

For example:

```sql
UPDATE employees
SET salary = salary + 1000
WHERE employee_id = 101;
```

With autocommit enabled, the successful statement is automatically committed.

---

# 22. Disable AUTOCOMMIT

You can disable it:

```sql
SET autocommit = 0;
```

Then:

```sql
UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;
```

The change isn't committed yet.

You can save it with:

```sql
COMMIT;
```

or undo it with:

```sql
ROLLBACK;
```

To enable autocommit again:

```sql
SET autocommit = 1;
```

---

# 23. START TRANSACTION vs BEGIN

You may see:

```sql
START TRANSACTION;
```

and:

```sql
BEGIN;
```

Both can be used to start a transaction in MySQL.

For learning and clarity, `START TRANSACTION` is explicit and easy to understand.

---

# 24. DDL and Transactions

DDL statements include:

```text
CREATE
ALTER
DROP
TRUNCATE
```

These have special transaction behavior in MySQL.

Many DDL statements cause an **implicit commit**.

For example:

```sql
START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;

CREATE TABLE test (
    id INT
);
```

The `CREATE TABLE` statement can cause an implicit commit.

Therefore, don't assume that every SQL statement behaves like a normal transactional DML statement.

For transaction-based work, the main statements you'll normally deal with are:

```text
INSERT
UPDATE
DELETE
```

---

# 25. DML vs DDL

It's useful to distinguish them.

## DML

```text
INSERT
UPDATE
DELETE
```

These are commonly used within transactions.

## DDL

```text
CREATE
ALTER
DROP
TRUNCATE
```

These have special transaction/implicit-commit behavior in MySQL.

---

# 26. Transaction Storage Engine

For transactions, you should generally use **InnoDB**.

Example:

```sql
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(12,2)
) ENGINE = InnoDB;
```

Check the storage engine:

```sql
SHOW TABLE STATUS LIKE 'accounts';
```

Or:

```sql
SHOW CREATE TABLE accounts;
```

You should see:

```text
ENGINE=InnoDB
```

---

# 27. InnoDB

**InnoDB** is MySQL's commonly used transactional storage engine.

It supports important features such as:

- Transactions
- `COMMIT`
- `ROLLBACK`
- Savepoints
- Row-level locking
- Foreign keys
- Crash recovery
- Multiple transaction isolation levels

For most modern MySQL applications, InnoDB is the standard choice.

---

# 28. Transaction Isolation Levels

Isolation is one of the more advanced transaction concepts.

MySQL/InnoDB supports these standard isolation levels:

```text
READ UNCOMMITTED
READ COMMITTED
REPEATABLE READ
SERIALIZABLE
```

You can check the current isolation level:

```sql
SELECT @@transaction_isolation;
```

---

# 29. READ UNCOMMITTED

This is the lowest isolation level.

A transaction may be able to read changes made by another transaction before they are committed.

This can result in a:

### Dirty Read

Example:

```text
Transaction A
    UPDATE balance = 50000
    (not committed)

Transaction B
    reads balance = 50000
```

Then Transaction A performs:

```sql
ROLLBACK;
```

Now the actual value may return to:

```text
40000
```

Transaction B had read data that was never committed.

That's a dirty read.

---

# 30. READ COMMITTED

Under `READ COMMITTED`, a transaction generally reads only committed data.

This prevents dirty reads.

However, the same query executed twice within a transaction can potentially see different committed data if another transaction commits a change between the two reads.

This is called a:

### Non-repeatable read

---

# 31. REPEATABLE READ

This is MySQL/InnoDB's default transaction isolation level.

```text
REPEATABLE READ
```

It provides stronger consistency for repeated reads within a transaction.

A transaction can generally continue seeing a consistent snapshot of data for ordinary consistent reads.

This helps prevent non-repeatable reads.

---

# 32. SERIALIZABLE

This provides the strongest standard isolation level.

Transactions behave more like they are executing one after another rather than concurrently.

It provides stronger protection but can reduce concurrency and increase locking/waiting.

Conceptually:

```text
Transaction A
     ↓
complete
     ↓
Transaction B
     ↓
complete
```

Instead of both freely operating at the same time.

---

# 33. Isolation Level Comparison

| Isolation Level  | Dirty Read | Non-repeatable Read | Phantom Read                                               |
| ---------------- | ---------- | ------------------- | ---------------------------------------------------------- |
| READ UNCOMMITTED | Possible   | Possible            | Possible                                                   |
| READ COMMITTED   | Prevented  | Possible            | Possible                                                   |
| REPEATABLE READ  | Prevented  | Prevented           | Generally handled differently by InnoDB's consistent reads |
| SERIALIZABLE     | Prevented  | Prevented           | Prevented                                                  |

For practical MySQL work:

```text
READ UNCOMMITTED
        ↓
READ COMMITTED
        ↓
REPEATABLE READ
        ↓
SERIALIZABLE
```

Isolation generally becomes stronger as you move downward, with potentially greater concurrency costs.

---

# 34. Set Transaction Isolation Level

For a session:

```sql
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

Then:

```sql
START TRANSACTION;

SELECT *
FROM employees;

COMMIT;
```

You can also configure isolation at the global level, but changing global database settings should be done carefully.

---

# 35. Dirty Read

A dirty read occurs when one transaction reads uncommitted data from another transaction.

Example concept:

```text
Transaction A
    UPDATE salary
    ↓
    Not committed

Transaction B
    SELECT salary
    ↓
    Reads A's uncommitted change
```

If A then rolls back:

```text
Transaction A → ROLLBACK
```

Transaction B has read data that never actually existed as committed data.

---

# 36. Non-Repeatable Read

Suppose Transaction A executes:

```sql
SELECT salary
FROM employees
WHERE employee_id = 101;
```

It gets:

```text
50000
```

Meanwhile Transaction B changes it:

```sql
UPDATE employees
SET salary = 60000
WHERE employee_id = 101;

COMMIT;
```

Transaction A executes the same query again.

It may now get:

```text
60000
```

The same query produced different results within the transaction.

That's a non-repeatable read.

---

# 37. Phantom Read

A phantom read involves rows appearing or disappearing between queries because another transaction inserted, deleted, or otherwise changed matching rows.

Example:

Transaction A:

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

Suppose it returns:

```text
5 employees
```

Transaction B inserts another employee:

```sql
INSERT INTO employees (...)
VALUES (..., 75000);

COMMIT;
```

Transaction A runs the query again and may encounter an additional matching row under isolation behavior that permits it.

That additional row is called a **phantom**.

---

# 38. Transactions and Locks

Transactions often work together with **locks**.

Suppose:

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 101;
```

MySQL/InnoDB may lock the affected row so another transaction cannot improperly modify it at the same time.

This helps prevent conflicting updates.

---

# 39. SELECT ... FOR UPDATE

A particularly important transaction feature is:

```sql
SELECT ... FOR UPDATE;
```

Example:

```sql
START TRANSACTION;

SELECT balance
FROM accounts
WHERE account_id = 101
FOR UPDATE;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 101;

COMMIT;
```

The `FOR UPDATE` clause is useful when you want to lock selected rows for an update within the transaction.

This is common in:

- Banking
- Inventory
- Ticket booking
- Order processing

---

# 40. Real-World Example — E-Commerce

Imagine an online store.

A customer buys one laptop.

The system needs to:

1. Create order.
2. Reduce inventory.
3. Create payment record.
4. Create order items.

You don't want this:

```text
Order created       ✓
Inventory reduced   ✓
Payment record      ✗
```

because now the database is inconsistent.

Instead:

```sql
START TRANSACTION;

INSERT INTO orders (...);

UPDATE products
SET stock = stock - 1
WHERE product_id = 101;

INSERT INTO payments (...);

INSERT INTO order_items (...);

COMMIT;
```

If something fails:

```sql
ROLLBACK;
```

Everything from that transaction can be undone.

---

# 41. Real-World Example — Employee Management

Suppose you hire an employee.

You need to:

```text
INSERT employee
       ↓
Assign department
       ↓
Assign project
       ↓
Create salary record
```

You can use:

```sql
START TRANSACTION;

INSERT INTO employees (...);

INSERT INTO employee_departments (...);

INSERT INTO employee_projects (...);

INSERT INTO salary_records (...);

COMMIT;
```

If any important operation fails:

```sql
ROLLBACK;
```

---

# 42. Nested Transactions

A common question is:

> Can I start a transaction inside another transaction?

MySQL does **not** provide true nested transactions in the usual sense.

For example:

```sql
START TRANSACTION;

-- Transaction 1

START TRANSACTION;

-- This does not create a true independent nested transaction.
```

Instead, use:

```sql
SAVEPOINT;
```

Example:

```sql
START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;

SAVEPOINT sp1;

UPDATE employees
SET salary = salary + 3000
WHERE employee_id = 102;

ROLLBACK TO SAVEPOINT sp1;

COMMIT;
```

---

# 43. Complete Example

Let's put everything together.

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 101;

SAVEPOINT after_debit;

UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 102;

COMMIT;
```

If something goes wrong before `COMMIT`:

```sql
ROLLBACK;
```

Or if you want to undo only work after the savepoint:

```sql
ROLLBACK TO SAVEPOINT after_debit;
```

---

# 44. Important Rules to Remember

### Rule 1 — Use InnoDB

For transactional tables:

```sql
ENGINE = InnoDB
```

### Rule 2 — Use transactions for related operations

For example:

```text
Payment
+
Order
+
Inventory
```

should often be treated as one logical unit.

### Rule 3 — Don't forget COMMIT

If you're manually managing a transaction:

```sql
COMMIT;
```

is what makes successful changes permanent.

### Rule 4 — Use ROLLBACK when something fails

```sql
ROLLBACK;
```

### Rule 5 — Use SAVEPOINT for complex transactions

```sql
SAVEPOINT sp1;
```

### Rule 6 — Understand autocommit

Check:

```sql
SELECT @@autocommit;
```

### Rule 7 — Understand isolation

Especially when working with multiple users or concurrent transactions.

---

# 45. Quick Cheat Sheet

```sql
-- Start
START TRANSACTION;

-- Save changes
COMMIT;

-- Undo changes
ROLLBACK;

-- Create rollback point
SAVEPOINT sp1;

-- Rollback to savepoint
ROLLBACK TO SAVEPOINT sp1;

-- Delete savepoint
RELEASE SAVEPOINT sp1;

-- Check autocommit
SELECT @@autocommit;

-- Disable autocommit
SET autocommit = 0;

-- Enable autocommit
SET autocommit = 1;

-- Check isolation
SELECT @@transaction_isolation;

-- Set isolation
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

---

# 46. The Most Important Concept

If you're learning MySQL for **Data Analytics / Data Science / Power BI / Backend development**, remember this basic pattern:

```sql
START TRANSACTION;

    -- SQL operation 1
    -- SQL operation 2
    -- SQL operation 3

    -- If everything is correct:
    COMMIT;

    -- If something goes wrong:
    -- ROLLBACK;
```

Think of a transaction as a **safe container around multiple database operations**:

```text
              TRANSACTION
┌──────────────────────────────────┐
│                                  │
│  INSERT                           │
│  UPDATE                           │
│  UPDATE                           │
│  DELETE                           │
│                                  │
└──────────────────────────────────┘
          ↓              ↓
       Success          Failure
          ↓              ↓
       COMMIT         ROLLBACK
          ↓              ↓
        SAVE            UNDO
```

## In one sentence

> **A MySQL transaction groups related SQL operations into a single unit so that the changes can either be committed together or rolled back when something goes wrong.**

## Four words to remember

**ACID → Atomicity, Consistency, Isolation, Durability.**
