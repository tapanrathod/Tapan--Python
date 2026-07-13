# database create : 

# import sqlite3 # import must

# con = sqlite3.connect("./python_lectures/students.db") # connection and file path

# print("Connection Created")

# con.close() # connection close must



# table create : 

# import sqlite3

# con = sqlite3.connect("./python_lectures/students.db")

# q = '''                   # Query
# create table students (
#     id int primary key,
#     name varchar(20),
#     age int
# )
# '''

# con.execute(q) # query execute after the query is created

# print("Table Created")

# con.close()



# data insert :

# import sqlite3

# con = sqlite3.connect("./python_lectures/students.db")

# q = '''
# insert into students (id, name, age) values (1, "Umesh", 50) # insert single data
# '''

# q = '''
# insert into students (id, name, age) values # insert multiple data
# (2, "Umesh", 50),
# (3, "Umesh", 50),
# (4, "Umesh", 50),
# (5, "Umesh", 50),
# (6, "Umesh", 50)
# '''

# con.execute(q)
# con.commit() # commit when the table is being manipulated means data is being inserted, updated or being deleted

# print("Data Inserted")

# con.close()


# data update : 

# import sqlite3

# con = sqlite3.connect("./python_lectures/students.db")

# q = '''
# update students set age = 30 where id = 5 # update query
# '''

# con.execute(q)
# con.commit()

# print("Data Updated")

# con.close()


# delete table :

# import sqlite3

# con = sqlite3.connect("./python_lectures/students.db")

# q = '''
# delete from students where id = 4 # delete query
# '''

# con.execute(q)
# con.commit()

# print("Data Deleted")

# con.close()



# read table : 

import sqlite3

con = sqlite3.connect("./python_lectures/students.db")

q = '''
select * from students where age = 30 and instr(name, "U")
'''
# read query

cursor = con.cursor() # cursor is must to fetch data else write conditions in select/ read query


cursor.execute(q) # cursor execute

data = cursor.fetchall() # fetch data

print(data)


con.close()



