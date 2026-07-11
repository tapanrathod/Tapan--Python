# while loop

# increse order

n = int(input("Eneter the number:")) 
i = 1 # start point

while(i<=n) : # condition
    print(i)
    i = i+1 # end point
    
# reverse order
    
n = int(input("Eneter the number:")) 
i = 10 # start point

while(i>=n) : # condition
    print(i)
    i = i-1  # end point
    
    
# for loop

# increse order

n = int(input("Enter the number:"))

for i in range (1, n+1) : #range: start point, end point
    print (i)
    
# reverse order

n1 = int(input("Enter the start number:")) # start point
n2 = int(input("Enter the end number:")) # end point

for i in range (n1, n2-1, -1) : # range: start point, end point, reverse
    print (i)