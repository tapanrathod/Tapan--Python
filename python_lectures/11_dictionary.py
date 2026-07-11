# dictionary : store key - value pairs

# a = {
#     "name": "ABC",
#     "age": 30,
#     "city": "ahmedabad",
#     "hobbies": ["sports", "travelling"],
#     "address": {
#         "pincode": 1234,
#     },
# }

# print(a)
# print(a["name"])
# print(a["address"])
# print(a["address"]["pincode"])

# for i in a :
#     print(i, ":", a[i])

# a["age"] = 50

# a["country"] = "India"

# print(a)


# methods :

# clear :
# a.clear()
# print(a)


# # copy :
# b = a.copy()
# print(b)

# keys :
# k = list(a.keys())
# print(k)

# values :
# v = list(a.values())
# print(v)

# fromkeys :

# k = list(a.keys())
# b = a.fromkeys(k, "")

# print(b)

# items :
# b = list(a.items())
# print(b)

# pop :
# a.pop("city")
# print(a)

# popitem :
# a.popitem()
# print(a)

# get :
# print(a.get("name", "no"))

# name = a["name2"] or "no"

# print(name)

# setdefault :
# a.setdefault("country", "India")
# print(a)

# update or merge :

# b = {
#     "country"  : "India",
#     "name" : "XYZ"
# }

# a.update(b)
# print(a)


# in, not in
# a = [1, 2, 3, 4, 5]

# if (6 in a) :
#     print("Found")
# else :
#     print("Not Found")

# dictionary comprehension :

# a = [1, 2, 3, 4, 5]
# b = [9, 8, 7, 6, 5]

# d = list(zip(a, b))
# d = dict(zip(a, b))

# print(d)


# user input :

n = int(input("How many keys ? :"))

k = []

for i in range(1, n + 1):
    v = input(f"Enter a key [{i}] :")
    k.append(v)

d = {}

for i in k:
    v = input(f"Enter a value of {i} : ")
    d[i] = v


print(d)

# c = 2

# print(f"Count : {c}")


# advanced methods :

# filter, map, reduce :

# a = [23,3,2,2,321,312,312,54,4,56,7,7,3,5,6,7,45,23,67,78]

# def search(x) :
#     if (x % 2 == 0) :
#         return x
# def search(x) :
#     return x % 2 == 0

# b = list(filter(search, a))
# b = list(filter(lambda x : x % 2 == 0, a))

# print(b)


# map :

# a = [1,2,3,4,5,6,7,8,9,10]

# def square(x) :
#     return x ** 2
# def square(x) :
#     if(x % 2 == 0) :
#         return x ** 2
#     else :
#         return x ** 3

# b = list(map(square, a))
# b = list(map(lambda x : x ** 2, a))
# b = list(map(lambda x : x ** 2 if x % 2 == 0 else x, a))

# print(b)


# reduce :

# from functools import reduce

# a = [1, 2, 3, 4, 5]

# b = reduce(lambda x, y : x + y, a, 60)

# print(b)



# data :

# d = [
#     {"name" : "abc", "age" : 20},
#     {"name" : "ert", "age" : 30},
#     {"name" : "aoi", "age" : 25},
#     {"name" : "cvd", "age" : 28},
#     {"name" : "xyz", "age" : 35},
#     {"name" : "tyu", "age" : 18},
#     {"name" : "iop", "age" : 15},
#     {"name" : "mnb", "age" : 23},
# ]


# print(d)

# b = list(filter(lambda x : x["age"] >= 25 , d))
# b = list(filter(lambda x : x["name"].startswith("a") , d))

# print(b)

# for i in b : 
#     print(i["name"])




