# Write a Python program to reverse a string without using slicing.

a = "Tapan Rathod"
b = list(a)
b.reverse()
print(b)


# Write a Python program to check if a string is palindrome or not.

a = input("Enter the pelidrome string:")
p = a[::-1]
if a == p:
    print("string is pelidrome")
else:
    print("string is not pelidrome")


# Write a Python program to count the occurrences of a character in a string.

# a = "Hello, World!"
# a = input("Enter the string: ")
# b = input("Enter the character: ")
# print(a.count(b)) # it counts only single character
# char_count = b
# count = 0
# for char in a:
#     if char == char_count:
#         count += 1
# print(f"The character '{char_count}' occurs {count} times in the string.")

a = input("Enter a sentence:") # using empty dictionary
d={}
for i in a:
    d[i] = a.count(i)
print(d)

# Write a Python program to count the number of vowels and consonants in a string.

a = "Hello, World!"
vowels = "aeiouAEIOU"
vowel_count = 0
consonant_count = 0
for char in a:
    if char in vowels:
        vowel_count += 1
    elif char.isalpha():
        consonant_count += 1
print(f"Number of vowels: {vowel_count}")
print(f"Number of consonants: {consonant_count}")


# Write a Python program to find the frequency of each character in a string (ignore case sensitivity). #ai

a = "Hello, World!"
frequency = {}
for char in a.lower():
    if char.isalpha():
        if char in frequency:
            frequency[char] += 1
        else:
            frequency[char] = 1
print("Character frequency:")
for char, count in frequency.items():
    print(f"{char}: {count}")


# Write a Python program to capitalize the first letter of each word in a sentence.

a = "hello, world!"
capitalized_sentence = a.title()
print(capitalized_sentence)


# Write a Python program to find all occurrences of a substring in a given string. #ai

a = "Hello, World! Hello everyone!"
substring = "Hello"
occurrences = []
start = 0
while True:
    pos = a.find(substring, start)
    if pos == -1:
        break
    occurrences.append(pos)
    start = pos + 1
print(f"Occurrences of '{substring}': {occurrences}")


# Write a Python program to remove all leading and trailing whitespace characters from a string.

# Write a Python program to find the longest word in a sentence.

a = "The quick brown fox jumps over the lazy dog"
words = a.split()
longest_word = max(words, key=len)
print(f"The longest word is: {longest_word}")


# Write a Python program to check if a string contains only digits.

a = "12345"
if a.isdigit():
    print("The string contains only digits.")
else:
    print("The string does not contain only digits.")


# Write a Python program to find the most occurring character in a string. #ai

a = "Hello, World!"
frequency = {}
for char in a:
    if char.isalpha():
        if char in frequency:
            frequency[char] += 1
        else:
            frequency[char] = 1
most_occurring_char = max(frequency, key=frequency.get)
print(
    f"The most occurring character is: '{most_occurring_char}' with {frequency[most_occurring_char]} occurrences."
)


# Write a Python program to check if two strings are anagrams of each other.

a = "listen"
b = "silent"
if sorted(a) == sorted(b):
    print("The strings are anagrams of each other.")
else:
    print("The strings are not anagrams of each other.")


# Write a Python program to find the first non-repeating character in a string. #ai

a = "swiss"
frequency = {}
for char in a:
    if char in frequency:
        frequency[char] += 1
    else:
        frequency[char] = 1
first_non_repeating_char = None
for char in a:
    if frequency[char] == 1:
        first_non_repeating_char = char
        break
if first_non_repeating_char:
    print(f"The first non-repeating character is: '{first_non_repeating_char}'")
else:
    print("There are no non-repeating characters in the string.")


# Write a Python program to validate an email address using regular expressions.

import re

email = "reddicmice@gmail.com"
pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
if re.match(pattern, email):
    print("The email address is valid.")
else:
    print("The email address is invalid.")
