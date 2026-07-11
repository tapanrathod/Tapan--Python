# 1. Write a Python function to calculate the factorial of a number using recursion.

def fact (n, f=1) : # function
    if (n>=1) :
        f *= n
        n-=1
        fact(n, f) 
    else :
        print(f,"Is a factorial of",N)
N= int(input("Enter the number:"))

fact(N, f=1) # recursion


# 2. Write a Python function to calculate the factorials between the numbers using recursion.

def fact (n, f=1, a=1) :
    if (n>=a) :
        f *= n
        n-=1
        fact(n, f, a) 
    else :
        print("The factorial between", N, "and", A, "is:", f)
N= int(input("Enter the 1st nubmer:"))
A= int(input("Enter the 2nd number:"))

fact(N, f=1, a=A)


# 3. Create a recursive Python function to find the GCD (Greatest Common Divisor) of two numbers.

def gcd(a, b) :
    if (b==0) :
        return a
    else :
        return gcd(b, a%b)
a = int(input("Enter the 1st nubmer:"))
b = int(input("Enter the 2nd number:"))
print("The GCD of", a, "and", b, "is:", gcd(a, b))


# 4. Write a recursive function to compute the power of a number.

def power(a, b) :
    if (b==0) :
        return 1
    else :
        return a * power(a, b-1)
a = int(input("Enter the base number:"))
b = int(input("Enter the exponent number:"))
print(a, "raised to the power of", b, "is:", power(a, b))


# 5. Write a python program to print all natural numbers between 1 to n using recursion.

def print1ton(a, n) :
    if(a <= n) :
        print(a)
        a += 1
        print1ton(a, n)
a = int(input("Enter a start number :"))
n = int(input("Enter a end number :"))
print1ton(a, n)


# Write a python program to print all even or odd numbers in given range using recursion.

def printEven(a, n) :
    if(a <= n) :
        if (a%2==0) :
            print(a)
        a += 1
        printEven(a, n)
a = int(input("Enter a start number :"))
n = int(input("Enter a end number :"))
print("Even numbers between", a, "and", n, "are:")
printEven(a, n)

def printOdd(a, n) :
    if(a <= n) :
        if (a%2!=0) :
            print(a)
        a += 1
        printOdd(a, n)
a = int(input("Enter a start number :"))
n = int(input("Enter a end number :"))
print("Odd numbers between", a, "and", n, "are:")
printOdd(a, n)


# Write a python program to find sum of all natural numbers between 1 to n using recursion.

def sum1ton(a, n, s = 0) :
    if(a <= n) :
        s += a
        a += 1
        sum1ton(a, n, s)
    else :
        print("The sum of natural numbers between", A, "and", N, "is:", s)
A = int(input("Enter a start number :"))
N = int(input("Enter a end number :"))
sum1ton(A, N)


# Write a python program to find the sum of all even or odd numbers in a given range using recursion.

def sumEven(a, n, s = 0) :
    if(a <= n) :
        if (a%2==0) :
            s += a
        a += 1
        sumEven(a, n, s)
    else :
        print("The sum of even numbers between", A, "and", N, "is:", s)
A = int(input("Enter a start number :"))
N = int(input("Enter a end number :"))
sumEven(A, N)

def sumOdd(a, n, s = 0) :
    if(a <= n) :
        if (a%2!=0) :
            s += a
        a += 1
        sumOdd(a, n, s)
    else :
        print("The sum of odd numbers between", A, "and", N, "is:", s)
A = int(input("Enter a start number :"))
N = int(input("Enter a end number :"))
sumOdd(A, N)