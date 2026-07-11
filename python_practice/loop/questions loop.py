# Write a Python program to print all alphabets from 'A' to 'Z' using a while loop.

i = 65 # ASCII code of "A"
while (i<=90) : # ASCII code of "Z"
    print(chr(i))
    i=i+1
    
# Write a Python program to print all alphabets from 'a' to 'z' using a while loop.

i = 97 # ASCII code of "a"
while (i<=122) : # ASCII code of "z"
    print(chr(i))
    i=i+1
 
    
# for loop

# 1.
i = 65 # ASCII code of "A"

for i in range(i, 90+1) : # ASCII code of "Z"+1
    print (chr(i))

# 2.   
i = 97 # ASCII code of "a"

for i in range(i, 122+1) : # ASCII code of "z"+1
    print (chr(i))


# Write a Python program to print all even numbers between 1 to 100 using a while loop.

i = 2
while (i<=100) :
    print(i)
    i=i+2

for i in range(2, 100+1, 2) :
    print(i, end=", ")

# Write a Python program to print all odd numbers between 1 to 100 using a while loop.

i = 1
while (i<=100) :
    print(i)
    i=i+2

for i in range(1, 100+1, 2) :
    print(i)


# Write a Python program to find the sum of all natural numbers between 1 to n using a while loop.

n = int(input("Enter the number:"))
i = 1
sum = 0
while (i<=n) :
    sum = sum + i
    i = i + 1
print("The sum of all natural numbers between 1 to", n, "is", sum)

n = int(input("Enter the number:"))
sum = 0
for i in range(1, n+1) :
    sum = sum + i
print("The sum of all natural numbers between 1 to", n, "is", sum)


# Write a Python program to find the sum of all even numbers between 1 to n using a while loop.

n = int(input("Enter the number:"))
i = 2
sum = 0
while (i<=n) :
    sum = sum + i
    i = i + 2  
print("The sum of all even numbers between 1 to", n, "is", sum)

n = int(input("Enter the number:"))
sum = 0
for i in range(2, n+1, 2) :
    sum = sum + i
print("The sum of all even numbers between 1 to", n, "is", sum)


#Write a Python program to find the sum of all odd numbers between 1 to n using a while loop.

n = int(input("Enter the number:"))
i = 1  
sum = 0
while (i<=n) :
    sum = sum + i
    i = i + 2
print("The sum of all odd numbers between 1 to", n, "is", sum)

n = int(input("Enter the number:"))
sum = 0
for i in range(1, n+1, 2) :
    sum = sum + i
print("The sum of all odd numbers between 1 to", n, "is", sum)


# Write a Python program to print all ASCII characters with their values using a while loop.

i = 0
while (i<=127) :
    print(i, ":", chr(i))
    i = i + 1
    
for i in range(0, 127+1) :
    print(i, ":", chr(i))


# Write a Python program to calculate the factorial of a number using a while loop.

n = int(input("Enter the number:"))
i = 1
fact = 1
while (i<=n) :
    fact = fact * i
    i = i + 1  
print("The factorial of", n, "is", fact)

n = int(input("Enter the number:"))
fact = 1
for i in range(1, n+1) :
    fact = fact * i
print("The factorial of", n, "is", fact)


# Write a Python program to print all prime numbers between 1 to n using a while loop.

n = int(input("Enter the number:"))
i = 2
while (i<=n) :
    count = 0
    j = 2
    while (j<=i//2) :
        if (i%j==0) :
            count = count + 1
            break
        j = j + 1
    if (count==0) :
        print(i)
    i = i + 1

n = int(input("Enter the number:"))
for i in range(2, n+1) :
    count = 0
    for j in range(2, i//2+1) :
        if (i%j==0) :
            count = count + 1
            break
    if (count==0) :
        print(i)


# Write a Python program to print all Fibonacci numbers between 1 to n using a while loop.

n = int(input("Enter the number:"))
a = 0
b = 1
while (a<=n) :
    print(a)
    c = a + b
    a = b
    b = c

n = int(input("Enter the number:"))
a = 0
b = 1
for i in range(1, n+1) :
    if (a>n) :
        break
    print(a)
    c = a + b
    a = b
    b = c


# Write a Python program to print all the numbers from 1 to n in increasing and decreasing order using a while loop.

n = int(input("Enter the number:"))
i = 1
while (i<=n) :
    print(i)
    i = i + 1

n = int(input("Enter the number:"))
i = n
while (i>=1) :
    print(i)
    i = i - 1

n = int(input("Enter the number:"))
for i in range(1, n+1) :
    print(i)

n = int(input("Enter the number:"))
for i in range(n, 0, -1) :
    print(i)


# Write a script that simulates a password entry. Allow the user three attempts to enter the correct password. If the correct password is entered, print a success message; otherwise, display a failure message.

password = "password123"
attempts = 3
while (attempts>0) :
    user_input = input("Enter the password:")
    if (user_input==password) :
        print("Password is correct. Access granted.")
        break
    else :
        attempts = attempts - 1
        print("Incorrect password. Attempts left:", attempts)

password = "password123"
for i in range(3) :
    user_input = input("Enter the password:")
    if (user_input==password) :
        print("Password is correct. Access granted.")
        break
    else :
        print("Incorrect password. Attempts left:", 2-i)


# write a python program to find factors in loop

n = int(input("Enter the number:"))
print("Factors of", n, "are:")
for i in range(1, n+1) :
    if (n%i==0) :
        print(i)


# write a python program to find HCF in loop

n1 = int(input("Enter the first number:"))
n2 = int(input("Enter the second number:"))
hcf = 1
for i in range(1, min(n1, n2)+1) :
    if (n1%i==0 and n2%i==0) :
        hcf = i
print("The HCF of", n1, "and", n2, "is", hcf)