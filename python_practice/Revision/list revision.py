# list :

a = [1, 2, 3, 4, 5, "name", "address", 36.5, 4.85, 96]  # list

print(a)  # print index

print(a[4])  # print value at spacific index
print(a[6])
print(a[len(a) - 1])

for i in range(0, len(a)):  # list range
    print(i)  # print index

    print(a[i])  # i is an index number and print the value at that index

for i in a:
    print(i)  # print index


# diffrent methods in list

a = [1, 2, 3, 4, 5, "name", "address", 36.5, 4.85, 96]  # list

print(a)

# append

a.append("Tapan")  # will add in the end of the list
print(a)

# pop

a.pop(
    2
)  # will delete specific value from the list (index number must in the brackets) (index number required)
print(a)

b = a.pop(
    2
)  # will copy whole list in b then remove value which is specific index metioned in brackets and then print which value is removed
print(a)
print(b)

# remove :

a = [1, 2, 3, 4, 5, "name", "address", 36.5, 4.85, 96]  # list

print(a)  # print index

a.remove("address")  # will remove specific value from the list
print(a)  # print updated list


# extend :

a.extend([123, 456, 345])  # adds values
print(a)

# insert :

a.insert(2, "dev")  # insert values
print(a)

a[2] = "abc"

# copy : # copy

x = 10
y = x

x = 20

b = a.copy()

a.append("abc")

print(a)
print(b)

# clear :

a.clear()
print(a)

# reverse :

a.reverse()  # list reverse
print(a)

# sort :

s = [5, 2, 8, 1, 4]
s.sort()  # list sort in ascending order (by default)
print(s)

a.sort(reverse=True)  # list sort in reverse (descending order)
print(a)

# index :

print(a.index("Tapan", 2, 3))  # to find index of specific values


# count :

print(a.count("Tapan"))  # count values


# list slicing

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]  # list

print("1 :", a[3:8])  # to print list from specified index
print("2 :", a[:8])  # it will print the list from the begingig to the mentioned index
print("3 :", a[3:])  # it will print the list from the specified index to the end
print(
    "4 :", a[3:100]
)  # it will print the list from the specified index to the end if mentiond index is out of range
print(
    "5 :", a[8:3]
)  # will print empty list because mentioned index numbers are inverse
print(
    "6 :", a[-1], a[-5]
)  # will print values of mentioned index numbers but in reverse (no colons)
print(
    "7 :", a[-5:]
)  # will print reverse values of specified index number (with colons)
print("8 :", a[0:8:3])  # will skip 3 index numbers
print("9 :", a[8:0:-1])  # will print inverse list (minus sign is required)
print(
    "10 :", a[-1:-5:-1]
)  # will print inverse list with skipped values (both side minus signs are required)
print(
    "11 :", a[::-1]
)  # will print complete inverse list because no index number is mentioned in the begining

print("10 :", a[-2:-5:-2])  # test 1
print("8 :", a[0::2])  # will skip 2 index numbers # test 2
print("8 :", a[::2])  # will skip 2 index numbers # test 3


# list comprehension :

for i in range(1, 11):  # example
    print(i)

a = [i for i in range(1, 11)]
a = [
    i**2 for i in range(1, 11)
]  # operations in list like +, -, *, /, **, etc. (list is already formed, see square brackets)

print(a)

# nested list or 2D list : # lists in list

a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]  # lists in list # [[list1], [list2], [list3]]

print(a)

for i in a:  # to print nested lists seperately # "i in a" mentioned first list
    print(i)  # will print nested lists seperetly
    for j in i:  # "j in i" mentioned second list
        print(j, end=" ")  # print values with break AKA white space

    print()  # will print white space only


# user input list :

n = int(
    input("How many values ? :")
)  # will add only integer values in the list because of "int" mentioned # if there is mentioned nothing then it will take any values in thr list

a = []  # empty list and ask howmany values being added look above user input

for i in range(1, n + 1):  # "+1" to add values till the end
    v = int(input("Enter a number : "))
    a.append(v)  # to add values in list

    print(a)


# "[]" is index number in list and in dictionary it returns values of specific key
