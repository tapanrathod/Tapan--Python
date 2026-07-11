# 1. no parameter, no return type

def addition () :
    
    a = int(input("Enter a number: ")) # user input 1
    b = int(input("Enter a number: ")) # user input 2
    # user input inside because values are not defined in function

    # a = 10
    # b = 20
    
    print (a + b)
    
addition()


# 2. yes parameter, yes return type

def addition (a, b):
    
    print (a+b)
    
# addition (10, 20)

a = int(input("Enter a number: ")) # user input 1
b = int(input("Enter a number: ")) # user input 2
# user input outside because values are already defined in function
addition(a, b) # for user input

# 3. no parameter, yes return type

def addition () :
    
    a = int(input("Enter a number: ")) # user input 1
    b = int(input("Enter a number: ")) # user input 2
    # user input inside because values are not defined in function
    
    # a = 10
    # b = 20
    return a + b

c = addition()
print (c)


# 4. yes parameter, yes return type # user input dosent needed

def addition (a, b) :
    return a + b

x = 10
y = 20

c = addition (x, y)
print (c)


# 5. default parameters # user input dosent needed

def addition (a=0, b=0, c=0) :
    print ("A:",a, "B:",b, "C:",c)
    print ((a+b)*c)
    
addition (10, 20, 30)