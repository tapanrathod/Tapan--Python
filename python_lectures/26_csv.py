# CSV : Comma Separated Value

import csv

# d = [
#     {"name" : "abc", "age" : 20},
#     {"name" : "ert", "age" : 30},
#     {"name" : "aoi", "age" : 25},
#     {"name" : "cvd", "age" : 28},
#     {"name" : "xyz", "age" : 35},
#     {"name" : "tyu", "age" : 18},
#     {"name" : "iop", "age" : 15},
#     {"name" : "mnb", "age" : 23},
# ]

# c = ["name", "age"]

# f = open("data.csv", "a")

# main = csv.DictWriter(f, c)

# main.writeheader()
# # main.writerow({"name" : "ABC", "age" : 23})
# # main.writerow({"name" : "XYZ", "age" : 26})
# # main.writerow({"name" : "ZXC", "age" : 30})

# main.writerows(d)

# f.close()

ndata = int(input("How many data ? : "))

n = int(input("How many keys ? :"))

k = []

for i in range(1, n + 1):
    v = input(f"Enter a key [{i}] :")
    k.append(v)

main_data = []

for i in range(1, ndata +1 ) : 
    d = {}
    
    for i in k:
        v = input(f"Enter a value of {i} : ")
        d[i] = v

    main_data.append(d)


f = open("data2.csv", "w", newline="")

m = csv.DictWriter(f, k)

m.writeheader()
# m.writerow(d)
m.writerows(main_data)

for i in main_data :
    print(i)

f.close()



