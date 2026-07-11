a = {1, 2, 3, 4, 5, 1, 4, 5, 6, 3, 4, 1, "a", "b", "c", 7, 8, 9, 10} # set must in curly brackets [set 1]

print(a) # prints set

a = [1, 2, 3, 4, 5, 6, 4, 3, 5, 2, 1] # list

b = list(set(a)) # converts set into list

print(b) # prints list "b"

a = {1, 2, 3, 4, 5, 6} # set

# add :
a.add(3) # adds new set in the set
print(a)

# remove :
a.remove(2) # removes value
print(a)


# pop : remove first element
a.pop() # removes first value
print(a)

a.clear() # clears whole set
print(a)

# copy :
b = a.copy() # copies whole set

print(b) # prints copied set

# difference :
b = {1, 2, 6, 7, 8, 9} # set 2

print(a.difference(b)) # prits difference betweet set 1 and set 2

# update :
b = {7,8,9} # set 2

a.update(b) # updates set 2 into set 1
print(a)


b = {7,8,9, 10, 1} # set 2

print(a.union(b)) # it takes common values, no repeat values
