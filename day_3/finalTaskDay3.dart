class BankAccount {
  double accountBalance;
  String accountName;
  String accountPassword;
  int id;
  static int idCounter = 1;

  BankAccount({required this.accountBalance, required this.accountName, required this.accountPassword}):
  id = BankAccount.idCounter++;

  void set balance(value) => (this.accountBalance = value);

  double operator +(int other) {
    this.accountBalance += other;
    return this.accountBalance + other;
  }

  double operator -(int other) {
    this.accountBalance -= other;
    return this.accountBalance - other;
  }

  void send_money(BankAccount userAccount, int moneyToSend, String accPassword) {
    if (!this.isValidPassword(accPassword)) {
      throw new AssertionError("Account Password is not correct");
    }
    if (this.accountBalance <= moneyToSend) {
      throw new AssertionError("You don't have enough funds");
    }
    this - moneyToSend;
    userAccount + moneyToSend;
  }

  void receive_money(BankAccount userAccount, int moneyToReceive) {
    if (userAccount.accountBalance <= moneyToReceive) {
      throw new AssertionError("User can't send you money because he don't have enough funds");
    }
    this + moneyToReceive;
    userAccount - moneyToReceive;
  }

  void checkBalance(String password) {
    if (!isValidPassword(password)) {
      throw new AssertionError("Account Password is not correct");
    }
    print("your account balance is: ${this.accountBalance}");
  }

  void changePassword(String oldPassword, String newPassword) {
    if (!isValidPassword(oldPassword)) {
      throw new AssertionError("Old Password is not correct");
    }
    this.accountPassword = newPassword;
  }

  bool isValidPassword(String accPassword) {
    if (this.accountPassword != accPassword) {
      return false;
    }
    return true;
  }
}

void main() {
  BankAccount acc1 = new BankAccount(
    accountBalance: 5000,
    accountName: "Ammar Massoud",
    accountPassword: "54sdf45v"
  );

  BankAccount acc2 = new BankAccount(
    accountBalance: 5000,
    accountName: "Ammar Massoud",
    accountPassword: "54dfdf45d"
  );

  acc1.send_money(acc2, 1000, "54sdf45v");
  print(acc1.accountBalance);
  print(acc2.accountBalance);

  acc1.send_money(acc2, 1000, "54sdf45v");
  print(acc1.accountBalance);
  print(acc2.accountBalance);

  acc1.send_money(acc2, 2000, "54sdf45v");
  print(acc1.accountBalance);
  print(acc2.accountBalance);


  print(acc1.id);
  print(acc2.id);
}
