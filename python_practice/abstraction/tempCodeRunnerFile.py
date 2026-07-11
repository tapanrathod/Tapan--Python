from abc import ABC, abstractmethod


class Shape(ABC):
    @abstractmethod
    def calculate_area(self):
        pass


class Rectangle(Shape):
    def __init__(self, height, width):
        self.height = height
        self.width = width
        self.height * self.width

    def calculate_area(self):
        return self.height * self.width


class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius
        3.14 * self.radius**2

    def calculate_area(self):
        return 3.14 * self.radius**2


rect = Rectangle(6, 2)
print("The Area of Rectangle is:", rect.calculate_area())

cir = Circle(6)
print("The Area of Circle is:", cir.calculate_area())