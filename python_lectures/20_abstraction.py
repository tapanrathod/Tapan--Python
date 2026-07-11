from abc import ABC, abstractmethod

class Shape(ABC) :
    @abstractmethod
    def area(self) :
        print("This class for Shape")
        pass

    # @abstractmethod
    def about(self) :
        print("This class for Shape")

class Circle(Shape) :
    def area(self) :
        print("Area of circle")

obj = Circle()

obj.about()


# # Abstract Base Classes (ABCs):
# 8. Define an abstract class Shape with an abstract method
# calculate_area(). Derive concrete classes Rectangle and Circle
# implementing calculate_area().