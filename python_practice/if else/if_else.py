age = 15

if (age >= 18) :
    print ("You are Eligible")
else :
    print ("You are Not Eligible")

    
age = int(input("Enter Your Age")) # user input 1

if (age >= 18) :
    print ("You are elegible")
else :
    print ("You are not eligible")
    
    
age = int(input("Enter Your Age")) # user input 2

if (age >= 40) :
    print ("old age group")
elif (age >= 18) :
    print ("young age group")
else :
    print ("kids age group")

    
# find maximum number among the 3 numbers (user input 3)

a = int(input("Enter the number"))
b = int(input("Enter the number"))
c = int(input("Enter the number"))

if (a>b and a>c) :
    print (a, "is the maximum number")
elif (b>a and b>c) :
    print (b, "is the maximum number")
else :
    print (c, "is the maximum number")