add = lambda x, y: x + y # lambda (perameters must)

a = add(10, 20) # adds values in "a"

print(a) # prints values which are already in add()
print(add(20, 30)) # new values
print(add(20, 40)) # new values


# lambda in dictionary

# advanced methods

# filter (to search values in list)
# map (for oprrations on specific values in list)
# reduce (after operations on values and returns single value in list)


# filter :

a = [23,3,2,2,321,312,312,54,4,56,7,7,3,5,6,7,45,23,67,78] # list

def search(x) : # operation dictionary
    if (x % 2 == 0) : 
        return x
def search(x) :
    return x % 2 == 0

b = list(filter(search, a)) # list in "b"
print(b) # prints simple list

b = list(filter(lambda x : x % 2 == 0, a)) # operation on list using lambda
print(b) # prints list using lambda


# map :

a = [1,2,3,4,5,6,7,8,9,10] # list

def square(x) :
    return x ** 2 # square
def square(x) :
    if(x % 2 == 0) :
        return x ** 2 # square of even numbers
    else :
        return x ** 3 # cubes of odd numbers

b = list(map(square, a))
b = list(map(lambda x : x ** 2, a)) # operation using lambda
b = list(map(lambda x : x ** 2 if x % 2 == 0 else x, a)) # operation using lambda

print(b)


# reduce :

from functools import reduce # builtin package (must be written in the begining)

a = [1, 2, 3, 4, 5] # list

b = reduce(lambda x, y : x + y, a, 60) # operation using 

print(b)



# # data :

d = [
    {"name" : "abc", "age" : 20},
    {"name" : "ert", "age" : 30},
    {"name" : "aoi", "age" : 25},
    {"name" : "cvd", "age" : 28},
    {"name" : "xyz", "age" : 35},
    {"name" : "tyu", "age" : 18},
    {"name" : "iop", "age" : 15},
    {"name" : "mnb", "age" : 23},
]   # data


# print(d)

b = list(filter(lambda x : x["age"] >= 25 , d)) # filter age using lambda
b = list(filter(lambda x : x["name"].startswith("a") , d))  # filter name using lambda

# print(b)

for i in b : 
    print(i)


print(b)

for i in b : 
    print(i["name"])

print(b)

for i in b : 
    print(i["age"])