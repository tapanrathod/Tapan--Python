# import csv

# f = open("students.csv", "r")  # already created file

# r = csv.DictReader(f)
# data = list(r)

# cols = r.fieldnames  # for new file (new program)


# print(len(data))
# print(data)

# c = list(filter(lambda x : x["gender"] == "Male", data)) # filter
# c = list(filter(lambda x : x["city"] == "Vadodara" and x["city"] == "Ahmedabad" , data)) # both conditions will be true
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


# with open("students.csv", "r") as f:
#     d = list(csv.DictReader(f))
#     print(d)



# user input : 

f = input("Enter a file name : ")

path = f"./practice/csv_read/{f}"


file = open(path, "r")

if f == "students.csv" : 
    print("1. city")
    print("2. state")
    print("3. id")

filter_choice = int(input("Enter your choice : "))

c = input(f"Enter {filter_choice} : ")

b = list(filter(lambda x: x[filter_choice] == c,  ))


file.close()
