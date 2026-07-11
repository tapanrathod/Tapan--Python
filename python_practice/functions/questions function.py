# 1. Write a Python function to find the maximum between two numbers.

def max(a, b) :

    if (a>b) :
        print ("a is maximum")
    
    else :
        print ("b is maximum")
    
a = int(input("Enter a number: ")) # user input 1
b = int(input("Enter a number: ")) # user input 2
# user input outside because values are already defined in function

max(a,b)

# 2. Write a Python function to find the maximum between three numbers.

def max(a, b, c) :

    if (a>b and a>c) :
        print (a, "is maximum")
    
    elif (b>a and b>c) :
        print (b, "is maximum")
        
    else :
        print (c, "is maximum")
    
a = int(input("Enter a number: ")) # user input 1
b = int(input("Enter a number: ")) # user input 2
c = int(input("Enter a number: ")) # user input 3
# user input outside because values are already defined in function

max(a,b,c)


# 3. Write a Python function to check whether a number is negative, positive, or zero.

def check(a) :

    if (a>0) :
        print (a, "is positive")
    
    elif (a<0) :
        print (a, "is negative")
        
    else :
        print (a, "is zero")
a = int(input("Enter a number: ")) # user input
# user input outside because values are already defined in function
check(a)


# 4. Write a Python function to check whether a number is divisible by 5 and 11 or not.

def check(a) :

    if (a%5==0 and a%11==0) :
        print (a, "is divisible by 5 and 11")
    
    else :
        print (a, "is not divisible by 5 and 11")
a = int(input("Enter a number: ")) # user input
# user input outside because values are already defined in function
check(a)


# 5. Write a Python function to check whether a number is even or odd.

def check(a) :

    if (a%2==0) :
        print (a, "is even")
    
    else :
        print (a, "is odd")
a = int(input("Enter a number: ")) # user input
# user input outside because values are already defined in function
check(a)


# 6. Write a Python function to check whether a character is an alphabet or not.

def check(a) :

    if (a.isalpha()) :
        print (a, "is an alphabet")
    
    else :
        print (a, "is not an alphabet")
a = input("Enter a character: ") # user input
# user input outside because values are already defined in function
check(a)


# 7. Write a Python function to input any alphabet and check whether it is a vowel or consonant.

def check(a) :

    if (a in 'aeiouAEIOU') :
        print (a, "is a vowel")
    
    else :
        print (a, "is a consonant")
a = input("Enter a character: ") # user input
# user input outside because values are already defined in function
check(a)


# 8. Write a Python function to input any character and check whether it is an alphabet, digit, or special character.

def check(a) :

    if (a.isalpha()) :
        print (a, "is an alphabet")
    
    elif (a.isdigit()) :
        print (a, "is a digit")
        
    else :
        print (a, "is a special character")
a = input("Enter a character: ") # user input
# user input outside because values are already defined in function
check(a)


# 9. Write a Python function to check whether a character is uppercase or lowercase alphabet.

def check(a) :

    if (a.isupper()) :
        print (a, "is an uppercase alphabet")
    
    elif (a.islower()) :
        print (a, "is a lowercase alphabet")
        
    else :
        print (a, "is not an alphabet")
a = input("Enter a character: ") # user input
# user input outside because values are already defined in function
check(a)


# 10. Write a Python function to input a week number and print the weekday.

def check(a) :

    if (a==1) :
        print ("Monday")
    
    elif (a==2) :
        print ("Tuesday")
        
    elif (a==3) :
        print ("Wednesday")
        
    elif (a==4) :
        print ("Thursday")
        
    elif (a==5) :
        print ("Friday")
        
    elif (a==6) :
        print ("Saturday")
        
    elif (a==7) :
        print ("Sunday")
        
    else :
        print ("Invalid week number")  
a = int(input("Enter a week number (1-7): ")) # user input
# user input outside because values are already defined in function
check(a)


# 11. Write a Python function to input a month number and print the number of days in that month.

def check(a) :

    if (a==1 or a==3 or a==5 or a==7 or a==8 or a==10 or a==12) :
        print ("31 days")
    
    elif (a==4 or a==6 or a==9 or a==11) :
        print ("30 days")
        
    elif (a==2) :
        print ("28 or 29 days")
        
    else :
        print ("Invalid month number")
