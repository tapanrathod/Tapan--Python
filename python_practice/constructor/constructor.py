# constructor : called automatically when class called


class A:  # class ("self" must in brackets)
    def __init__(self, name, age):  # constructor
        self.name = name  # "self" for create variables and assign its values in class
        self.age = age
        print("Constructor called")

    def funA(self):  # ("self" must in brackets)
        print("funA() called")


name = input("Enter your name : ")  # user input 1
age = int(input("Enter your age: "))  # user input 2

obj = A(name, age)  # object

obj.funA()
print(obj.name)
print(obj.age)
