# Basic Inheritance:

# 1. Define a class Animal with attributes name and sound. Derive a class Dog from Animal with an additional attribute breed. Create instances of Dog and demonstrate inheritance.

class Animal:
    def __init__(self, name, sound):
        self.name = name
        self.sound = sound

    def make_sound(self):
        print(f"{self.name} says {self.sound}")

class Dog(Animal):
    def __init__(self, name, sound, breed):
        super().__init__(name, sound)
        self.breed = breed

    def dog_info(self):
        print(f"{self.name} is a {self.breed} breed.")

# Create an instance of Dog

my_dog = Dog("Buddy", "Woof", "Golden Retriever")
my_dog.make_sound()  # Inherited method from Animal
my_dog.dog_info()  # Method from Dog class


# Method Overriding:

# 2. Create a class Shape with a method calculate_area. Derive classes Rectangle and Circle from Shape and override calculate_area in each subclass to compute the area specific to that shape.

import math

class Shape:
    def calculate_area(self):
        pass  # This method will be overridden in subclasses

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def calculate_area(self):
        return self.width * self.height

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def calculate_area(self):
        return math.pi * (self.radius**2)

# Create instances of Rectangle and Circle

rect = Rectangle(5, 3)
circle = Circle(4)

print(f"Area of Rectangle: {rect.calculate_area()}")  # Output: Area of Rectangle: 15
print(f"Area of Circle: {circle.calculate_area()}")  # Output: Area of Circle: 50.26548245743669


# Multilevel Inheritance:

# 3. Define a class Vehicle with attributes brand and year. Derive classes Car and Bike from Vehicle. Further derive classes SportsCar from Car and MountainBike from Bike. Show how attributes propagate through the inheritance chain.

class Vehicle:
    def __init__(self, brand, year):
        self.brand = brand
        self.year = year

class Car(Vehicle):
    def __init__(self, brand, year, model):
        super().__init__(brand, year)
        self.model = model

class Bike(Vehicle):
    def __init__(self, brand, year, type):
        super().__init__(brand, year)
        self.type = type

class SportsCar(Car):
    def __init__(self, brand, year, model, top_speed):
        super().__init__(brand, year, model)
        self.top_speed = top_speed

class MountainBike(Bike):
    def __init__(self, brand, year, type, suspension):
        super().__init__(brand, year, type)
        self.suspension = suspension

# Create instances of SportsCar and MountainBike

sports_car = SportsCar("Ferrari", 2020, "488 GTB", 330)
mountain_bike = MountainBike("Trek", 2021, "Mountain", "Full Suspension")

print(f"Sports Car: {sports_car.brand} {sports_car.model} ({sports_car.year}) with top speed {sports_car.top_speed} km/h")
print(f"Mountain Bike: {mountain_bike.brand} {mountain_bike.type} ({mountain_bike.year}) with {mountain_bike.suspension} suspension")

# Hierarchical Inheritance:

# 4. Define a class Person with attributes name and age. Derive classes Student and Teacher from Person. Implement methods study() in Student and teach() in Teacher.

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

class Student(Person):
    def study(self):
        print(f"{self.name} is studying.")

class Teacher(Person):
    def teach(self):
        print(f"{self.name} is teaching.")

# Create instances of Student and Teacher

student = Student("Alice", 20)
teacher = Teacher("Mr. Smith", 45)

student.study()  # Output: Alice is studying.
teacher.teach()  # Output: Mr. Smith is teaching.


# Super() Function:

# 5. Extend the previous example with Person by using super() to initialize attributes in subclasses Student and Teacher.

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

class Student(Person):
    def __init__(self, name, age, student_id):
        super().__init__(name, age)
        self.student_id = student_id

    def study(self):
        print(f"{self.name} is studying.")

class Teacher(Person):
    def __init__(self, name, age, subject):
        super().__init__(name, age)
        self.subject = subject

    def teach(self):
        print(f"{self.name} is teaching {self.subject}.")

# Create instances of Student and Teacher

student = Student("Alice", 20, "S12345")
teacher = Teacher("Mr. Smith", 45, "Mathematics")

student.study()  # Output: Alice is studying.
teacher.teach()  # Output: Mr. Smith is teaching Mathematics.


# Multiple Inheritance:

# 6. Create classes A, B, and C. Class A has method display_A(), class B has method display_B(), and class C inherits from both A and B, implementing display_C() that calls both parent methods.

class A:
    def display_A(self):
        print("This is class A")

class B:
    def display_B(self):
        print("This is class B")

class C(A, B):
    def display_C(self):
        self.display_A()  # Call method from class A
        self.display_B()  # Call method from class B
        print("This is class C")

# Create an instance of class C and call display_C

c_instance = C()
c_instance.display_C()
