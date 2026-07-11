# 1. Write A C Program To Find Maximum Between Two Numbers.

a = int(input("Enter the number:"))
b = int(input("Enter the number:"))

if (a>b) :
    print (a, "is the maximum number")

else :
    print (b, "is the maximum number")


# 2. Write A C Program To Find Maximum Between Three Numbers.

a = int(input("Enter the number:"))
b = int(input("Enter the number:"))
c = int(input("Enter the number:"))

if (a>b and a>c) :
    print (a, "is the maximum number")

elif (b>a and b>c) :
    print (b, "is the maximum number")

else :
    print (c, "is the maximum number")


# 3. Write A C Program To Check Whether A Number Is Negative, Positive Or Zero.

num = int(input("Enter the number:"))

if (num>0) :
    print ("The given number is negative")

elif (num==0) : # error
    print ("The given number is zero")

else :
    print ("The given number is positive")


# 4. Write A C Program To Check Whether A Number Is Divisible By 5 And 11 Or Not.

num = int(input("Enter the number:"))

if (num%5==0 and num%11==0) : # error
    print ("The given number is divisible by 5 and 11")

else :
    print ("The number is not divisible")


# 5. Write A C Program To Check Whether A Number Is Even Or Odd.

num = int(input("Enter the number:"))

if (num%2==0) : # error
    print ("The number is even")

else :
    print ("The number is odd")
    
    
# 6. Temperature Check: Write a Python program that takes the temperature as input. If the temperature is above 30 degrees Celsius, print "It's a hot day!" Otherwise, print "It's a cool day."

temp = float(input("Enter the temprature:"))

if (temp>=30) :
    print ("Its a hot day!")

else :
    print ("its a cool day")
    
    
# 7. User Authentication: Create a program that asks the user to enter a username and password. If the username is "admin" and the password is "password123," print "Login successful." Otherwise, print "Invalid credentials."

username = input("Enter the username:")
password = input("Enter the password:")

if (username == "admin" and password == "password123") :
    print ("login success")

else :
    print ("Invalid credentials")
    
    
#  Write a Python program to input the marks of four subjects (out of 100) and calculate the average and determine the grade as follows:

# Average >= 90: Grade A
# Average >= 80: Grade B
# Average >= 70: Grade C
# Average >= 60: Grade D
# Average >= 50: Grade E
# Average < 50: Grade F

marks1 = int(input("marks of maths:"))
marks2 = int(input("marks of eng:"))
marks3 = int(input("marks of guj:"))
marks4 = int(input("marks of hindi:"))

avg = (marks1 + marks2 + marks3 + marks4) / 4

print("average : ", avg)

if (avg>=90) :
    print ("grade a")

elif (avg>=80) :
    print ("grade b")

elif (avg>=70) :
    print ("grade c")

elif (avg>=60) :
    print ("grade d")

elif (avg>=50) :
    print ("grade e")

elif (avg>50) :
    print ("grade f")
    
    
# 15. Write a Python program to input the price of an item and the money given by the customer, then calculate and print the change to be returned.

mrp = int (input("the price of an item:"))
money = int(input("money given by the customer:"))

if (mrp>money) :
    print ("calculated money:")
    print ("give more money:", mrp-money)

elif (mrp==money) :
    print ("no money exchange")

elif (mrp<money) :
    print ("payback")
    print ("exchanged money:", money-mrp)
    
    
# Discount Calculator:->Develop a program that asks the user to enter the total amount of a purchase. If the amount is greater than $100, apply a 10% discount and print the final amount. Otherwise, print the original amount.

amount = int (input("write an amount:"))

if (amount > 100) :
    d = amount - (amount * 10 / 100)
    print ("total amount", d)

else :
    print ("no discount")


# 1. Ticket Pricing:

# Create a program for a movie ticket booking system. Ask the user for their age and determine the ticket price accordingly:

# Children (age < 12): $5
# Adults (12 <= age < 18): $10
# Adults (age >= 18): $15

age = int (input("enter your age:"))

if (age<12) :
    price = 5
    catagory = "child"

elif (age<18) :
    price = 10
    catagory = "teenager"

else :
    price = 15
    catagory = "adult"

print ("your ticket price is:", price)
print ("catagory:", catagory)


# 2. Health Tracker:-> Build a health tracker program that asks the user for their daily steps count and sleep hours. Provide feedback based on the following conditions:

# If steps < 5000 and sleep < 7 hours: "Improvement needed in both steps and sleep."
# If steps < 5000: "Increase your daily steps."
# If sleep < 7 hours: "Ensure you get enough sleep."
# Otherwise: "Great job on maintaining a healthy lifestyle!"

steps = int(input("enter the daily step count:"))
sleep = int(input("enter the sleep hours:"))

if (steps<5000 and sleep<7) :
    print ("improvement needed in both steps and sleep")

elif (steps<5000) :
    print ("increase your daily steps")

elif (sleep<7) :
    print ("ensure you get enough sleep")
    
else :
    print ("great job on maintining a great lifestyle!")