a = int(input("Enter a month number (1-12): ")) # user input
# user input outside because values are already defined in function
check(a)


# Write a Python function to calculate profit or loss.

def check(cost_price, selling_price) :

    if (selling_price>cost_price) :
        profit = selling_price - cost_price
        print ("Profit is", profit)
    
    elif (cost_price>selling_price) :
        loss = cost_price - selling_price
        print ("Loss is", loss)
        
    else :
        print ("No profit, no loss")
cost_price = float(input("Enter cost price: ")) # user input
selling_price = float(input("Enter selling price: ")) # user input
# user input outside because values are already defined in function
check(cost_price, selling_price)


# 13. Write a Python function to input marks of five subjects (Physics, Chemistry, Biology, Mathematics, and Computer), calculate percentage, and grade according to the following: 
# Percentage >= 90% : Grade A 
# Percentage >= 80% : Grade B 
# Percentage >= 70% : Grade C 
# Percentage >= 60% : Grade D 
# Percentage >= 40% : Grade E 
# Percentage < 40% : Grade F

def check(physics, chemistry, biology, mathematics, computer) :

    total_marks = physics + chemistry + biology + mathematics + computer
    percentage = (total_marks / 500) * 100
    
    if (percentage >= 90) :
        print ("Grade A")
    
    elif (percentage >= 80) :
        print ("Grade B")
        
    elif (percentage >= 70) :
        print ("Grade C")
        
    elif (percentage >= 60) :
        print ("Grade D")
        
    elif (percentage >= 40) :
        print ("Grade E")
        
    else :
        print ("Grade F")
physics = float(input("Enter marks for Physics: ")) # user input
chemistry = float(input("Enter marks for Chemistry: ")) # user input
biology = float(input("Enter marks for Biology: ")) # user input
mathematics = float(input("Enter marks for Mathematics: ")) # user input
computer = float(input("Enter marks for Computer: ")) # user input
# user input outside because values are already defined in function
check(physics, chemistry, biology, mathematics, computer)


# 14. Write a Python function to input the basic salary of an employee and calculate its gross salary according to the following:
# Basic Salary <= 10000 : HRA = 20%, DA = 80% 
# Basic Salary <= 20000 : HRA = 25%, DA = 90% 
# Basic Salary > 20000 : HRA = 30%, DA = 78%

def check(basic_salary) :

    if (basic_salary <= 10000) :
        hra = 0.20 * basic_salary
        da = 0.80 * basic_salary
        gross_salary = basic_salary + hra + da
        print ("Gross Salary is", gross_salary)
    
    elif (basic_salary <= 20000) :
        hra = 0.25 * basic_salary
        da = 0.90 * basic_salary
        gross_salary = basic_salary + hra + da
        print ("Gross Salary is", gross_salary)
        
    else :
        hra = 0.30 * basic_salary
        da = 0.78 * basic_salary
        gross_salary = basic_salary + hra + da
        print ("Gross Salary is", gross_salary)
basic_salary = float(input("Enter basic salary: ")) # user input
# user input outside because values are already defined in function
check(basic_salary)


# 15. Write a Python function to count the total number of notes in a given amount.

def count_notes(amount) :

    notes_2000 = amount // 2000
    amount = amount % 2000
    
    notes_500 = amount // 500
    amount = amount % 500
    
    notes_200 = amount // 200
    amount = amount % 200
    
    notes_100 = amount // 100
    amount = amount % 100
    
    notes_50 = amount // 50
    amount = amount % 50
    
    notes_20 = amount // 20
    amount = amount % 20
    
    notes_10 = amount // 10
    amount = amount % 10
    
    notes_5 = amount // 5
    amount = amount % 5
    
    notes_2 = amount // 2
    amount = amount % 2
    
    notes_1 = amount // 1
    
    total_notes = (notes_2000 + notes_500 + notes_200 + notes_100 + 
                   notes_50 + notes_20 + notes_10 + notes_5 + 
                   notes_2 + notes_1)
    
    print ("Total number of notes is", total_notes)
amount = int(input("Enter the amount: ")) # user input
# user input outside because values are already defined in function
count_notes(amount)
