# Read the students.csv file using the csv module and print all rows.

import csv

file = open("./practice/csv_read/students.csv", "r")  # "r" for read

read = csv.DictReader(file)

data = list(read)

print(len(data))
print(data)

file.close()


# Read the employees.csv file and print only employee names and salaries.

import csv

file = open("./practice/csv_read/employees.csv", "r")

read = csv.DictReader(file)

data = list(read)

for i in data:  # for loop # use for loop to print all details
    print(i["name"], i["salary"])

file.close()

# using filter lambda function :

import csv

with open("./practice/csv_read/employees.csv", "r") as file:
    read = csv.DictReader(file)

    list(filter(lambda row: print(row["name"], row["salary"]), read))  # filter lambda function # not required

file.close()


# Count the total number of rows present in products.csv

import csv

with open("./practice/csv_read/products.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

print(len(data))

file.close()


# Read students.csv and print only students whose age is greater than 18 using filter()

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

c = list(filter(lambda x: int(x["age"]) > 18, data))  # filter lambda function

print(len(c))

for i in c:

    print(i["name"], i["age"])

file.close()


# Read products.csv and print products whose price is greater than 500 using filter()

import csv

with open("./practice/csv_read/products.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

c = list(filter(lambda x: int(x["price"]) > 500, data))  # filter lambda function

print(len(c))

for i in c:

    print(i["product"], i["price"])

file.close()


# Read employees.csv and convert all salary values from string to integer using map()

import csv

with open("./practice/csv_read/employees.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def convert_salary(row):

    row["salary"] = int(row["salary"])

    return row


c = list(map(convert_salary, data))  # map function

for i in c:

    print(i["name"], i["salary"])

file.close()

# Read students.csv and create a list containing only student names using map()

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def get_name(row):

    return row["name"]


c = list(map(get_name, data))  # map function

print(c)

file.close()


# Read students.csv and display students who scored more than 75 marks using filter()

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

c = list(filter(lambda x: int(x["marks"]) > 75, data))  # filter lambda function

print(len(c))

for i in c:

    print(i["name"], i["marks"])

file.close()


# Read employees.csv and calculate the total salary of all employees using reduce()

import csv

from functools import reduce

with open("./practice/csv_read/employees.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def add_salary(total, row):

    return total + int(row["salary"])


total_salary = reduce(add_salary, data, 0)  # reduce function

print(total_salary)

file.close()


# Read sales.csv and find the total sales amount using reduce()

import csv

from functools import reduce

with open("./practice/csv_read/sales.csv", "r") as file: # error

    read = csv.DictReader(file)

    data = list(read)


def add_sales(total, row):

    return total + int(row["amount"])


total_sales = reduce(add_sales, data, 0)  # reduce function

print(total_sales)

file.close()


# Read students.csv and print rows where city is "Ahmedabad" using filter()

import csv

with open("./practice/csv_read/students.csv", "r") as file:
    read = csv.DictReader(file)

    data = list(read)

c = list(filter(lambda x: x["city"] == "Ahmedabad", data))  # filter lambda function

print(len(c))

for i in c:
    print(i["name"], i["city"])

file.close()


# Read students.csv and convert all student names into uppercase using map()

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def uppercase_name(row):
    row["name"] = row["name"].upper()

    return row


c = list(map(uppercase_name, data))  # map function
for i in c:
    print(i["name"])
file.close()


# Read students.csv and calculate the average marks of all students

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def add_marks(total, row):
    return total + int(row["marks"])


total_marks = reduce(add_marks, data, 0)  # reduce function

average_marks = total_marks / len(data)

print(average_marks)

file.close()


# Read students.csv and find the longest student name using reduce()

import csv

from functools import reduce

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def longest_name(longest, row):

    if len(row["name"]) > len(longest):
        return row["name"]
    else:
        return longest


longest_student_name = reduce(longest_name, data, "")  # reduce function

print(longest_student_name)

file.close()


# Read products.csv and display products whose stock is less than 10 using filter()

import csv

with open("./practice/csv_read/products.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

c = list(filter(lambda x: int(x["stock"]) < 10, data))  # filter lambda function

print(len(c))

for i in c:

    print(i["product"], i["stock"])

file.close()


# Read students.csv and add 10 bonus marks to every student's marks using map()

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def add_bonus_marks(row):

    row["marks"] = int(row["marks"]) + 10

    return row


c = list(map(add_bonus_marks, data))  # map function

for i in c:

    print(i["name"], i["marks"])

file.close()


# Read employees.csv and find the highest salary using reduce()

import csv

from functools import reduce

with open("./practice/csv_read/employees.csv", "r") as file:
    read = csv.DictReader(file)

    data = list(read)


def highest_salary(highest, row):

    if int(row["salary"]) > int(highest):
        return row["salary"]
    else:
        return highest


highest_employee_salary = reduce(highest_salary, data, "0")  # reduce function

print(highest_employee_salary)

file.close()


# Read students.csv and print only even student IDs using filter()

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

c = list(filter(lambda x: int(x["id"]) % 2 == 0, data))  # filter lambda function

print(len(c))

for i in c:

    print(i["name"], i["id"])

file.close()


# Read students.csv and create a list of email addresses using map()

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def create_email(row):

    email = row["name"].lower().replace(" ", ".") + "@example.com"

    return email


emails = list(map(create_email, data))  # map function

print(emails)

file.close()


# Read sales.csv and calculate the total quantity of all products using reduce()

import csv

from functools import reduce

with open("./practice/csv_read/sales.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def add_quantity(total, row):

    return total + int(row["quantity"])


total_quantity = reduce(add_quantity, data, 0)  # reduce function

print(total_quantity)

file.close()


# Read students.csv and count how many students passed (marks >= 35) using filter()

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

c = list(filter(lambda x: int(x["marks"]) >= 35, data))  # filter lambda function

print(len(c))

for i in c:

    print(i["name"], i["marks"])

file.close()


# Read employees.csv and format output like "Name - Salary" using map()

import csv

with open("./practice/csv_read/employees.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def format_output(row):

    return f"{row['name']} - {row['salary']}"


formatted_employees = list(map(format_output, data))  # map function

for employee in formatted_employees:

    print(employee)

file.close()


# Read students.csv and concatenate all student names into a single string using reduce()

import csv

from functools import reduce

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def concatenate_names(names, row):

    if names:
        return names + ", " + row["name"]
    else:
        return row["name"]


all_names = reduce(concatenate_names, data, "")  # reduce function

print(all_names)

file.close()


# Read products.csv and print products whose category is "Electronics" using filter()

import csv

with open("./practice/csv_read/products.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

c = list(
    filter(lambda x: x["category"] == "Electronics", data)
)  # filter lambda function

print(len(c))

for i in c:

    print(i["product"], i["category"])

file.close()


# Read students.csv and convert all city names to lowercase using map()

import csv

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def lowercase_city(row):

    row["city"] = row["city"].lower()

    return row


c = list(map(lowercase_city, data))  # map function

for i in c:

    print(i["name"], i["city"])

file.close()


# Read sales.csv and print only rows where amount is greater than 10000 using filter()

import csv

with open("./practice/csv_read/sales.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

c = list(filter(lambda x: int(x["amount"]) > 10000, data))  # filter lambda function

print(len(c))

for i in c:

    print(i["product"], i["amount"])

file.close()


# Read employees.csv and calculate the average salary of employees

import csv

with open("./practice/csv_read/employees.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def add_salary(total, row): # ai

    return total + int(row["salary"])


total_salary = reduce(add_salary, data, 0)  # reduce function

average_salary = total_salary / len(data)

print(average_salary)

file.close()


# Read products.csv and create a list containing only product names using map()

import csv

with open("./practice/csv_read/products.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def get_product_name(row): # ai

    return row["product"]


product_names = list(map(get_product_name, data))  # map function

print(product_names)

file.close()


# Read students.csv and find the student with the highest marks using reduce()

import csv

from functools import reduce

with open("./practice/csv_read/students.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def highest_marks(highest, row):

    if int(row["marks"]) > int(highest["marks"]):
        return row
    else:
        return highest


highest_student = reduce(highest_marks, data)  # reduce function

print(highest_student["name"], highest_student["marks"])

file.close()


# Read sales.csv and calculate the total amount sold in "Ahmedabad" using filter() and reduce()

import csv

from functools import reduce

with open("./practice/csv_read/sales.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

c = list(filter(lambda x: x["city"] == "Ahmedabad", data))  # filter lambda function


def add_amount(total, row):

    return total + int(row["amount"])


total_amount_ahmedabad = reduce(add_amount, c, 0)  # reduce function

print(total_amount_ahmedabad)

file.close()
