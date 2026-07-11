name = "Jay Kumar Jay Kumar Jay Kumar Jay Kumar Jay Kumar"  # string must be in ""

print(name)  # prints name (variable)
print(len(name))  # prints length of string (name)
print(name[7])  # prints sting charecter at index 7
print(name.upper())  # prints string in upper case
print(name.lower())  # prints string in lowwer case
print(
    name.capitalize()
)  # prints string in capitalized form (first latter of every word will be capital) (if already capitalized then it will print in lower case)

print()
print(name.index("a", 2))  # finds index of given charecter after index "2"
print(name.find("x"))  # finds specific charecter

""""""

# count
# print(name.count("a")) # counts specific cherecter
# print(name.center(30, "-")) # alligns string

# split and join :

# b = list(name)
# b = name.split(" ") # splits string using whitespace

# c = "--".join(b) # joints string using "--"

# print(b)
# print(c)


# s = "d vxcv zvxzvxbvxcl bvsdfn bl xcvn saddd"

# l = []

# w = s.split(" ")

# for i in range(0, len(w)) :
#     v = w[i].capitalize()
#     l.append(v)

# print(w)
# print(" ".join(l))


# a = "12"

# print(a.isnumeric())
# print(a.isdecimal())
# print(a.isdigit())
# print(a.isidentifier())
# print(a.istitle())
# print(a.isprintable ())
# print(a.isascii())
