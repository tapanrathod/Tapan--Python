# method overiding : same function name but different class
# method overloading : same function name but different parameters


class A :
    def methodA(self) :
        print("Method A called from class A")

class B(A) :

    def methodB(self) :
        print("Method B called from class B")

    def methodA(self) :
        print("Method A called from class B")


obj = B()

obj.methodA()
obj.methodB()