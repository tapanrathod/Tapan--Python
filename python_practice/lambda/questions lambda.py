# 🔹 Dataset 1: Users

const_users = [
    {"id": 1, "name": "Harsh", "age": 22, "isActive": True, "salary": 30000},
    {"id": 2, "name": "Riya", "age": 28, "isActive": False, "salary": 50000},
    {"id": 3, "name": "Amit", "age": 19, "isActive": True, "salary": 20000},
    {"id": 4, "name": "Neha", "age": 32, "isActive": True, "salary": 70000},
    {"id": 5, "name": "Raj", "age": 25, "isActive": False, "salary": 40000},
]

# Questions (1–7)


# Get all active users using filter in lambda

active_users = list(filter(lambda user: user["isActive"], const_users))


# Get names of all users using map

user_names = list(map(lambda user: user["name"], const_users))


# Get users whose age is greater than 25.

users_above_25 = list(filter(lambda user: user["age"] > 25, const_users))


# Create a new array with user names in uppercase.

uppercase_names = list(map(lambda user: user["name"].upper(), const_users))


# Calculate total salary of all users using reduce.

from functools import reduce

total_salary = reduce(lambda acc, user: acc + user["salary"], const_users, 0)


# Find average age of users.

total_age = reduce(lambda acc, user: acc + user["age"], const_users, 0)
average_age = total_age / len(const_users)


# Get names of active users only

active_user_names = list(map(lambda user: user["name"], active_users))


# 🔹 Dataset 2: Products

const_products = [
    {"id": 1, "name": "Laptop", "price": 80000, "category": "Electronics"},
    {"id": 2, "name": "Phone", "price": 30000, "category": "Electronics"},
    {"id": 3, "name": "Shirt", "price": 2000, "category": "Clothing"},
    {"id": 4, "name": "Shoes", "price": 5000, "category": "Footwear"},
    {"id": 5, "name": "Watch", "price": 10000, "category": "Accessories"},
]


# Questions (8–14)


# Get all products with price greater than 10,000.

expensive_products = list(
    filter(lambda product: product["price"] > 10000, const_products)
)


# Extract only product names.

product_names = list(map(lambda product: product["name"], const_products))


# Apply 10% discount to all product prices.

discounted_products = list(
    map(lambda product: {**product, "price": product["price"] * 0.9}, const_products)
)


# Calculate total price of all products.

total_price = reduce(lambda acc, product: acc + product["price"], const_products, 0)


# Get only "Electronics" category products.

electronics_products = list(
    filter(lambda product: product["category"] == "Electronics", const_products)
)


# Create array of {name, price} only.

name_price_array = list(
    map(
        lambda product: {"name": product["name"], "price": product["price"]},
        const_products,
    )
)


# Find the most expensive product using reduce.

most_expensive_product = reduce(
    lambda acc, product: product if product["price"] > acc["price"] else acc,
    const_products,
)


# 🔹Dataset 3: Orders

const_orders = [
    {"id": 1, "userId": 1, "amount": 500, "status": "completed"},
    {"id": 2, "userId": 2, "amount": 1500, "status": "pending"},
    {"id": 3, "userId": 1, "amount": 2000, "status": "completed"},
    {"id": 4, "userId": 3, "amount": 800, "status": "completed"},
    {"id": 5, "userId": 2, "amount": 1200, "status": "pending"},
]


# Questions (15–20)

# Get all completed orders.


completed_orders = list(
    filter(lambda order: order["status"] == "completed", const_orders)
)


# Calculate total revenue from completed orders.

total_revenue = reduce(
    lambda acc, order: acc + order["amount"] if order["status"] == "completed" else acc,
    const_orders,
    0,
)


# Get all order amounts in a new array.

order_amounts = list(map(lambda order: order["amount"], const_orders))


# Count how many orders are pending using reduce.

pending_order_count = reduce(
    lambda acc, order: acc + 1 if order["status"] == "pending" else acc, const_orders, 0
)


# Group orders by userId using reduce. #ai

from collections import defaultdict

orders_by_user = reduce(
    lambda acc, order: acc[order["userId"]].append(order) or acc,
    const_orders,
    defaultdict(list),
)


# Find user who spent the most (based on total order amount). #ai

user_spending = reduce(
    lambda acc, order: {
        **acc,
        order["userId"]: acc.get(order["userId"], 0) + order["amount"],
    },
    const_orders,
    {},
)

biggest_spender = max(user_spending, key=user_spending.get)


#########################################################################

from functools import reduce

customers = [
    {"id": 1, "name": "Harsh", "city": "Ahmedabad", "age": 22},
    {"id": 2, "name": "Riya", "city": "Mumbai", "age": 28},
    {"id": 3, "name": "Amit", "city": "Delhi", "age": 19},
    {"id": 4, "name": "Neha", "city": "Ahmedabad", "age": 32},
]

