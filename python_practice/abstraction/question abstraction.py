# Abstract Base Classes (ABCs):

# Define an abstract class Shape with an abstract method calculate_area(). Derive concrete classes Rectangle and Circle implementing calculate_area().

from abc import ABC, abstractmethod


class Shape(ABC):
    @abstractmethod
    def calculate_area(self):
        pass


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
        return 3.14 * self.radius**2


# Example usage:

rect = Rectangle(5, 3)
print("Area of Rectangle:", rect.calculate_area())

circle = Circle(4)
print("Area of Circle:", circle.calculate_area())
