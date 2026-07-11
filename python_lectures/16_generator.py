# A generator in Python is a special type of function that allows you to generate a sequence of values lazily, one at a time, using the `yield` keyword.

def calc(): # generator
    a = 10
    b = 20

    yield a + b # yield keyword must
    yield a - b
    yield a * b
    yield a / b


for i in calc() : # loop is must for generator
    print(i)

a = calc()

print(list(a)) # generator is converted in list
