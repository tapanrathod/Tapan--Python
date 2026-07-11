# 1. Create a class Person with a constructor that initializes name and age. Create an object and print both values.


class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age


a = Person("Tapan", 28)
print(f"Name: {a.name}, Age: {a.age}")


# 2. Create a class Car with attributes brand and price. Initialize them using a constructor and print details.


class Car:
    def __init__(self, brand, price):
        self.brand = brand
        self.price = price


c = Car("BMW", 20000000000)
print(f"Brand: {c.brand}, Price: {c.price}")


# 3. Create a class Student that takes name, roll_no, and marks in the constructor. Print student info.


class Student:
    def __init__(self, name, roll_no, marks):
        self.name = name
        self.roll_no = roll_no
        self.marks = marks


s = Student("Tapan", 21, 86)
print(f"Name: {s.name}, Roll No: {s.roll_no}, Marks: {s.marks}")


# 4. Create a class Laptop with constructor parameters brand and ram. Create 3 objects with different values.


class Laptop:
    def __init__(self, brand, ram):
        self.brand = brand
        self.ram = ram


l1 = Laptop("Lenovo", "8GB")
l2 = Laptop("Dell", "16GB")
l3 = Laptop("Apple MacBook", "32GB")
print(f"Laptop 1 - Brand: {l1.brand}, RAM: {l1.ram}")
print(f"Laptop 2 - Brand: {l2.brand}, RAM: {l2.ram}")
print(f"Laptop 3 - Brand: {l3.brand}, RAM: {l3.ram}")


# 5. Create a class Book with title and author. Print them after object creation.


class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author


b = Book("The Monk Who Sold His Ferrari", "Robin Sharma")
print(f"Title: {b.title}, Author: {b.author}")


# 6. Create a class Rectangle with constructor taking length and width. Print both values.


class Rectangle:
    def __init__(self, length, width):
        self.length = length
        self.width = width


rect = Rectangle(10, 5)
print(f"Length: {rect.length}, Width: {rect.width}")


# 7. Create a class Employee with name, salary, and department. Create multiple objects and print details.


class Employee:
    def __init__(self, name, salary, department):
        self.name = name
        self.salary = salary
        self.department = department


e1 = Employee("Tapan", 50000, "HR")
e2 = Employee("Rathod", 60000, "Finance")
print(f"Employee 1 - Name: {e1.name}, Salary: {e1.salary}, Department: {e1.department}")
print(f"Employee 2 - Name: {e2.name}, Salary: {e2.salary}, Department: {e2.department}")


# 8. Create a class Mobile with brand, model, and price. Initialize using constructor and print all attributes.


class Mobile:
    def __init__(self, brand, model, price):
        self.brand = brand
        self.model = model
        self.price = price


m = Mobile("OnePlus", "9RT", 46000)
print(f"Brand: {m.brand}, Model: {m.model}, Price: {m.price}")


# 9. Create a class BankAccount with account_holder and balance. Initialize balance using constructor.


class BankAccount:
    def __init__(self, account_holder, balance):
        self.account_holder = account_holder
        self.balance = balance


acc = BankAccount("Tapan", 100000000000000)
print(f"Account Holder: {acc.account_holder}, Balance: {acc.balance}")


# 10. Create a class Movie with title, rating, and year. Create objects and print their details.


class Movie:
    def __init__(self, title, rating, year):
        self.title = title
        self.rating = rating
        self.year = year


m1 = Movie("The Avengers", 9 / 10, 2012)
m2 = Movie("Captain America: Civil War", 9.5 / 10, 2016)
print(f"Movie 1 - Title: {m1.title}, Rating: {m1.rating}, Year: {m1.year}")
print(f"Movie 2 - Title: {m2.title}, Rating: {m2.rating}, Year: {m2.year}")


# Diamond Problem and Method Resolution Order (MRO):

# 7. Illustrate the diamond problem in multiple inheritance and explain how method resolution order resolves it using a practical example.

class A:
    def show(self):
        print("Method from class A")

class B(A):
    def show(self):
        print("Method from class B")

class C(A):
    def show(self):
        print("Method from class C")

class D(B, C):
    pass

d = D()
d.show()
print(D)

