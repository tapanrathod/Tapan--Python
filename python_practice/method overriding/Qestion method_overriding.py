# Polymorphism through Inheritance:

# Implement polymorphism using inheritance by defining a base class Animal with a method make_sound() and deriving classes Dog, Cat, and Bird, each overriding make_sound() to produce their respective sounds.


class Animal:
    def make_sound(self):
        pass


class Dog(Animal):
    def make_sound(self):
        sound = "Woof! Woof!"
        return sound  # return


class Cat(Animal):
    def make_sound(self):
        sound = "Meow!"
        return sound  # return


class Bird(Animal):
    def make_sound(self):
        sound = "Chrip!"
        return "Chirp!"  # return


dog = Dog()  # object
cat = Cat()
bird = Bird()

print("Dog:", dog.make_sound())  # Output: Woof! Woof!
print("Cat:", cat.make_sound())  # Output: Meow!
print("Bird:", bird.make_sound())  # Output: Chirp!
