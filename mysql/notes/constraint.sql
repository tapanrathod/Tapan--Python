-- constraints :

-- PRIMAARY KEY, AUTO_INCREAMENT
-- ex. : id INT PRIMARY KEY AUTO_INCREAMENT

-- FOREIGN KEY
-- ex. : FOREIGN KEY (user_id) REFERENCES users(id)

-- with actions :
-- ON DELETE CASCADE
-- ON UPDATE CASCADE

-- UNIQUE
-- ex. : email VARCHAR(20) UNIQUE

-- NOT NULL
-- ex. : first_name VARCHAR(10) NOT NULL

-- DEFAULT
-- ex. : country VARCHAR(20) DEFAULT "India"
-- ex. : created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

-- CHECK
-- ex. : age INT CHECK (age >= 18)

/*
 COMPOSITE CONSTRAINT :
meaning : 

id, name
101, shyam
101, ram
102, ram
103


PRIMARY KEY (order_id, product_id)
*/



/*
Give CONSTRAINT Name : 

Syntax to Name Constraints : 
CONSTRAINT constraint_name CONSTRAINT_TYPE (column)

Ex. : 

CREATE TABLE users (
    id INT,
    email VARCHAR(100),
    age INT,
    dept_id INT,

    CONSTRAINT pk_users_id PRIMARY KEY (id),
    CONSTRAINT uq_users_email UNIQUE (email),
    CONSTRAINT chk_users_age CHECK (age >= 18),
    CONSTRAINT fk_users_dept FOREIGN KEY (dept_id)
        REFERENCES departments(id)
);

Composite : 

CONSTRAINT pk_order_product PRIMARY KEY (order_id, product_id)

=> Add Multiple Named Constraints (ALTER TABLE)

ALTER TABLE users
ADD CONSTRAINT uq_users_phone UNIQUE (phone),
ADD CONSTRAINT chk_users_salary CHECK (salary > 0);

*/

