# Create an integer array with 5 numbers entered by the user

from array import array as ar

arr = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("Array :", arr)


# Create a float array with 10 decimal numbers using user input

from array import array as ar

arr = ar("f", [])

for i in range(10):
    a = float(input(f"Enter 10 any float numbers {i+1} : "))
    arr.append(a)

print("Array:", arr)


# Create a character array using user-entered characters

from array import array as ar

arr = ar("w", [])

for i in range(5):
    a = input(f"Enter any characters : ")
    arr.append(a)

print("Array :", arr)


# Create an array and print:
#    - first element
#    - middle element
#    - last element


from array import array as ar

arr = ar("i", [])

for i in range(3):
    a = int(input(f"Enter any 3 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

print("\n1st Element of Array is ", arr[0])
print("\n2nd Element of Array is ", arr[1])
print("\n3rd Element of Array is ", arr[2])


# Take 8 integers from the user and print only even numbers

from array import array as ar

arr = ar("i", [])
num = 0

for i in range(8):
    a = int(input(f"Enter any 8 integer numbers {i+1} : "))
    arr.append(a)

arr2 = ar("i", [])

for num in arr:

    if num % 2 == 0:
        arr2.append(num)

print("\nArray :", arr)
print("\nArray of Even number is ", arr2)


# Take 8 integers from the user and print only even numbers

from array import array as ar

arr = ar.array("i", [])
for i in range(8):
    a = int(input(f"Enter any 8 integer numbers {i+1} : "))
    arr.append(a)

arr2 = ar.array("i", [])

for num in arr:

    if num % 2 == 0:
        arr2.append(num)

print("\nArray :", arr)
print("\nArray of Even number is ", arr2)


# Print all array elements using:
#    - for loop
#    - while loop

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)
print("\nUsing for loop : ")

for num in arr:
    print(num)

print("\nUsing while loop : ")
i = 0

while i < len(arr):
    i += 1

    print(arr[i])


# Print array elements in reverse order without slicing

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)
print("\nArray in reverse order : ")

for i in range(len(arr) - 1, -1, -1):
    print(arr[i])


# Find sum of all array elements

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

sum = 0

for num in arr:
    sum += num

print("\nSum of all array elements is ", sum)


# Find largest and smallest element from array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

largest = arr[0]

for num in arr:

    if num > largest:
        largest = num

print("\nLargest element in array is ", largest)

smallest = arr[0]

for num in arr:

    if num < smallest:
        smallest = num

print("\nSmallest element in array is ", smallest)


# Count even and odd numbers in array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

even_count = 0
odd_count = 0

for num in arr:

    if num % 2 == 0:
        even_count += 1

    else:
        odd_count += 1

print("\nEven numbers count in array is ", even_count)
print("\nOdd numbers count in array is ", odd_count)


# Append 5 user-entered elements into an empty array using append()

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)


# Insert an element at user-given position using insert()

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

position = int(input("\nEnter position to insert element : "))
element = int(input("\nEnter element to insert : "))

arr.insert(position, element)

print("\nArray after insertion :", arr)


# Insert multiple elements one by one at beginning of array

from array import array as ar

arr = ar.array("i", [])
for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

for i in range(5):
    element = int(input(f"\nEnter element to insert at beginning of array {i+1} : "))
    arr.insert(0, element)

print("\nArray after insertion :", arr)


# Append one array into another array using loop

from array import array as ar

arr1 = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for first array {i+1} : "))
    arr1.append(a)

arr2 = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for second array {i+1} : "))
    arr2.append(a)

print("\nFirst Array :", arr1)
print("\nSecond Array :", arr2)


# Merge two arrays into third array

from array import array as ar

arr1 = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for first array {i+1} : "))
    arr1.append(a)

arr2 = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for second array {i+1} : "))
    arr2.append(a)

print("\nFirst Array :", arr1)
print("\nSecond Array :", arr2)

arr3 = ar.array("i", [])

for num in arr1:
    arr3.append(num)
for num in arr2:
    arr3.append(num)

print("\nMerged Array :", arr3)


# Remove a specific value entered by user using remove()

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

value = int(input("\nEnter value to remove from array : "))

arr.remove(value)

print("\nArray after removing value :", arr)


# Remove element using index position with pop()

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

index = int(input("\nEnter index position to remove element from array : "))

arr.pop(index)

print("\nArray after removing element at index position :", arr)


# Remove all occurrences of a user-given number

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

value = int(input("\nEnter value to remove all occurrences from array : "))

