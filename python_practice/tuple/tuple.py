a = (1, 2, 3, 4, 5, 6, 1, 1, 1, 2)  # tuple [must use circle brackets]

print(a)  # print tuple "a"


print(a.index(4))  # prints value at index 4

print(a.count(1))  # counts value "1"

b = list(a)  # converts tuple in list

print(b)  # prints list "b"

a = tuple(b)  # converts list in tuple again

print(a)  # prints tuple "a"

# nestead tuple: aka tupples in a tupple

b = ((1, 2, 3, 4), (5, 6, 7, 8), (9, 10, 11, 12))  # nestead tuple "b"

print(b)  # prints nestead tuple "b"

print(b[0])  # prints nestead tuple at 0 ibdex
print(b[1])  # prints nestead tuple at 1 index
print(b[2])  # prints nestead tuple at 2 index