orders = [
    {"id": 101, "customer_id": 1, "total": 1200, "status": "completed"},
    {"id": 102, "customer_id": 2, "total": 5000, "status": "pending"},
    {"id": 103, "customer_id": 1, "total": 800, "status": "completed"},
    {"id": 104, "customer_id": 3, "total": 1500, "status": "completed"},
    {"id": 105, "customer_id": 4, "total": 7000, "status": "completed"},
]

products = [
    {"id": 1, "name": "Laptop", "price": 80000, "stock": 5},
    {"id": 2, "name": "Phone", "price": 30000, "stock": 0},
    {"id": 3, "name": "Shoes", "price": 5000, "stock": 10},
    {"id": 4, "name": "Watch", "price": 10000, "stock": 3},
]


# 🔹 Filter (1–6)

# Get customers from Ahmedabad.

customers_from_ahmedabad = list(
    filter(lambda customer: customer["city"] == "Ahmedabad", customers)
)


# Get customers older than 21 AND from Mumbai or Delhi.

customers_mumbai_delhi = list(
    filter(
        lambda customer: customer["age"] > 21
        and customer["city"] in ["Mumbai", "Delhi"],
        customers,
    )
)


# Get completed orders with total > 1000.

completed_large_orders = list(
    filter(
        lambda order: order["status"] == "completed" and order["total"] > 1000, orders
    )
)


# Get products that are out of stock.

out_of_stock_products = list(filter(lambda product: product["stock"] == 0, products))


# Get products with stock less than 5.

low_stock_products = list(filter(lambda product: product["stock"] < 5, products))


# Get customers who have placed at least one order.

customer_ids_with_orders = set(map(lambda order: order["customer_id"], orders))

customers_with_orders = list(
    filter(lambda customer: customer["id"] in customer_ids_with_orders, customers)
)


# Get all customer names in uppercase.

customer_names_uppercase = list(
    map(lambda customer: customer["name"].upper(), customers)
)


# Convert products into format: "Laptop - ₹80000".

product_descriptions = list(
    map(lambda product: f"{product['name']} - ₹{product['price']}", products)
)


# Add GST (18%) to each product price.

products_with_gst = list(
    map(lambda product: {**product, "price": product["price"] * 1.18}, products)
)


# Convert orders into {id, status} only.

order_statuses = list(
    map(lambda order: {"id": order["id"], "status": order["status"]}, orders)
)


# Add new key is_expensive (price > 20000) to each product. #ai

products_with_expensive_flag = list(
    map(lambda product: {**product, "is_expensive": product["price"] > 20000}, products)
)


# Calculate total revenue from completed orders. #ai

total_revenue_completed = reduce(
    lambda acc, order: acc + order["total"] if order["status"] == "completed" else acc,
    orders,
    0,
)


# Count number of orders per status. #ai

order_count_by_status = reduce(
    lambda acc, order: {**acc, order["status"]: acc.get(order["status"], 0) + 1},
    orders,
    {},
)


# Find highest order value.

highest_order_value = reduce(
    lambda acc, order: order["total"] if order["total"] > acc else acc, orders, 0
)


# Calculate total stock of all products.

total_stock = reduce(lambda acc, product: acc + product["stock"], products, 0)


# Find average product price.\ #ai

total_price = reduce(lambda acc, product: acc + product["price"], products, 0)

average_price = total_price / len(products)


# Get names of customers who made completed orders. #ai

customer_id_to_name = {customer["id"]: customer["name"] for customer in customers}

customers_with_completed_orders = set(
    map(
        lambda order: (
            customer_id_to_name[order["customer_id"]]
            if order["status"] == "completed"
            else None
        ),
        orders,
    )
)


# Calculate total spending per customer. #ai

customer_spending = reduce(
    lambda acc, order: {
        **acc,
        order["customer_id"]: (
            acc.get(order["customer_id"], 0) + order["total"]
            if order["status"] == "completed"
            else acc.get(order["customer_id"], 0)
        ),
    },
    orders,
    {},
)


# Find the customer who spent the most. #ai

biggest_spender_id = max(customer_spending, key=customer_spending.get)

biggest_spender_name = customer_id_to_name[biggest_spender_id]


# Get total revenue generated from Ahmedabad customers only. #ai

ahmedabad_customer_ids = set(
    map(
        lambda customer: customer["id"],
        filter(lambda c: c["city"] == "Ahmedabad", customers),
    )
)

revenue_from_ahmedabad = reduce(
    lambda acc, order: (
        acc + order["total"]
        if order["customer_id"] in ahmedabad_customer_ids
        and order["status"] == "completed"
        else acc
    ),
    orders,
    0,
)