while value in arr:
    arr.remove(value)

print("\nArray after removing all occurrences of value :", arr)


# Clear all elements from array manually using loop

from array import array as ar

arr = ar.array("i", [])
for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

while len(arr) > 0:
    arr.pop()

print("\nArray after clearing all elements :", arr)


# Delete elements between two index positions # AI

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))  # AI
    arr.append(a)

print("\nArray :", arr)

start_index = int(
    input("\nEnter start index position to delete elements from array : ")
)

end_index = int(input("\nEnter end index position to delete elements from array : "))

for i in range(end_index, start_index - 1, -1):  # AI
    arr.pop(i)

print("\nArray after deleting elements between index positions :", arr)


# Search whether a number exists in array or not

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

value = int(input("\nEnter value to search in array : "))

if value in arr:
    print("\nValue exists in array.")

else:
    print("\nValue does not exist in array.")


# Find index position of specific element using index()

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

value = int(input("\nEnter value to find index position in array : "))

if value in arr:
    index_position = arr.index(value)
    print(f"\nIndex position of {value} in array is {index_position}.")

else:
    print("\nValue does not exist in array.")


# Count occurrences of a number using count()

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

value = int(input("\nEnter value to count occurrences in array : "))
occurrences = arr.count(value)

print(f"\nNumber of occurrences of {value} in array is {occurrences}.")


# Find all positions of repeated number in array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

value = int(input("\nEnter value to find all positions in array : "))

positions = []

for i in range(len(arr)):

    if arr[i] == value:
        positions.append(i)

if len(positions) > 0:
    print(f"\nAll positions of {value} in array are {positions}.")

else:
    print("\nValue does not exist in array.")


# Check whether array contains duplicate values

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

if len(arr) != len(set(arr)):
    print("\nArray contains duplicate values.")

else:
    print("\nArray does not contain duplicate values.")


# Replace all negative numbers with 0

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

for i in range(len(arr)):

    if arr[i] < 0:
        arr[i] = 0

print("\nArray after replacing negative numbers with 0 :", arr)


# Replace all even numbers with their square

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

for i in range(len(arr)):

    if arr[i] % 2 == 0:
        arr[i] = arr[i] ** 2

print("\nArray after replacing even numbers with their square :", arr)


# Update element at user-given index

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

index = int(input("\nEnter index position to update element in array : "))
new_value = int(input("\nEnter new value to update at index position in array : "))

arr[index] = new_value

print("\nArray after updating element at index position :", arr)


# Swap first and last element of array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

temp = arr[0]
arr[0] = arr[len(arr) - 1]
arr[len(arr) - 1] = temp

print("\nArray after swapping first and last element :", arr)


# Swap every two adjacent elements

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

for i in range(0, len(arr) - 1, 2):
    temp = arr[i]
    arr[i] = arr[i + 1]
    arr[i + 1] = temp

print("\nArray after swapping every two adjacent elements :", arr)


# Sort array in ascending order without sort()

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

for i in range(len(arr)):

    for j in range(i + 1, len(arr)):

        if arr[i] > arr[j]:
            temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp

print("\nArray in ascending order :", arr)


# Sort array in descending order without sort()

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

for i in range(len(arr)):

    for j in range(i + 1, len(arr)):

        if arr[i] < arr[j]:
            temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp

print("\nArray in descending order :", arr)


# Find second largest element in array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

largest = arr[0]

for num in arr:

    if num > largest:
        largest = num

second_largest = arr[0]

for num in arr:

    if num > second_largest and num < largest:
        second_largest = num

print("\nSecond largest element in array is ", second_largest)


# Find third smallest element in array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

smallest = arr[0]

for num in arr:

    if num < smallest:
        smallest = num

second_smallest = arr[0]

for num in arr:

    if num < second_smallest and num > smallest:
        second_smallest = num

third_smallest = arr[0]

for num in arr:

    if num < third_smallest and num > second_smallest:
        third_smallest = num

print("\nThird smallest element in array is ", third_smallest)


# Separate positive and negative numbers into two arrays

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

positive_arr = ar("i", [])
negative_arr = ar("i", [])

for num in arr:

    if num >= 0:
        positive_arr.append(num)

    else:
        negative_arr.append(num)

print("\nArray of Positive numbers is ", positive_arr)
print("\nArray of Negative numbers is ", negative_arr)


# Copy one array into another using loop

from array import array as ar

arr1 = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for first array {i+1} : "))
    arr1.append(a)

