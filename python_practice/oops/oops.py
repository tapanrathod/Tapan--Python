# class : aka blueprint of object. collections of functions, variables, etc.
# object : an instance of class

class A : # class A
    def funA(self) : # function 1 of class ("self" must in brackets)
        print("funA() called")

    def funB(self) : # function 2 of class ("self" must in brackets)
        print("funB() called")


obj = A() # object created of class A

obj.funA() # it calls class function A
obj.funB() # it calls class function B