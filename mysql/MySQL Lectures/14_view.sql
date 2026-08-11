-- Active: 1782301937005@@127.0.0.1@3306@joins_db

SELECT * FROM customers;

SELECT * FROM orders;

INSERT INTO customers VALUES  (
        116,
        'Tapan Rathod',
        'tapan.rathod@gmail.com',
        'Ahmedabad'
    );

INSERT INTO orders VALUES (
        1013,
        116,
        'IPhone 17',
        'Mobile',
        100000,
        '2025-01-10'
    )


SELECT *
FROM orders as o
    JOIN customers as c ON o.customer_id = c.customer_id;

CREATE VIEW all_orders AS (
    SELECT c.customer_id, c.customer_name, c.email, c.city, o.order_id, o.product_name, o.category, o.amount, o.order_date
    FROM orders as o
        JOIN customers as c ON o.customer_id = c.customer_id
);

DROP VIEW all_orders;

SELECT * FROM all_orders;