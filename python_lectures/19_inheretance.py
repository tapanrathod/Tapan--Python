# types :
# single level
# multi level
# multiple
# hybrid
# hirerchical


class A :
    def parent(self) :
        print("parent called from parent")



class B(A) :
    def child(self) :
        print("child called from child")

    def parent(self) :
        super().parent()
        print("parent called from child")


# class C(A) :
#     def child2(self) :
#         print("child2 called from child2")

# class D(B,C) :
#     def child3(self) :
#         print("child3 called from child3")



# obj = D()
# # obj.child()
# obj.parent()
# obj.child2()

obj = B()
obj.parent()
obj.child()