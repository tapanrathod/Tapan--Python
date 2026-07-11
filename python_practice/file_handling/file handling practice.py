# create :

file_path = "./practice/file_handling/myfile.txt"  # file path is must if you want to create a file on specific location

# file = open("./practice/file_handling/myfile.txt", "x") # here "x" to create a file # tihis line is commented because file is already created

# file created using error handling

try:

    file = open(file_path, "x")  # here "x" to create a file
    
    file.close()  # to close the file [must]

except FileExistsError as e:

    print("File is already exist")  # print an error for the file is already exist

# write :

file = open("./practice/file_handling/myfile.txt", "w")  # here "w" to write in a file
file.write("Hello, this is a simple program to write in a file.")  # to write in a file

# read :

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
content = file.read()  # to read the content of a file

print(content)  # to print the content of a file

file.close()  # to close the file [must]
