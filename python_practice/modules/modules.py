# no white space in file name
# no numbers in file name
# no dashes or special charecters in file name

# Method - 1 :

import modules_functions_practice  # file name

modules_functions_practice.addition(10, 50)  # imported function from filr

obj = modules_functions_practice.A()

obj.funA()
obj.funB()

print(modules_functions_practice.a)
print(modules_functions_practice.x)

# Method - 2 :

import modules_functions_practice as mdf  # rename file for shortcut

mdf.addition(23, 45)


# Method - 3 :

from modules_functions_practice import (
    addition,
    A,
    a,
)  # direct imported values from file

a = 30

addition(20, 40)  # operations on values
print(a)


# Method - 4 :

from modules_functions_practice import *  # "*" to import all from the file

addition(30, 50)
print(x)

# Method - 5 :

import sub_folder.test_practice as st # rename (in folder)

# sub_folder.test_practice.A()

st.A()
