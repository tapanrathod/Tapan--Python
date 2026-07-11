# Write a python program to create a text file and write your biodta into it

# create :

# filename = input("Enter the name to create a file :")
file_path = "./practice/file_handling/bio.txt"
name = input("Enter your name :")
address = input("Enter your address :")
age = input("Enter your age :")
contact = input("Enter your contact :")
gender = input("Enter your gender :")

try:

    f = open("./practice/file_handling/bio.txt", "x")

    f.close()

except FileExistsError as e:
    print("Biodata is already exist")

# write :

f = open("./practice/file_handling/bio.txt", "w")

f.write(f"name : {name}\n")
f.write(f"address : {address}\n")
f.write(f"age : {age}\n")
f.write(f"contact : {contact}\n")
f.write(f"gender : {gender}\n")

f.write("\n")

f.close()


# Write a python program to read a text file and display its contents in uppercase

# read :

try:
    f = open(f"./practice/file_handling/bio.txt", "r")

    print(f.read().upper())

    f.close()

except FileNotFoundError as e:
    print("File not found")

# Write a python program to count the number of vowels and consonants  in a file.


try:
    f = open(f"./practice/file_handling/bio.txt", "r")
    c = f.read().upper()

    # print(c)
    vowels = 0
    consonants = 0

    for char in c:
        if char in "aeiouAEIOU":
            vowels += 1

        else:
            consonants += 1

    print(f"vowels : {vowels}")
    print(f"consonants : {consonants}")

    f.close()

except FileNotFoundError as e:

    print("File not found")

# Write a Python program to copy the contents of one text file into another file.

try:
    source_file = open(f"./practice/file_handling/bio.txt", "r")
    destination_file = open(f"./practice/file_handling/bio_copy.txt", "w")

    content = source_file.read()

    destination_file.write(content)

    print("File copied successfully")

    source_file.close()
    destination_file.close()

except FileNotFoundError as e:

    print("File not found")

# Write a Python program to append multiple lines of text into a file.

try:
    f = open(f"./practice/file_handling/bio.txt", "a")

    f.write("\n")
    f.write("This is an appended line 1.\n")
    f.write("This is an appended line 2.\n")
    f.write("This is an appended line 3.\n")

    print("Lines appended successfully")

    f.close()

except FileNotFoundError as e:

    print("File not found")

# Write a Python program to read a file and display only odd-numbered lines.

try:
    f = open(f"./practice/file_handling/bio.txt", "r")

    lines = f.readlines()

    print("Odd-numbered lines :")
    for i in range(0, len(lines), 2):
        print(lines[i].strip())

    f.close()

except FileNotFoundError as e:
    print("File not found")


# Write a Python program to read a file and remove all spaces from its contents.

try:
    f = open(f"./practice/file_handling/bio.txt", "r")

    content = f.read()

    content_without_spaces = content.replace(" ", "")

    print("Content without spaces :")
    print(content_without_spaces)

    f.close()

except FileNotFoundError as e:
    print("File not found")


# Write a Python program to find the shortest word in a text file.

try:
    f = open(f"./practice/file_handling/bio.txt", "r")

    content = f.read()

    words = content.split()

    shortest_word = min(words, key=len)

    print(f"Shortest word : {shortest_word}")

    f.close()

except FileNotFoundError as e:
    print("File not found")

# Write a Python program to replace all occurrences of a word in a file.

try:
    f = open(f"./practice/file_handling/bio.txt", "r")

    content = f.read()

    word_to_replace = input("Enter the word to replace :")
    replacement_word = input("Enter the replacement word :")

    modified_content = content.replace(word_to_replace, replacement_word)

    f.close()

    f = open(f"./practice/file_handling/bio.txt", "w")

    f.write(modified_content)

    print("Word replaced successfully")

    f.close()

except FileNotFoundError as e:

    print("File not found")

# Write a Python program to count how many times each alphabet appears in a file.

try:
    f = open(f"./practice/file_handling/bio.txt", "r")

    content = f.read().upper()

    alphabet_count = {}

    for char in content:
        if char.isalpha():
            if char in alphabet_count:
                alphabet_count[char] += 1
            else:
                alphabet_count[char] = 1

    print("Alphabet count :")
    for alphabet, count in alphabet_count.items():

        print(f"{alphabet} : {count}")

    f.close()

except FileNotFoundError as e:

    print("File not found")

# Write a Python program to check whether a file exists or not.

import os

file_path = "./practice/file_handling/bio.txt"

if os.path.exists(file_path):

    print("File exists")

else:

    print("File does not exist")

# Write a Python program to reverse each line of a text file.

try:
    f = open(f"./practice/file_handling/bio.txt", "r")

    lines = f.readlines()

    print("Reversed lines :")
    for line in lines:
        reversed_line = line.strip()[::-1]
        print(reversed_line)

    f.close()
except FileNotFoundError as e:

    print("File not found")


# Write a Python program to sort all lines of a text file alphabetically.

try:
    f = open(f"./practice/file_handling/bio.txt", "r")

    lines = f.readlines()

    sorted_lines = sorted(lines)

    print("Sorted lines :")
    for line in sorted_lines:
        print(line.strip())

    f.close()
except FileNotFoundError as e:

    print("File not found")

# Write a Python program to separate uppercase and lowercase characters from a file.

try:
    f = open(f"./practice/file_handling/bio.txt", "r")

    content = f.read()

    uppercase_characters = [char for char in content if char.isupper()]
    lowercase_characters = [char for char in content if char.islower()]

    print("Uppercase characters :")
    print("".join(uppercase_characters))

    print("Lowercase characters :")
    print("".join(lowercase_characters))

    f.close()
except FileNotFoundError as e:

    print("File not found")

# Write a Python program to compare two text files and display the different lines.

try:
    file1 = open(f"./practice/file_handling/bio.txt", "r")
    file2 = open(f"./practice/file_handling/bio_copy.txt", "r")

    lines_file1 = set(file1.readlines())
    lines_file2 = set(file2.readlines())

    different_lines = lines_file1.symmetric_difference(lines_file2)

    print("Different lines :")
    for line in different_lines:
        print(line.strip())

    file1.close()
    file2.close()

except FileNotFoundError as e:
    print("File not found")
