# 7, 11, 15, 16, 19, 21 # except these programs write all in "Python File Exercises"
# user input will required in 4th and 18t program [must]

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

# append :

file = open(
    "./practice/file_handling/myfile.txt", "a"
)  # here "a" to append text to a file
file.write("\nThis is an appended line.")  # to append text to a file
file.close()  # to close the file [must]


# Write a Python program to read an entire text file.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
content = file.read()  # to read the content of a file
print(content)  # to print the content of a file
file.close()  # to close the file [must]

# Write a Python program to read first n lines of a file.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
n = 2  # number of lines to read
for i in range(n):
    line = file.readline()  # to read a line from a file
    print(line)  # to print the line
file.close()  # to close the file [must]

# Write a Python program to append text to a file and display the text.

file = open(
    "./practice/file_handling/myfile.txt", "a"
)  # here "a" to append text to a file
file.write("\nThis is an appended line.")  # to append text to a file
file.close()  # to close the file [must]
file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
content = file.read()  # to read the content of a file
print(content)  # to print the content of a file
file.close()  # to close the file [must]

# Write a Python program to read last n lines of a file with user input.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
n = int(
    input("Enter the number of lines to read from the end of the file: ")
)  # user input for number of lines
lines = file.readlines()  # to read all lines of a file
last_n_lines = lines[-n:]  # to get the last n lines
for line in last_n_lines:
    print(line)  # to print each line
file.close()  # to close the file [must]

# Write a Python program to read a file line by line and store it into a list.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
lines = file.readlines()  # to read all lines of a file
lines_list = [line.strip() for line in lines]  # to store lines into a list
print(lines_list)  # to print the list of lines
file.close()  # to close the file [must]

# Write a Python program to read a file line by line store it into a variable.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
lines = file.readlines()  # to read all lines of a file
lines_variable = "\n".join(lines)  # to store lines into a variable
print(lines_variable)  # to print the variable containing lines
file.close()  # to close the file [must]

# Write a python program to find the longest words.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
content = file.read()  # to read the content of a file
words = content.split()  # to split the content into words
longest_word = max(words, key=len)  # to find the longest word
print("The longest word is:", longest_word)  # to print the longest word
file.close()  # to close the file [must]

# Write a Python program to count the number of lines in a text file.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
lines = file.readlines()  # to read all lines of a file
line_count = len(lines)  # to count the number of lines
print("Number of lines in the file:", line_count)  # to print the number of lines
file.close()  # to close the file [must]

# Write a Python program to count the frequency of words in a file.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
content = file.read()  # to read the content of a file
words = content.split()  # to split the content into words
word_frequency = {}  # to store word frequency
for word in words:
    if word in word_frequency:
        word_frequency[word] += 1  # to increment the count of the word
    else:
        word_frequency[word] = 1  # to initialize the count of the word
print("Word Frequency:", word_frequency)  # to print the word frequency
file.close()  # to close the file [must]

# Write a Python program to write a list to a file.

my_list = ["Hello", "World", "This", "is", "a", "list"]  # list to write to a file
file = open("./practice/file_handling/mylist.txt", "w")  # here "w" to write in a file
for item in my_list:
    file.write(item + "\n")  # to write each item in the list to a file
file.close()  # to close the file [must]

# Write a Python program to copy the contents of a file to another file.

source_file = open(
    "./practice/file_handling/myfile.txt", "r"
)  # here "r" to read a file
destination_file = open("./practice/file_handling/copiedfile.txt", "w")  #
for line in source_file:
    destination_file.write(
        line
    )  # to copy each line from source file to destination file
source_file.close()  # to close the source file [must]
destination_file.close()  # to close the destination file [must]

# Write a Python program to combine each line from first file with the corresponding line in second file. #ai

file1 = open(
    "./practice/file_handling/myfile.txt", "r"
)  # here "r" to read the first file
file2 = open(
    "./practice/file_handling/mylist.txt", "r"
)  # here "r" to read the second file
combined_file = open(
    "./practice/file_handling/combinedfile.txt", "w"
)  # here "w" to write in the combined file
lines1 = file1.readlines()  # to read all lines of the first file
lines2 = file2.readlines()  # to read all lines of the second file
for line1, line2 in zip(lines1, lines2):
    combined_line = (
        line1.strip() + " " + line2.strip()
    )  # to combine lines from both files
    combined_file.write(
        combined_line + "\n"
    )  # to write the combined line to the combined file
file1.close()  # to close the first file [must]
file2.close()  # to close the second file [must]
combined_file.close()  # to close the combined file [must]

# Write a Python program to remove newline characters from a file.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
lines = file.readlines()  # to read all lines of a file
cleaned_lines = [
    line.strip() for line in lines
]  # to remove newline characters from each line
cleaned_content = "\n".join(cleaned_lines)  # to join the cleaned lines
print(cleaned_content)  # to print the cleaned content
file.close()  # to close the file [must]

# Write a Python program that takes a text file as input and returns the number of words of a given text file with user input. Note: Some words can be separated by a comma with no space.

file = open("./practice/file_handling/myfile.txt", "r")  # here "r" to read a file
content = file.read()  # to read the content of a file
n = int(
    input("Enter the number of words to count: ")
)  # user input for number of words to count
words = content.split()  # to split the content into words
word_count = len(words)  # to count the number of words
print("Number of words in the file:", word_count)  # to print the number of words
file.close()  # to close the file [must]

# Write a Python program to generate 26 text files named A.txt, B.txt, and so on up to Z.txt using a loop.

for letter in range(65, 91):  # to loop through uppercase letters
    file_name = f"./practice/file_handling/{chr(letter)}2.txt"  # to create file name
    with open(file_name, "w") as file:  # to create and open the file for writing
        file.write(f"This is {letter}.txt")  # to write some content in the file
