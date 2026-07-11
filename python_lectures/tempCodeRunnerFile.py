import csv

f = open("students.csv", "r")

r = csv.DictReader(f)
data = list(r)

print(r.fieldnames)
