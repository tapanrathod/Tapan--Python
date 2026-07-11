class BankAccount:
    def __init__(self, account_holder, balance):
        self.account_holder = account_holder
        self.balance = balance
        self.transactions = []

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            self.transactions.append(f"Deposited: {amount}")
        else:
            print("Deposit amount must be greater than 0.")

    def withdraw(self, amount):
        if amount <= 0:
            print("Withdrawal amount must be greater than 0.")
        elif self.balance - amount < 1000:
            print("Insufficient balance. Minimum balance of ₹1000 must be maintained.")
        else:
            self.balance -= amount
            self.transactions.append(f"Withdrew: {amount}")

    def check_balance(self):
        print(f"Current Balance: {self.balance}")

    def show_transactions(self):
        print("Transaction History:")
        for transaction in self.transactions:
            print(transaction)


# Example usage
account = BankAccount("Tapan", 50,000)
account.deposit(2000)
account.withdraw(3000)
account.check_balance()
account.show_transactions()
