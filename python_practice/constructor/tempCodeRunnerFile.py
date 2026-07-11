class BankAccount:
    def __init__(self, account_holder, balance):
        self.account_holder = account_holder
        self.balance = balance


acc = BankAccount("Tapan", 100000000000000)

print(f"Account Holder: {acc.account_holder}, Balance: {acc.balance}")