# Bank Account Modeling

### Attributes

- account_number
- id ( incremental number starting from 1 )
- account_holder_name
- account_balance

### Methods

- receive_money(BankAccount, Int): will use + operator (will do receive money functionality: take amount from other account and add it to my account )
  * will check first if accPassword is equal to the object password and if yes he can continue if not then throw error with custom message "Old Password is wrong"
  * Make a checker that the other account can have enough money to send to me

- send_money(BankAccount, MoneyToSend, accPassword): will use - operator (will do send money functionality: take amount from other account and add it to my account )
  * Make a checker that the my account have enough money to send to other account

- change_password(String oldPassword, String newPassword): will check first if oldPassword is equal to the object password and if yes he can continue doing change password functionality, if not then throw error with custom message "Old Password is wrong"

- checkBalance(String accPassword): will check first if accPassword is equal to the object password and if yes he can continue checking balance functionality, if not then throw error with custom message "Old Password is wrong"
