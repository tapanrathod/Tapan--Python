# Write a Python program to create a CSV file and store student details.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

student_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")   
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    student_data.append(d)

f = open("./practice/csv/student_details.csv", "w", newline="")

m = csv.DictWriter(f, student_data[0].keys())

m.writeheader()
m.writerows(student_data)

f.close()


# Write a Python program to store employee details in a CSV file.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

employee_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    employee_data.append(d)

f = open("./practice/csv/employee_details.csv", "w", newline="")

m = csv.DictWriter(f, employee_data[0].keys())

m.writeheader()
m.writerows(employee_data)

f.close()


# Write a Python program to store product details in a CSV file.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

product_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    product_data.append(d)

f = open("./practice/csv/product_details.csv", "w", newline="")

m = csv.DictWriter(f, product_data[0].keys())

m.writeheader()
m.writerows(product_data)

f.close()


# Write a Python program to write multiple rows into a CSV file.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    data.append(d)

f = open("./practice/csv/multiple_rows.csv", "w", newline="")

m = csv.DictWriter(f, data[0].keys())

m.writeheader()
m.writerows(data)

f.close()


# Write a Python program to create a CSV file for books.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

book_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    book_data.append(d)

f = open("./practice/csv/book_details.csv", "w", newline="")

m = csv.DictWriter(f, book_data[0].keys())

m.writeheader()
m.writerows(book_data)

f.close()


# Write a Python program to store mobile details in a CSV file.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

mobile_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    mobile_data.append(d)

f = open("./practice/csv/mobile_details.csv", "w", newline="")

m = csv.DictWriter(f, mobile_data[0].keys())

m.writeheader()
m.writerows(mobile_data)

f.close()


# Write a Python program to create a CSV file for movie details.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

movie_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    movie_data.append(d)

f = open("./practice/csv/movie_details.csv", "w", newline="")

m = csv.DictWriter(f, movie_data[0].keys())

m.writeheader()
m.writerows(movie_data)

f.close()


# Write a Python program to store customer details in a CSV file.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

customer_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    customer_data.append(d)

f = open("./practice/csv/customer_details.csv", "w", newline="")

m = csv.DictWriter(f, customer_data[0].keys())

m.writeheader()
m.writerows(customer_data)

f.close()


# Write a Python program to create a CSV file for marks heet data.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

marksheet_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    marksheet_data.append(d)

f = open("./practice/csv/marksheet_data.csv", "w", newline="")

m = csv.DictWriter(f, marksheet_data[0].keys())

m.writeheader()
m.writerows(marksheet_data)

f.close()


# Write a Python program to store hospital patient details in a CSV file.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

patient_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    patient_data.append(d)

f = open("./practice/csv/patient_details.csv", "w", newline="")

m = csv.DictWriter(f, patient_data[0].keys())

m.writeheader()
m.writerows(patient_data)

f.close()

# Write a Python program to create a CSV file for bus details.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

bus_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    bus_data.append(d)

f = open("./practice/csv/bus_details.csv", "w", newline="")

m = csv.DictWriter(f, bus_data[0].keys())

m.writeheader()
m.writerows(bus_data)

f.close()


# Write a Python program to store college details in a CSV file.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

college_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    college_data.append(d)

f = open("./practice/csv/college_details.csv", "w", newline="")

m = csv.DictWriter(f, college_data[0].keys())

m.writeheader()
m.writerows(college_data)

f.close()


# Write a Python program to create a CSV file for cricket players.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

player_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    player_data.append(d)

f = open("./practice/csv/cricket_players.csv", "w", newline="")

m = csv.DictWriter(f, player_data[0].keys())

m.writeheader()
m.writerows(player_data)

f.close()


# Write a Python program to store car details in a CSV file.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

car_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    car_data.append(d)

f = open("./practice/csv/car_details.csv", "w", newline="")

m = csv.DictWriter(f, car_data[0].keys())

m.writeheader()
m.writerows(car_data)

f.close()


# Write a Python program to create a CSV file for school details.

import csv

ndata = int(input("How many data ? : "))
n = int(input("How many keys ? :"))

school_data = []

for i in range(1, ndata + 1):

    d = {}

    for i in range(1, n + 1):
        k = input(f"Enter a key [{i}] :")
        v = input(f"Enter a value of {k} : ")
        d[k] = v

    school_data.append(d)

f = open("./practice/csv/school_details.csv", "w", newline="")

m = csv.DictWriter(f, school_data[0].keys())

m.writeheader()
m.writerows(school_data)

f.close()