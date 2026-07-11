# types :
# single level
# multi level
# multiple
# hybrid
# hirerchical

# single level


class A:  # super class
    def parent(self):
        print("parent called from parent")


class B(A):  # sub class
    # def parent(self):
    #     super().parent() # to avoid overriding
    #     print("parent called from b")

    def child(self):
        print("child called from child")


obj = B()
obj.parent()
obj.child()


# multi level


class A:  # super class
    def parent(self):
        print("parent called from parent")


class B(A):  # sub class 1
    def child1(self):
        print("child called from child")

class C(B): # sub class 2
    def child1_of_1(self):
        print("child1_of_1 called feom child1_of_1")

# obj = B() # not required
# obj.parent()
# obj.child1()

obj = C()
obj.parent()
obj.child1()
obj.child1_of_1()


# multiple level


class A:  # super class
    def parent(self):
        print("parent called from parent")


class B():  # sub class 1
    def child1(self):
        print("child called from child")

class C(A,B): # sub class 2
    def child2(self):
        print("child2 called feom child2")

# obj = B() # not required
# obj.parent()
# obj.child1()

obj = C()
obj.parent()
obj.child1()
obj.child2()


# hirerchical level


class A:  # super class
    def parent(self):
        print("parent called from parent")


class B(A):  # sub class 1
    def child1(self):
        print("child called from child")

class C(A): # sub class 2
    def child2(self):
        print("child2 called feom child2")

class D(A): # sub class 3
    def child2(self):
        print("child3 called feom child3")

# obj = B() # not required
# obj.parent()
# obj.child1()

obj = D()
obj.parent()
obj.child1()
obj.child2()
obj.child3()


# hybrid level


class A:  # super class
    def parent(self):
        print("parent called from parent")


class B(A):  # sub class 1
    def child1(self):
        print("child called from child")

class C(A): # sub class 2
    def child2(self):
        print("child2 called feom child2")

class D(B, C): # sub class 3
    def child3(self):
        print("child3 called feom child3")

# obj = B() # not required
# obj.parent()
# obj.child1()

obj = D()
obj.parent()
obj.child1()
obj.child2()
obj.child3()


# class A :
#     def parent(self) :
#         print("parent called from parent")

# class B(A) :
#     def child(self) :
#         print("child called from child")

#     def parent(self) :
#         super().parent()
#         print("parent called from child")


# questions 1 to 6 in oops