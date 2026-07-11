# import array as ar
from array import array as ar  # from "package" import "class" renamed as "ar"

arr = ar("i", [1, 2, 3, 4, 5, 6])  # "i" for integer aka type code in array
arr = ar("f", [1, 2, 3, 4, 5, 6, 4.4, 1.54])  # "f" for float
arr = ar("w", "Hello")  # "w" for unicode character

print(arr)
print(type(arr))  # prints type of array
print(list(arr))  # prints array as list

##################################################################### AI

from array import array as ar

# --- Already Provided ---
arr = ar("i", [1, 2, 3, 4, 5, 6])  # "i" for signed integer (minimum 2 bytes)
arr = ar("f", [1, 2, 3, 4, 5, 6, 4.4, 1.54])  # "f" for floating-point (4 bytes)
arr = ar("u", "Hello")  # "u" for Unicode character (replaces "w")
                        # "u" is debricated means "u" is no longer in use and thats why dash on "ar" # use "w" instead of "u"
arr = ar("w", "Hello")  # "w" for unicode character

# --- Remaining Signed Integers (Lowercase) ---
arr = ar("b", [-1, 0, 1, 127])  # "b" for signed char / smallest integer (1 byte)
arr = ar("h", [-32768, 0, 32767])  # "h" for signed short integer (minimum 2 bytes)
arr = ar("l", [-2147483648, 2147483647])  # "l" for signed long integer (minimum 4 bytes)
arr = ar("q", [-9223372036854775808])  # "q" for signed long long integer (minimum 8 bytes)

# --- Remaining Unsigned Integers (Uppercase - Positive Only) ---
arr = ar("B", [0, 1, 2, 255])  # "B" for unsigned char (1 byte, 0 to 255)
arr = ar("H", [0, 1, 65535])  # "H" for unsigned short integer (minimum 2 bytes)
arr = ar("I", [0, 1, 4294967295])  # "I" for unsigned integer (minimum 2 bytes)
arr = ar("L", [0, 1, 4294967295])  # "L" for unsigned long integer (minimum 4 bytes)
arr = ar("Q", [0, 1, 18446744073709551615])  # "Q" for unsigned long long integer (minimum 8 bytes)

# --- Remaining Floating-Point ---
arr = ar("d", [3.141592653589793, 2.71828])  # "d" for double-precision float (8 bytes)

print(arr)
print(type(arr))  # prints type of array
print(list(arr))  # prints array as list

########################################################################



# list methods on array


from array import array as ar

arr = ar("i", [1, 2, 3, 4, 5, 6])
 
# append()	Append a new item to the end of the array.

arr = ar("i", [1, 2, 3, 4, 5, 6])
arr.append(7)  # appends 7 to the end of the array
print(arr)  # Output: array('i', [1, 2, 3, 4, 5, 6, 7])


# array()	Create a new array. typecode is a single character (e.g. 'b', 'i', 'f') that decides the item type.

arr = ar("i", [1, 2, 3, 4, 5, 6])  # creates an array of signed integers
print(arr)  # Output: array('i', [1, 2, 3, 4, 5, 6])
ar()  # creates an empty array (typecode defaults to 'b' for signed char) # imported from array() as ar()
print(ar())  # Output: array('b')


# buffer_info()	Return a tuple (address, length) giving the current memory info.

arr = ar("i", [1, 2, 3, 4, 5, 6])
print(arr.buffer_info())  # Output: (address, length) where address is the memory address of the array and length is the number of elements in the array.


# byteswap()	Swap the bytes of all items (endian conversion for multi-byte types).

arr = ar("i", [1, 2, 3, 4, 5, 6])
print("Before byteswap:", arr)  # Output: array('i', [1, 2, 3, 4, 5, 6])
arr.byteswap()  # Swaps the bytes of all items in the array (in-place modification)
print("After byteswap:", arr)  # Output: array('i', [16777216, 33554432, 50331648, 67108864, 83886080]) (values will be different due to byte swapping)


# clear()	Remove all items from the array (empty it).

arr = ar("i", [1, 2, 3, 4, 5, 6])
print("Before clear:", arr)  # Output: array('i', [1, 2, 3, 4, 5, 6])
arr.clear()  # Removes all items from the array (empties it)
print("After clear:", arr)  # Output: array('i') (empty array) 