arr2 = ar.array("i", [])

for num in arr1:
    arr2.append(num)

print("\nFirst Array :", arr1)
print("\nCopied Array :", arr2)


# Create duplicate array without built-in copy methods

from array import array as ar

arr1 = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for first array {i+1} : "))
    arr1.append(a)

arr2 = ar.array("i", [])

for num in arr1:
    arr2.append(num)

print("\nFirst Array :", arr1)
print("\nDuplicate Array :", arr2)


# Reverse-copy array into another array

from array import array as ar

arr1 = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for first array {i+1} : "))
    arr1.append(a)

arr2 = ar.array("i", [])

for i in range(len(arr1) - 1, -1, -1):
    arr2.append(arr1[i])

print("\nFirst Array :", arr1)
print("\nReverse-Copied Array :", arr2)


# Find average of array elements

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

sum = 0

for num in arr:
    sum += num

average = sum / len(arr)

print("\nAverage of array elements is ", average)


# Find multiplication of all elements in array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

product = 1

for num in arr:
    product *= num

print("\nMultiplication of all elements in array is ", product)


# Find frequency of every element in array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

frequency = {}

for num in arr:

    if num in frequency:
        frequency[num] += 1

    else:
        frequency[num] = 1

print("\nFrequency of every element in array is ", frequency)


# Find all prime numbers from array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

prime_numbers = []

for num in arr:

    if num > 1:
        is_prime = True

        for i in range(2, int(num**0.5) + 1):

            if num % i == 0:
                is_prime = False
                break

        if is_prime:
            prime_numbers.append(num)

print("\nPrime numbers from array are ", prime_numbers)


# Find all palindrome numbers from array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

palindrome_numbers = []

for num in arr:
    
    if str(num) == str(num)[::-1]:
        palindrome_numbers.append(num)

print("\nPalindrome numbers from array are ", palindrome_numbers)


# Find factorial of every element in array

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

factorials = {}

for num in arr:
    factorial = 1
    
    for i in range(1, num + 1):
        factorial *= i
        
    factorials[num] = factorial

print("\nFactorial of every element in array is ", factorials)


# Create separate arrays for even and odd numbers

from array import array as ar

