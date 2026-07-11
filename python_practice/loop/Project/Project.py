# Write a Python program to find the most occurring character in a string.

def mostOccurringChar(s) :
    charCount = {}
    for char in s :
        if char in charCount :
            charCount[char] += 1
        else :
            charCount[char] = 1
    mostOccurring = max(charCount, key=charCount.get)
    print("The most occurring character in the string is:", mostOccurring)
s = input("Enter a string :")
mostOccurringChar(s)


# Write a Python program to check if two strings are anagrams of each other.

def areAnagrams(s1, s2) :
    return sorted(s1) == sorted(s2)
s1 = input("Enter the first string :")
s2 = input("Enter the second string :")
if areAnagrams(s1, s2) :
    print("The strings are anagrams of each other.")
else :
    print("The strings are not anagrams of each other.")


# Write a Python program to find the first non-repeating character in a string.

def firstNonRepeatingChar(s) :
    charCount = {}
    for char in s :
        if char in charCount :
            charCount[char] += 1
        else :
            charCount[char] = 1
    for char in s :
        if charCount[char] == 1 :
            print("The first non-repeating character in the string is:", char)
            return
    print("There is no non-repeating character in the string.")
s = input("Enter a string :")
firstNonRepeatingChar(s)


# Regular Expressions:

# 1. Write a Python program to validate an email address using regular expressions.

import re
def validateEmail(email) :
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    if re.match(pattern, email) :
        print("The email address is valid.")
    else :
        print("The email address is invalid.")
email = input("Enter an email address :")
validateEmail(email)


# 2. Write a Python program to extract numbers from a string using regular expressions.

import re
def extractNumbers(s) :
    numbers = re.findall(r'\d+', s)
    print("The numbers extracted from the string are:", numbers)
s = input("Enter a string :")
extractNumbers(s)


# 3. Write a Python program to replace specific patterns in a string using regular expressions.

import re
def replacePattern(s, pattern, replacement) :
    newString = re.sub(pattern, replacement, s)
    print("The string after replacing the pattern is:", newString)
s = input("Enter a string :")
pattern = input("Enter the pattern to replace :")
replacement = input("Enter the replacement string :")
replacePattern(s, pattern, replacement)


# Encoding and Decoding:

# 1. Write a Python program to encode a string into base64 format.

import base64
def encodeBase64(s) :
    encodedBytes = base64.b64encode(s.encode('utf-8'))
    encodedString = encodedBytes.decode('utf-8')
    print("The string encoded in base64 format is:", encodedString)
s = input("Enter a string :")
encodeBase64(s)


# 2. Write a Python program to decode a base64 encoded string.

import base64
def decodeBase64(encodedString) :
    decodedBytes = base64.b64decode(encodedString.encode('utf-8'))
    decodedString = decodedBytes.decode('utf-8')
    print("The decoded string is:", decodedString)
encodedString = input("Enter a base64 encoded string :")
decodeBase64(encodedString)