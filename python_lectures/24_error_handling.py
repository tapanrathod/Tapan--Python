# a = int(input("Enter a number : "))
# b = int(input("Enter a number : "))

# print(a / b)


try :
    a = int(input("Enter a number : "))
    b = int(input("Enter a number : "))

    print(a / b)

except ZeroDivisionError as e : # renamed as "e"
    print("Not divided by zero")

except ValueError as e : # renamed as "e"
    print("Please enter valid number")

finally : # it runs entire code then gives an error
    print("Thank you")