# dictionary : store key - value pairs

# a = {                                      # dictionary AKA object in curly brackets
#     "name" : "Tapan",
#     "age" : 28,
#     "hobbies" : ["reading", "travelling"],
#     "address" : {                          # sub dictionary
#         "city" : "ahmedabad",
#         "state" : "gujarat",
#         "pincode" : "380013"

#     },

# }

# print(a) # it will print entire dictionary
# print(a["name"]) # it will print only name
# print(a["address"]) # it will print whole address AKA sub dictionary
# print(a["address"]["city"]) # it will print city in sub dictionary
# print(a["address"]["state"]) # it will print state in sub dictionary
# print(a["address"]["pincode"]) # it will print pincode in sub dictionary

# for i in a :
#     print(i) # it wll print keys

# for i in a :
#     print(i, ":", a[i]) # it will print values along with keys

# a["age"] = 15 # this will replace value because "age" key is exist in the dictionary

# a["country"] = "India" # this will add new value and key because "country" key does not exist in the dictionary

# print(a)


# methods :


# 1. clear :

# a.clear() # it will clear the entire dictionary
# print(a)

# 2. copy :

# b = a.copy() # it will copy the entire dictionary in b
# print(b)

# 3. keys :

# k = list(a.keys()) # it will print keys in list
# print(k)

# 4. values :

# v = list(a.values()) # it will print values in list
# print(v)

# 5. fromkeys :

# k = list(a.keys())
# b = a.fromkeys(k, "anything") # it will update values of keys
# print(b)

# 6. items :

# b = list(a.items()) # converts to each key values into tuple and stores in the list # tuple is datatype
# print(b)

# 7. pop :

# a.pop("city") # it will delete specific key
# print(a)

# 8. popitem :

# a.popitem() # it deletes items
# print(a)

# 9. get :

# print(a.get("name", "no")) # it gets key values
# name = a["name"] or "no"
# print(name)

# 10. setdefault :

# a.setdefault("country", "India") # new key will be added
# print(a)

# 11. update or merge : # it updates or merge dictionary

# b = {
#     "country"  : "India",
#     "name" : "XYZ"
# }

# a.update(b)
# print(a)


################################ practice

# in, not in
# a = [1, 2, 3, 4, 5]

# if (6 in a) :
#     print("Found")
# else :
#     print("Not Found")


# dictionary comprehension :

# a = [1, 2, 3, 4, 5]  # list 1 int values
# b = ["a", "b", "c", "d", "e"]  # list 2 str values

# d1 = list(zip(a, b))  # assigns a as keys and b as values and converts in list
# d2 = list(zip(b, a))  # assigns b as keys and a as values and converts in list
# d3 = dict(zip(a, b))  # assigns a as keys and b as values and converts in dictionary
# d4 = dict(zip(b, a))  # assigns b as keys and a as values and converts in dictionary

# print(d1)
# print()
# print(d2)
# print()
# print(d3)
# print()
# print(d4)


# user input :

# n = int(input("howmany keys?:"))  # user iput for inserting keys numbers

# k = []  # empty list

# for i in range(1, n + 1):
#     v = input(f"enter a value of [{i}] :")
#     k.append(v)

# d = {}  # empty dictionary

# for i in k:
#     v = input(f"enter the value of [{i}] :")
#     d[i] = v

# print(d)


c = 4

# print(f"Count : {c}") # dynamic string