# count()	Return the number of occurrences of x.

arr = ar("i", [1, 2, 3, 4, 5, 6, 2, 2])
print(arr.count(2))  # Output: 3 (number of occurrences of 2 in the array)


# extend()	Append items from an iterable or another array.

arr1 = ar("i", [1, 2, 3])
arr2 = ar("i", [4, 5, 6])
arr1.extend(arr2)  # Appends all items from arr2 to the end of arr1
print(arr1)  # Output: array('i', [1, 2, 3, 4, 5, 6])


# frombytes()	Append items from a bytes object, interpreted using the array's type.

arr = ar("i", [1, 2, 3])
byte_data = b'\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00'  # bytes representing integers 4, 5, 6
arr.frombytes(byte_data)  # Appends items from the bytes object to the array (in-place modification)
print(arr)  # Output: array('i', [1, 2, 3, 4, 5, 6]) (original array with new items from bytes appended)   


# fromfile()	Read n items (as machine values) from a file object.

from array import array as ar

arr = ar("i", [1, 2, 3, 4, 5, 6])

arr = ar("i", [1, 2, 3])

with open('data.bin', 'wb') as f:  # Create a binary file and write some integers to it
    f.write((4).to_bytes(4, byteorder='little'))  # Write integer 4 as bytes
    f.write((5).to_bytes(4, byteorder='little'))  # Write integer 5 as bytes
    f.write((6).to_bytes(4, byteorder='little'))  # Write integer 6 as bytes
with open('data.bin', 'rb') as f:  # Open the binary file for reading
    arr.fromfile(f, 3)  # Reads 3 items from the file and appends them to the array
print(arr)  # Output: array('i', [1, 2, 3, 4, 5, 6]) (original array with new items from file appended)


# fromlist()	Append items from a list after type checking.

arr = ar("i", [1, 2, 3])
arr.fromlist([4, 5, 6])  # Appends items from the list to the array after type checking (in-place modification)
print(arr)  # Output: array('i', [1, 2, 3, 4, 5, 6]) (original array with new items from list appended)

# index()	Return the index of the first occurrence of x.

arr = ar("i", [1, 2, 3, 4, 5, 6])
print(arr.index(4))  # Output: 3 (index of the first occurrence of 4 in the array)


# insert()	Insert a new item x into the array at position i.

arr = ar("i", [1, 2, 3, 5, 6])
arr.insert(3, 4)  # Inserts the value 4 at index 3 (in-place modification)
print(arr)  # Output: array('i', [1, 2, 3, 4, 5, 6]) (original array with new item inserted at index 3)


# itemsize	Size in bytes of one array item.

arr = ar("i", [1, 2, 3, 4, 5, 6])
print(arr.itemsize)  # Output: 4 (size in bytes of one integer item in the array)


# pop()	Remove and return the item at index i (last item by default).

arr = ar("i", [1, 2, 3, 4, 5, 6])
print(arr.pop())  # Output: 6 (removes and returns the last item in the array)
print(arr)  # Output: array('i', [1, 2, 3, 4, 5]) (array after popping the last item)


# remove()	Remove the first occurrence of x.

arr = ar("i", [1, 2, 3, 4, 5, 6])
arr.remove(4)  # Removes the first occurrence of the value 4 from the array (in-place modification)
print(arr)  # Output: array('i', [1, 2, 3, 5, 6]) (array after removing the first occurrence of 4)


# reverse()	Reverse the order of the items in place.

arr = ar("i", [1, 2, 3, 4, 5, 6])
arr.reverse()  # Reverses the order of items in the array (in-place modification)
print(arr)  # Output: array('i', [6, 5, 4, 3, 2, 1]) (array after reversing the order of items)


# tobytes()	Convert the array to a bytes object containing the raw machine values.

from array import array as ar

arr = ar("i", [1, 2, 3, 4, 5, 6])
byte_data = arr.tobytes()  # Converts the array to a bytes object containing the raw machine values
print(byte_data)  # Output: b'\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00' (bytes representation of the array)


# tofile()	Write all items (as machine values) to a file object.

from array import array as ar

