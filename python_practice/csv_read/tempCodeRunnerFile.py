import csv

from functools import reduce

with open("./practice/csv_read/sales.csv", "r") as file:

    read = csv.DictReader(file)

    data = list(read)


def add_sales(total, row):

    return total + int(row["amount"])


total_sales = reduce(add_sales, data, 0)  # reduce function

print(total_sales)

file.close()