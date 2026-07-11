from array import array as ar # from "package" import "class" renamed as "ar"

arr = ar("i", [1, 2, 3, 4, 5, 6])             # "i" for integer aka type code in array
arr = ar("f", [1, 2, 3, 4, 5, 6, 4.4, 1.54])  # "f" for float
arr = ar("u", "Hello")                        # "u" for unicode character (corrected from 'w')

print(arr)
print(type(arr)) # prints type of array
print(list(arr)) # prints array as list

# Resetting to an integer array for the method demonstrations
arr = ar("i", [10, 20, 30, 40, 50])

# --- ARRAY METHODS ---

from array import array as ar

arr = ar("i", [1, 2, 3, 4, 5, 6])

# 1. append() - Adds a single element to the end of the array
arr.append(60) 

# 2. extend() - Appends elements from an iterable (like a list or another array) to the end
arr.extend([70, 80, 90]) 

# 3. insert() - Inserts a new item at a given index position (index, value)
arr.insert(2, 25) # Inserts 25 at index 2

# 4. remove() - Removes the first occurrence of the specified value
arr.remove(40) 

# 5. pop() - Removes and returns the item at the given index (defaults to the last item if index is omitted)
removed_element = arr.pop()   # Removes the last element (90)
removed_at_idx = arr.pop(0)   # Removes the element at index 0 (10)

# 6. index() - Returns the index of the first occurrence of the specified value
position = arr.index(30) 

# 7. count() - Returns the number of times a value appears in the array
occurrence_count = arr.count(20) 

# 8. reverse() - Reverses the order of the items in the array in-place
arr.reverse() 

# --- ARRAY-SPECIFIC METHODS (Not found in normal lists) ---

# 9. buffer_info() - Returns a tuple (memory_address, length) of the array's buffer
buffer_details = arr.buffer_info() 

# 10. byteswap() - "Byteswaps" all items of the array (useful for low-level data/endianness conversion)
# arr.byteswap() 

# 11. itemsize - Attribute (not a method) that returns the size in bytes of one array item
size_in_bytes = arr.itemsize 

# 12. typecode - Attribute that returns the typecode character used to create the array
current_type = arr.typecode 

# Final print to see the modified array
print("\nFinal modified array:", arr)