arr = ar("i", [1, 2, 3, 4, 5, 6])

with open('output.bin', 'wb') as f:  # Open a binary file for writing
    arr.tofile(f)  # Writes all items from the array to the file as machine values 
with open('output.bin', 'rb') as f:  # Open the binary file for reading
    byte_data = f.read()  # Read the contents of the file as bytes
print(byte_data)  # Output: b'\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00' (bytes representation of the array written to the file)

# tolist()	Convert the array to a list of Python values.

arr = ar("i", [1, 2, 3, 4, 5, 6])
print(arr.tolist())  # Output: [1, 2, 3, 4, 5, 6] (array converted to a list of Python values)


# tounicode()	Convert the array with type code 'u' to a unicode string.

from array import array as ar

arr = ar("i", [1, 2, 3, 4, 5, 6])

arr = ar("u", "Hello")
print(arr.tounicode())  # Output: 'Hello' (array with type code 'u' converted to a unicode string)


# typecode	The type code character used by the array.

arr = ar("i", [1, 2, 3, 4, 5, 6])
print(arr.typecode)  # Output: 'i' (type code character used by the array)


# typecodes	String of all available type code characters on this build.

print(ar.typecodes)  # Output: 'bBuhHiIlLqQfd' (string of all available type code characters on this build)


# array methods

from array import array as ar

# append(x) Adds element x to the end of the array.

arr = ar("i", [1, 2, 3, 4, 5, 6])
arr.append(7)  # appends 7 to the end of the array
print(arr)  # Output: array('i', [1, 2, 3, 4, 5, 6, 7])


# extend(iterable) Appends all elements from an iterable (like another array) to the end.

arr1 = ar("i", [1, 2, 3])
arr2 = ar("i", [4, 5, 6])
arr1.extend(arr2)  # Appends all items from arr2 to the end of arr1
print(arr1)  # Output: array('i', [1, 2, 3, 4, 5, 6])


# "insert(i, x)" Inserts element x at the specified index i.

arr = ar("i", [1, 2, 3, 5, 6])
arr.insert(3, 4)  # Inserts the value 4 at index 3
print(arr)  # Output: array('i', [1, 2, 3, 4, 5, 6]) (original array with new item inserted at index 3)

# remove(x) Removes the first occurrence of the value x from the array.

arr = ar("i", [1, 2, 3, 4, 5, 6])
arr.remove(4)  # Removes the first occurrence of the value 4 from the array
print(arr)  # Output: array('i', [1, 2, 3, 5, 6]) (array after removing the first occurrence of 4)

# pop([i]) "Removes and returns the element at index i. If i is not provided, it removes the last item."

arr = ar("i", [1, 2, 3, 4, 5, 6])
print(arr.pop())  # Output: 6 (removes and returns the last item in the array)
print(arr)  # Output: array('i', [1, 2, 3, 4, 5]) (array after popping the last item)

# index(x) Returns the index of the first occurrence of value x.

arr = ar("i", [1, 2, 3, 4, 5, 6])
print(arr.index(4))  # Output: 3 (index of the first occurrence of 4 in the array)

# count(x) Returns the number of times value x appears in the array.

arr = ar("i", [1, 2, 3, 4, 5, 6, 2, 2])
print(arr.count(2))  # Output: 3 (number of occurrences of 2 in the array)

# reverse() Reverses the order of elements in-place.

arr = ar("i", [1, 2, 3, 4, 5, 6])
arr.reverse()  # Reverses the order of items in the array (in-place modification)
print(arr)  # Output: array('i', [6, 5, 4, 3, 2, 1]) (array after reversing the order of items)

# tolist() (Array module only) Converts the array object into a standard Python list.

arr = ar("i", [1, 2, 3, 4, 5, 6])
print(arr.tolist())  # Output: [1, 2, 3, 4, 5, 6] (array converted to a list of Python values)

# sort() (Lists only) Sorts the elements in ascending order by default.

arr = ar("i", [5, 2, 9, 1, 5, 6]) # arr.sort()  # This will raise an AttributeError since arrays do not have a sort method
print(arr)  # Output: array('i', [5, 2, 9, 1, 5, 6]) (array remains unchanged since sort() is not available for arrays)

