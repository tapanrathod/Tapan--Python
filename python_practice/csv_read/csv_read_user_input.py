# user input :

import csv

file = input("Enter a file name : ")

path = f"./practice/csv_read/{file}"

file = open(path, "r")

if file == "students.csv":
    print("1. city")
    print("2. state")
    print("3. id")

elif file == "employees.csv":
    print("1. name")
    print("2. department")
    print("3. salary")
    print("4. id")

elif file == "products.csv":
    print("1. product")
    print("2. category")
    print("3. price")
    print("4. id")

else:
    print("File not found")

with open(f"./practice/csv_read/{file}", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

filter_choice = input("Enter your choice : ")

c = input(f"Enter {filter_choice} : ")

b = list(filter(lambda x: x[filter_choice] == c, data))
# print(b)


for i in b :
    print(i)
file.close()


# user input with error handling :

import csv

try:
    file = input("Enter a file name : ")

    path = f"./practice/csv_read/{file}"

    with open(path, "r") as file:

        read = csv.DictReader(file)

        data = list(read)

    filter_choice = input("Enter your choice : ")

    c = input(f"Enter {filter_choice} : ")

    b = list(filter(lambda x: x[filter_choice] == c, data))

    for i in b:

        print(i)

except FileNotFoundError:
    print("File not found. Please Enter Valid File Name.")

except NameError:
    print("Name is not defined. Please Enter Valid Name.")

except KeyError:
    print("Invalid choice. Please Enter Valid Option.")

except ValueError:
    print("Invalid input. Please Enter Valid Option.")

except IndexError:
    print("Invalid choice. Please Enter Valid Option.")