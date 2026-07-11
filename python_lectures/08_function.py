# function : block of code. reusable. readable

# 1. pre - defined (built-in)
# 2. user defined

# 2.1 no parameter, no return type

# def addition() :
#     a = 10
#     b = 20

#     print(a + b)

# function call
# addition()
# addition()


# 2.2 yes parameter, no return type
def addition(a, b) :
    print(a + b)

# addition(10, 20)
# addition(50, 80)

# 2.3 no parameter, yes return type

# def addition() :
#     a = 10
#     b = 20

#     return a + b

# c = addition()
# print(c)

# 2.4 yes parameter, yes return type

# def addition(a, b) :
#     return a + b

# x = 10
# y = 40

# c = addition(x, y)
# print(c)


# default parameters :


# def addition(a=0, b=0, c=0):
#     print("A:", a, "B:", b, "C:", c)
#     print((a + b) * c)


# addition(10, 20, 30)
# addition(10, 20)
# addition(10)
# addition()

# addition(a=10, c=30, b=40)
# addition(10, c=10, b=30)


# def addition(a, b, c, *kargs):
#     print(a)
#     print(b)
#     print(c)
#     print(kargs)


# addition(1,2,3,4,5,6,7)