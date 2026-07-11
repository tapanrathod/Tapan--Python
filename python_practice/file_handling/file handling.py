# create, write and read :

# create :

# simple program to create a file

# f = open("./lectures/myFile.txt", "x") # here "x" to create a file

# f.close() # to close the file [must]


# create a file using error handling

# try :

#     f = open("./lectures/myFile.txt", "x") # here "x" to create a file

#     f.close() # to close the file [must]

# except FileExistsError as e:

#     print("File already exist") # print an error for the file is already exist


# write and append :

# f = open("./lectures/myFile.txt", "w") # here "w" to write a file
# f = open("./lectures/myFile.txt", "a") # here "a" to append a file

# s = input("Enter any sentence :")

# f.write("Hello World1\n") # adds a sentence in new line "\n"
# f.write("Hello World2\n") # adds a sentence in new line "\n"
# f.write("Hello World3\n") # adds a sentence in new line "\n"
# f.write("Hello World4\n") # adds a sentence in new line "\n"

# f.write("\n" +s) # automatecally adds a sentence in new line

# f.close() # must


# read :

# read a file using simple program

# f = open(f"./lectures/myFile.txt", "r") # here "r" to read a file # file path is must if already created

# print(f.read()) # reads whole file
# print(f.readlines()) # reads all lines in file
# print(f.readline()) # reads first line
# print(f.readline()) # reads second line because "print(f.readline())" is already written above

# f.close() # must

# read a file using error handling

# try :
#     f = open(f"./lectures/myFile.txt", "r") # here "r" to read a file # file path is must if already created

#     print(f.read()) # reads whole file
#     print(f.readlines()) # reads all lines in file
#     print(f.readline()) # reads first line
#     print(f.readline()) # reads second line because "print(f.readline())" is already written above

#     f.close() # must

# except FileNotFoundError as e :

#     print("File not found")


# 7, 11, 15, 16, 19, 21 # except these programs write all in Python File Exercises
# user input will required in 4th and 18t program
