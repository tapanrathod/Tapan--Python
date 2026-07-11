# Write a Python program to create a tuple with different data types.

a = (1, "Hello", 3.14, [1, 2, 3], (4, 5))
print(a)


# Write a Python program to create a tuple and find the length of the tuple.

a = (1, 2, 3, 4, 5)
print(len(a))


# Write a Python program to access an element in a tuple using indexing.

a = (1, 2, 3, 4, 5)
print(a[2])


# Write a Python program to slice a tuple from index 2 to 5.

a = (1, 2, 3, 4, 5, 6, 7)
print(a[2:6])


# Write a Python program to concatenate two tuples.

a = (1, 2, 3)
b = (4, 5, 6)

c = a + b
print(c)


# Write a Python program to repeat a tuple 3 times.

a = (1, 2, 3)
b = a * 3
print(b)


# Write a Python program to access elements of a nested tuple.

a = (1, 2, (3, 4), 5)
print(a[2][1])


# Write a Python program to change an element in a nested tuple (considering tuples are immutable, use a workaround).

a = (1, 2, [3, 4], 5)
a[2][0] = 10
print(a)


# Write a Python program to find the index of a specific element in a tuple.

a = (1, 2, 3, 4, 5)
print(a.index(3))


# Write a Python program to count the occurrences of a specific element in a tuple.

a = (1, 2, 3, 4, 5, 1, 1)
print(a.count(1))


# Write a Python program to convert a tuple to a string.

a = (1, 2, 3, 4, 5)
s = str(a)
print(s)


# Write a Python program to convert a list to a tuple and vice versa.

a = [1, 2, 3, 4, 5]
b = tuple(a)
print(b)

c = list(b)
print(c)


# Write a Python program to sort a tuple of numbers.

a = (5, 2, 9, 1, 3)
b = sorted(a)
print(b)


# Write a Python program to find the second largest element in a tuple.

a = (5, 2, 9, 1, 3)
b = sorted(a)
print(b[-2])
