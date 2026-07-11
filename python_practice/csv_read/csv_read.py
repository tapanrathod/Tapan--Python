# import csv

# f = open("students.csv", "r")  # already created file

# r = csv.DictReader(f)
# data = list(r)

# cols = r.fieldnames  # for new file (new program)


# # print(len(data))
# # print(data)

# # c = list(filter(lambda x : x["gender"] == "Male", data)) # filter
# # c = list(filter(lambda x : x["city"] == "Vadodara" and x["city"] == "Ahmedabad" , data)) # both conditions will be true
# c = list(filter(lambda x: x["city"] == "Vadodara" or x["city"] == "Ahmedabad", data))  # one of them will be true

# print(len(c))

# for i in c:
#     print(i["name"])

# f.close()

# f = open("newData.csv", "w", newline="")  # adds data in new file

# w = csv.DictWriter(f, cols)

# w.writeheader()
# w.writerows(c)

# f.close()


# # with open("students.csv", "r") as f:
# #     d = list(csv.DictReader(f))
# #     print(d)


# user input :

import csv

f = input("Enter a file name : ")

path = f"./practice/csv_read/{f}"

file = open(path, "r")

if f == "students.csv":
    print("1. city")
    print("2. state")
    print("3. id")

elif f == "employees.csv":
    print("1. name")
    print("2. department")
    print("3. salary")
    print("4. id")

elif f == "products.csv":
    print("1. product")
    print("2. category")
    print("3. price")
    print("4. id")

else:
    print("File not found")

with open(f"./practice/csv_read/{f}", "r") as file:

    read = csv.DictReader(file)

    data = list(read)

filter_choice = input("Enter your choice : ")

c = input(f"Enter {filter_choice} : ")

b = list(filter(lambda x: x[filter_choice] == c, data))
# print(b)


for i in b :
    print(i)
file.close()

# do with error handling