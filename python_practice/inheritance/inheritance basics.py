# single level inheritance

class A:  # super class
    def parent(self):
        print("parent called from parent") 

class B(A):  # sub class
    def child(self):
        print("child called from child")
obj = B()
obj.parent()
obj.child()


# multi level inheritance

class A:  # super class
    def parent(self):
        print("parent called from parent")

class B(A):  # sub class 1
    def child1(self):
        print("child called from child")
class C(B): # sub class 2
    def child1_of_1(self):
        print("child1_of_1 called from child1_of_1")

obj = C()
obj.parent()
obj.child1()
obj.child1_of_1()


# multiple level inheritance

class A:  # super class
    def parent(self):
        print("parent called from parent")
class B():  # sub class 1
    def child1(self):
        print("child called from child")
class C(A,B): # sub class 2
    def child2(self):
        print("child2 called from child2")

obj = C()
obj.parent()
obj.child1()
obj.child2()

# hirerchical level inheritance

class A:  # super class
    def parent(self):
        print("parent called from parent")
class B(A):  # sub class 1
    def child1(self):
        print("child called from child")
class C(A): # sub class 2
    def child2(self):
        print("child2 called from child2")

obj1 = B()
obj1.parent()
obj1.child1()
obj2 = C()
obj2.parent()
obj2.child2()


# hybrid inheritance

class A:  # super class
    def parent(self):
        print("parent called from parent")
class B(A):  # sub class 1
    def child1(self):
        print("child called from child")
class C(A): # sub class 2
    def child2(self):
        print("child2 called from child2")
class D(B,C): # sub class 3
    def child3(self):
        print("child3 called from child3")

obj = D()
obj.parent()
obj.child1()
obj.child2()
obj.child3()


# method overriding

class A:
    def parent(self):
        print("parent called from parent") 

class B(A):
    def child(self):
        super().parent()  # Calls parent method
        print("child called from child")

obj = B()
obj.child()


class A:
    def parent(self):
        print("parent called from parent")

class B(A):
    def child1(self):
        super().parent()
        print("child called from child")

class C(B):
    def child1_of_1(self):
        super().child1()
        print("child1_of_1 called from child1_of_1")

obj = C()
obj.child1_of_1()


class A:
    def display(self):
        print("Method from Class A")

class B:
    def display(self):
        print("Method from Class B")

class C(A, B):
    def child_display(self):
        super().display() # This will call A's method first based on MRO (Method Resolution Order)
        print("Method from Class C")

obj = C()
obj.child_display()


class A:
    def parent(self):
        print("Base parent method")

class B(A):
    def child1(self):
        super().parent()
        print("Child 1 logic")

class C(A):
    def child2(self):
        super().parent()
        print("Child 2 logic")

obj1 = B()
obj1.child1()
obj2 = C()
obj2.child2()


class A:
    def action(self):
        print("Action from A")

class B(A):
    def action(self):
        super().action()
        print("Action from B")

class C(A):
    def action(self):
        super().action()
        print("Action from C")

class D(B, C):
    def action(self):
        super().action()
        print("Action from D")

obj = D()
obj.action()
