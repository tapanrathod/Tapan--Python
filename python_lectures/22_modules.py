# Method - 1
import modules_function

modules_function.addition(10, 50)

obj = modules_function.A()

obj.funA()
obj.funB()

print(modules_function.a)
print(modules_function.x)

# Method - 2 :

import modules_function as mdf

mdf.addition(23, 45)


# Method - 3

from modules_function import addition, A, a 

a = 30

addition(20, 40)
print(a)


# Method - 4

from modules_function import *

addition(30, 50)
print(x)

# Method - 5 :

import sub_folder.test as st # rename

# sub_folder.test.A()
st.A()
