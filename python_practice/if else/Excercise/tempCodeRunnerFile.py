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