from array import array as ar

arr = ar("i", [])
num = 0

for i in range(8):
    a = int(input(f"Enter any 8 intiger numbers {i+1} : "))
    arr.append(a)

arr2 = ar("i", [])

for num in arr:
    if(num % 2 == 0) :
        arr2.append(num)

print("\nArray :", arr)
print ("\nArray of Even number is ", arr2)