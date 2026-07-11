# class : aka blueprint of object. collections of functions, variables
# object : an instance of class

class A : # class A
    def funA(self) : # function 1 of class ("self" must in brackets)
        print("funA() called")

    def funB(self) : # function 2 of class ("self" must in brackets)
        print("funB() called")


obj = A()

obj.funA()
obj.funB()

