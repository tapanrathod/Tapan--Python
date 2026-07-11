# Write a program to display all types of errors in Python. Use try and except block to handle the errors with user input. Also, use finally block to display a message at the end of the program.

x = 10
y = 0

try:
    print(x / y)  # ZeroDivisionError
except ZeroDivisionError as e:
    print("Cannot divide by zero:", e)

try:
    num = int(input("Enter a number: "))  # ValueError
except ValueError as e:
    print("Invalid input, please enter a number:", e)

# try:
#     print(undefined_variable)  # NameError # it wil show an error anyway because the variable does not defined
# except NameError as e:
#     print("Variable is not defined:", e)

# try:
#     import non_existent_module  # ModuleNotFoundError # it wil show an error anyway because the module does not installed
# except ModuleNotFoundError as e:
#     print("Module not found:", e)

try:
    my_list = [1, 2, 3]
    print(my_list[5])  # IndexError
except IndexError as e:
    print("Index out of range:", e)

try:
    my_dict = {"key": "value"}
    print(my_dict["non_existent_key"])  # KeyError
except KeyError as e:
    print("Key not found in dictionary:", e)

try:
    result = 10 / 0  # ZeroDivisionError
except ZeroDivisionError as e:
    print("Cannot divide by zero:", e)

try:
    with open("non_existent_file.txt", "r") as file:  # FileNotFoundError
        content = file.read()
except FileNotFoundError as e:
    print("File not found:", e)

try:
    import math

    print(math.sqrt(-1))  # ValueError
except ValueError as e:
    print("Cannot compute square root of a negative number:", e)

finally:
    print("End of program. Thank you for using the error handling demonstration.")
