# # Write a Python program to create a dictionary with key-value pairs representing the names of students and their grades. Print the grade of a specific student.

# sg = {
#     "student1": "A",
#     "student2": "B",
#     "student3": "C",
#     "student4": "A",
#     "student5": "B"
# }

# student_name = "student1"
# grade = sg.get(student_name, "Student not found")
# print("The grade of", student_name, "is:", grade)


# # Given a dictionary, write a Python function to add a new key-value pair to it. Also, demonstrate how to update the value of an existing key.


# # Write a Python program to demonstrate the use of the get() method for retrieving values from a dictionary.

# a = {
#     "key1": "value1",
#     "key2": "value2",
#     "key3": "value3"
# }

# key_to_retrieve = "key2"
# value =a.get(key_to_retrieve, "Key not found in the dictionary.")
# print("The value for", key_to_retrieve, "is:", value)

# key_to_retrieve = "key4"
# value = a.get(key_to_retrieve, "Key not found in the dictionary.")
# print("The value for", key_to_retrieve, "is:", value)


# # Write a Python program to demonstrate the use of the items(), keys(), and values() methods to iterate over a dictionary's keys and values.


# # Write a Python program to remove a specific key-value pair from dictionary using the pop() method. Also, demonstrate the use of the popitem() method to remove and return the last inserted key-value pair.

# my_dict = {
#     "key1": "value1",
#     "key2": "value2",
#     "key3": "value3"
# }

# key_to_remove = "key2"
# removed_value = my_dict.pop(key_to_remove, "Key not found in the dictionary.")
# print("Removed value for", key_to_remove, "is:", removed_value)
# print("Dictionary after removing the key-value pair:", my_dict)

# removed_item = my_dict.popitem()
# print("Removed item using popitem():", removed_item)
# print("Dictionary after using popitem():", my_dict)


# # Write a Python function that checks whether a given key exists in a dictionary and returns an appropriate message.

# def check_key_exists(dictionary, key):
#     if key in dictionary:
#         return "Key exists in the dictionary."
#     else:
#         return "Key does not exist in the dictionary."

# my_dict = {
#     "key1": "value1",
#     "key2": "value2",
#     "key3": "value3"
# }

# key_to_check = "key2"
# result = check_key_exists(my_dict, key_to_check)
# print("Checking for key:", key_to_check, "-", result)

# key_to_check = "key4"
# result = check_key_exists(my_dict, key_to_check)
# print("Checking for key:", key_to_check, "-", result)


# # Write a Python program to merge two dictionaries into one. Demonstrate how to handle conflicts if both dictionaries contain the same key.

# dict1 = {
#     "key1": "value1",
#     "key2": "value2",
#     "key3": "value3"
# }
# dict2 = {
#     "key2": "new_value2",
#     "key4": "value4",
#     "key5": "value5"
# }


# # Write a Python program to create a dictionary using dictionary comprehension. For example, create a dictionary where the keys are numbers from 1 to 10 and the values are the squares of the keys.

# squares = {x: x**2 for x in range(0, 10)}
# print("Dictionary of numbers and their squares:", squares)


# Write a Python program using the defaultdict class from the collections module to group a list of words by their first letter.


# create a dictionary of 5 students with their marks. add a new student using update()

# student_marks = {
#     "student1": "50",
#     "student2": "60",
#     "student3": "70",
#     "student4": "80",
#     "student5": "90"
# }
# print(student_marks)

# new_student = {
#     "student6": "100"
# }

# student_marks.update(new_student)
# print(student_marks)

# questions

# merging using setdefault()

# d1 = {
#     "a" : 10,
#     "b" : 20
# }

# d2 = {
#     "c" : 30
# }

# print(d1)
# print(d2)
# print()
# d1.setdefault("c", "30")
# print(d1)


# Create a dictionary using fromkeys() with keys ['x','y','z'] and default value 0.

a=["x","y","z"]
b={}
#Fromkeys: Multi list me keys ki koi bhi ek values ko sabhi keys me set krne ke liye
c = b.fromkeys(a, 0) 
print(c)


# Merge two dictionaries using update() and observe what happens to duplicate keys.


a={
    "a":45,
    "b":67,
    "c":44
}

b={
    "d":56,
    "e":55
}

a.update(b)
print(a)


# Given a dictionary, safely access a key using get() without raising an error.


b = {
    "Name":"Jay Veer",
    "State":"Gujarat",
    "country" : "India",
    "age" : 50
}

print(b.get("Name"))


# Write a program that uses get() to count occurrences of elements in a list.


a=["aaa","333","333","ddd","dsf","ddd","asd","sds","djsd"]

print(a.count("333"))


# Use setdefault() to group words by their first letter.

a={
    "Name":"Narendra",
    "City":"Ahmedabad",
    "Age":35
}

a.setdefault("Area","Naroda")
print(a)


# Remove a key using pop() and print the removed value.

a={
    "Name":"jay",
    "Age":34,
    "State":"Gujarat"
}

b=a.pop("Name")
print(b)


# Use popitem() to remove the last inserted key-value pair and explain the result.


a={
    "Name":"Narendra",
    "City":"Ahmedabad",
    "Age":35
}


a.popitem()
print(a)


# Print all keys using keys() and convert them into a list.


a={
    "Name":"jay",
    "Age":34,
    "State":"Gujarat"
}

print(a.keys())
b=list(a.keys())
print(b)


# Print all values using values() and find the maximum value.


a={
    "Mark 1":56,
    "Mark 2":78,
    "Mark 3":45,
        
}

b=list(a.values())
print(b)
max=b[0]

for i in b:
       
        if i>max:
            max=i


print("Max: ", max)    


# Create a new dictionary where keys and values are swapped using items().


a = {"Name": "jay", "Age": 34, "State": "Gujarat"}

b = list(a.items())
print(b)

for i in range(0, len(b)):
    b[i] = list(b[i])

for i in b:
    c = i[0]
    i[0] = i[1]
    i[1] = c

print(b)



# Create a shallow copy using copy() and modify original—observe changes.

a={
    "Name":"jay",
    "Age":34,
    "State":"Gujarat"
}

b=a.copy()

a.setdefault("city", "dubai")

print(b)


# Given a dictionary, filter out items with values less than 50 using dictionary comprehension.
# Combine two dictionaries using | operator (Python 3.9+) and compare with update().


a={
    "Raj":34,
    "Jay":56,
    "Jaydeep":67,
    "Umang":55
}

b=list(a.items())
print(b)

d = ()

for i in b:
    if (i[1] >= 50) :
        print(i)
    
    


# Convert two lists into a dictionary using zip().
a=[1,2,3,4,5,6]
b=["a","b","c","d","e","f"]

c=dict(zip(a,b))
print(c)
