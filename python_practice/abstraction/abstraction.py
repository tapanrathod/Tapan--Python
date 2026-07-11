# abstraction : to set privacy in class for a specific purpose

from abc import ABC, abstractmethod  # must


class Shape(ABC):
    @abstractmethod  # it will hide below class
    def area(self):  # hidden class
        print("This is a class for Shape")
        pass  # must

    # @abstractmethod # it will hide below class
    def about(self):
        print("This is a class for Shape")


class Circle(Shape):
    def area(self):
        print("Area of circle")


obj = Circle()  # object

obj.about()


# # Abstract Base Classes (ABCs):

# Define an abstract class Shape with an abstract method calculate_area(). Derive concrete classes Rectangle and Circle implementing calculate_area().

from abc import ABC, abstractmethod


class Shape(ABC):
    @abstractmethod
    def calculate_area(self): 
        pass


class Rectangle(Shape):
    def __init__(self, height, width):
        self.height = height
        self.width = width

        self.height * self.width  # error

    def calculate_area(self):
        return self.height * self.width


class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

        3.14 * self.radius**2  # error

    def calculate_area(self):
        return 3.14 * self.radius**2


rect = Rectangle(6, 2)
print("The Area of Rectangle is:", rect.calculate_area())

cir = Circle(6)
print("The Area of Circle is:", cir.calculate_area())
