# Basic List Operations

# Write a Python program to create a list of 10 integers.

a = [] # list

for i in range(10):
    element = int(input("Enter integer: "))
    a.append(element)
print(a)


# Write a Python program to append an element to a list.

a = [] # list

element = (input("Enter an element to append: "))
a.append(element) # append value to list

print(a) # print updated list


# Write a Python program to insert an element at a specific position in a list.

a = [1, 2, 3, 4] # list

element = int(input("Enter an element to insert: "))
position = int(input("Enter the position where you want to insert the element: "))
a.insert(position, element) # insert value at specific position

print(a) # print updated list


# Write a Python program to remove an element from a list.

a = [1, 2, 3, 4, 5] # list
    
element = int(input("Enter an element to remove: "))
a.remove(element) # remove specific element from list

print(a) # print updated list


# List Slicing

# Write a Python program to print the first 5 elements of a list.

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] # list
print(a[:5]) # print first 5 elements of the list


# Write a Python program to print the last 5 elements of a list.

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] # list
print(a[-5:]) # print last 5 elements of the list


# Write a Python program to print a sublist from index 2 to index 7.

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] # list
print(a[2:8]) # print sublist from index 2 to index 7


# List Comprehensions

# Write a Python program to create a list of squares of numbers from 1 to 10 using list comprehension.

squares = [x**2 for x in range(1, 11)] # create list of squares using list comprehension
print(squares) # print the list of squares


# Write a Python program to create a list of even numbers from 1 to 20 using list comprehension.

even_numbers = [x for x in range(1, 21) if x % 2 == 0] # create list of even numbers using list comprehension
print(even_numbers) # print the list of even numbers


# Advanced List Operations

# Write a Python program to find the maximum and minimum elements in a list.

a = [3, 1, 4, 1, 5, 9, 2, 6, 5] # list

max_element = max(a) # find maximum element in the list
min_element = min(a) # find minimum element in the list

print("Maximum element:", max_element) # print maximum element
print("Minimum element:", min_element) # print minimum element


# Write a Python program to find the sum of all elements in a list.

a = [1, 2, 3, 4, 5] # list

total_sum = sum(a) # find the sum of all elements in the list
print("Sum of all elements:", total_sum) # print the sum of all elements


# Write a Python program to count the number of occurrences of a specific element in a list.

a = [1, 2, 3, 4, 5, 1, 2, 1] # list

element = int(input("Enter an element to count: "))
count = a.count(element) # count the number of occurrences of the specific element in the list

print(f"The element {element} occurs {count} times in the list.") # print the count of the specific element in the list
# print("The element", element,  "occurs", count,  "times in the list.") # print the count of the specific element in the list


# Write a Python program to sort a list in ascending and descending order.

a = [3, 1, 4, 1, 5, 9, 2, 6, 5] # list

a.sort() # sort the list in ascending order
print("List in ascending order:", a) # print the list in ascending order

a.sort(reverse=True) # sort the list in descending order
print("List in descending order:", a) # print the list in descending order


# Write a Python program to reverse a list.

a = [1, 2, 3, 4, 5] # list
a.reverse() # reverse the list
print("Reversed list:", a) # print the reversed list


# Write a Python program to find the index of a specific element in a list.

a = [1, 2, 3, 4, 5] # list
element = int(input("Enter an element to find its index: "))
index = a.index(element) # find the index of the specific element in the list
print(f"The index of element {element} is: {index}") # print the index of the specific element in the list


# List Transformation

# Write a Python program to convert a list of strings to a list of integers.

string_list = ["1", "2", "3", "4", "5"] # list of strings
integer_list = [int(x) for x in string_list] # convert list of strings to list of integers using list comprehension
print("List of integers:", integer_list) # print the list of integers


# Nested Lists

# Write a Python program to create a 3x3 matrix as a nested list.

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] # create a 3x3 matrix as a nested list
print("3x3 Matrix:")
for row in matrix:
    print(row) # print the 3x3 matrix