arr = ar.array("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

even_arr = ar("i", [])
odd_arr = ar("i", [])

for num in arr:
    
    if num % 2 == 0:
        even_arr.append(num)
        
    else:
        odd_arr.append(num)

print("\nArray of Even numbers is ", even_arr)
print("\nArray of Odd numbers is ", odd_arr)


# Create menu-driven array program: # AI
#     1. Append
#     2. Insert
#     3. Remove
#     4. Search
#     5. Display
#     6. Exit

from array import array as ar

arr = ar("i", [])

while True:
    
    print("\nMenu:")
    print("1. Append")
    print("2. Insert")
    print("3. Remove")
    print("4. Search")
    print("5. Display")
    print("6. Exit")

    choice = int(input("\nEnter your choice : "))

    if choice == 1:
        element = int(input("\nEnter element to append : "))
        arr.append(element)

    elif choice == 2:
        position = int(input("\nEnter position to insert element : "))
        element = int(input("\nEnter element to insert : "))
        arr.insert(position, element)

    elif choice == 3:
        value = int(input("\nEnter value to remove from array : "))
        arr.remove(value)

    elif choice == 4:
        value = int(input("\nEnter value to search in array : "))
        
        if value in arr:
            print("\nValue exists in array.")
            
        else:
            print("\nValue does not exist in array.")

    elif choice == 5:
        print("\nArray :", arr)

    elif choice == 6:
        break

    else:
        print("\nInvalid choice. Please try again.")


# Take size from user and dynamically create array

from array import array as ar

size = int(input("Enter size of array : "))

arr = ar("i", [])

for i in range(size):
    a = int(input(f"Enter any {size} integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)


# Continuously insert values until user enters -1

from array import array as ar

arr = ar("i", [])

while True:
    a = int(input("Enter integer number to insert into array (enter -1 to stop) : "))
    if a == -1:
        break
    arr.append(a)

print("\nArray :", arr)


# Rotate array left by 1 position

from array import array as ar

arr = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

first_element = arr[0]

for i in range(1, len(arr)):
    arr[i - 1] = arr[i]

arr[len(arr) - 1] = first_element

print("\nArray after rotating left by 1 position :", arr)


# Rotate array right by k positions entered by user #AI

from array import array as ar

arr = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

k = int(input("\nEnter number of positions to rotate right : "))
k = k % len(arr)

for i in range(k):
    last_element = arr[len(arr) - 1]

    for j in range(len(arr) - 1, 0, -1):
        arr[j] = arr[j - 1]

    arr[0] = last_element

print("\nArray after rotating right by k positions :", arr)


# Find common elements between two arrays

from array import array as ar

arr1 = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for first array {i+1} : "))
    arr1.append(a)

arr2 = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for second array {i+1} : "))
    arr2.append(a)

print("\nFirst Array :", arr1)
print("\nSecond Array :", arr2)

common_elements = ar("i", [])

for num in arr1:
    if num in arr2 and num not in common_elements:
        common_elements.append(num)

print("\nCommon elements between two arrays are ", common_elements)


# Find unique elements from array

from array import array as ar

arr = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

unique_elements = ar("i", [])

for num in arr:
    if arr.count(num) == 1:
        unique_elements.append(num)

print("\nUnique elements from array are ", unique_elements)


# Remove duplicates from array

from array import array as ar

arr = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

unique_elements = ar("i", [])

for num in arr:
    if num not in unique_elements:
        unique_elements.append(num)

print("\nArray after removing duplicates is ", unique_elements)


# Check whether two arrays are equal

from array import array as ar

arr1 = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for first array {i+1} : "))
    arr1.append(a)

arr2 = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for second array {i+1} : "))
    arr2.append(a)

print("\nFirst Array :", arr1)
print("\nSecond Array :", arr2)

if arr1 == arr2:
    print("\nTwo arrays are equal.")

else:
    print("\nTwo arrays are not equal.")


# Find missing number from array containing numbers 1 to n

from array import array as ar

n = int(input("Enter value of n : "))

arr = ar("i", [])

for i in range(1, n):
    a = int(input(f"Enter any {n-1} integer numbers from 1 to {n} : "))
    arr.append(a)

print("\nArray :", arr)

total_sum = n * (n + 1) // 2
array_sum = sum(arr)
missing_number = total_sum - array_sum

print("\nMissing number from array is ", missing_number)


# Split array into two equal halves

from array import array as ar

arr = ar("i", [])

for i in range(6):
    a = int(input(f"Enter any 6 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

mid = len(arr) // 2
first_half = ar("i", [])
second_half = ar("i", [])

for i in range(mid):
    first_half.append(arr[i])

for i in range(mid, len(arr)):
    second_half.append(arr[i])

print("\nFirst half of array is ", first_half)
print("\nSecond half of array is ", second_half)


# Move all zeros to end of array

from array import array as ar

arr = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

non_zero_arr = ar("i", [])
zero_count = 0

for num in arr:
    if num != 0:
        non_zero_arr.append(num)  # AI
    else:
        zero_count += 1

for i in range(zero_count):
    non_zero_arr.append(0)

print("\nArray after moving all zeros to end is ", non_zero_arr)


# Create new array containing squares of all elements

from array import array as ar

arr = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

squared_arr = ar("i", [])

for num in arr:
    squared_arr.append(num**2)

print("\nArray containing squares of all elements is ", squared_arr)


# Find pair of elements whose sum equals user-given number

from array import array as ar

arr = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers {i+1} : "))
    arr.append(a)

print("\nArray :", arr)

target_sum = int(input("\nEnter target sum : "))

pairs = []

for i in range(len(arr)):
    for j in range(i + 1, len(arr)):
        if arr[i] + arr[j] == target_sum:
            pairs.append((arr[i], arr[j]))

if len(pairs) > 0:
    print(f"\nPairs of elements whose sum equals {target_sum} are {pairs}.")

else:
    print(f"\nNo pairs of elements found whose sum equals {target_sum}.")


# Find intersection and union of two arrays

from array import array as ar

arr1 = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for first array {i+1} : "))
    arr1.append(a)

arr2 = ar("i", [])

for i in range(5):
    a = int(input(f"Enter any 5 integer numbers for second array {i+1} : "))
    arr2.append(a)

print("\nFirst Array :", arr1)
print("\nSecond Array :", arr2)

intersection = ar("i", [])
union = ar("i", [])

for num in arr1:
    if num in arr2 and num not in intersection:
        intersection.append(num)

for num in arr1:
    if num not in union:
        union.append(num)

for num in arr2:
    if num not in union:
        union.append(num)

print("\nIntersection of two arrays is ", intersection)
print("\nUnion of two arrays is ", union)
