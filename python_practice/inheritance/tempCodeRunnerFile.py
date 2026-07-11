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
