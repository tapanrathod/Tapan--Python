def print1toN (a, n) : # function
    if (a<=n) :
        print (a)
        a+=1
        print1toN (a, n) # recursion
print1toN (1, 10)


def print1toN(a, n, s = 0) : # function   
     if(a <= n) :
         s += a
         a += 1
         print1toN(a, n, s) # recursion
     else :
         print(s)
        
a = int(input("Enter a start number :")) # user input1
n = int(input("Enter a end number :")) # user input2
  
print1toN(a, n)