# list : store multiple values with different datatype

# a = [1, 2, 3, 4, 5, "name", 45.23, 45, 98]

# print(a)
# print(a[0])
# print(a[5])

# print(a[len(a) - 1])

# for i in range(0, len(a)) :
# print(i)
# print(a[i])


# for i in a :
#     print(i)


# methods :

# a = ["jay", "ajay", "harsh", "dhruv", "ajay"]

# print(a)

# append :
# a.append("raj")
# print(a)

# pop :
# b = a.pop()
# print(a)
# print(b)

# a.pop(2)
# print(a)

# remove :
# a.remove("ajay")
# print(a)

# extend :
# a.extend([123, 456, 345])
# print(a)

# insert :
# a.insert(2, "dev")
# print(a)

# a[2] = "abc"

# copy :
# x = 10
# y = x

# x = 20

# b = a.copy()

# a.append("abc")

# print(a)
# print(b)

# clear :
# a.clear()
# print(a)

# reverse :
# a.reverse()
# print(a)

# sort :

# a.sort(reverse=True)
# print(a)

# index :
# print(a.index("ajay", 2,3 ))


# count :
# print(a.count("ajay"))


# list slicing :

# a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# print("1 :", a[3:8])
# print("2 :", a[:8])
# print("3 :", a[3:])
# print("4 :", a[3:100])
# print("5 :", a[8:3])
# print("6 :", a[-1], a[-5])
# print("7 :", a[-5:])
# print("8 :", a[0:8:3])
# print("9 :", a[8:0:-1])
# print("10 :", a[-1:-5:-1])
# print("11 :", a[::-1])

# list comprehension :

# for i in range(1, 11) :
#     print(i)

# a = [i for i in range(1, 11)]
# a = [i**2 for i in range(1, 11)]

# print(a)

# nested list or 2d list :

# a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# print(a)

# for i in a :
    # print(i)
    # for j in i :
    #     print(j, end=" ")
    
    # print()



# user input list : 

# n = int(input("How many values ? :"))

# a = []

# for i in range(1, n+1) :
#     v = int(input("Enter a number : "))
#     a.append(v)
    
# print(a)

