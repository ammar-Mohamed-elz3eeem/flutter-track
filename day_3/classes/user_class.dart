import '../classes.dart';

class User {
  String? _username;
  String? _password;
  String title = "admin";

  // constant constructor
  User(user, pass)
  :_password = pass, _username = user;

  // factory constructor is the only constructor that can return value
  factory User.Init(Form form) {
    return User(form.username, form.password);
  }

  void set user(String new_value) {
    if (new_value.length < 3 || new_value.length > 20) {
      print("can't set name to be less than 3 fields");
    } else {
      this._username = new_value;
    }
  }
  String get user => "${this._username} ${this.title}";

  // void set pass(String new_value) {
  //   if (new_value.length < 3 || new_value.length > 20) {
  //     print("can't set name to be less than 3 fields");
  //   } else {
  //     this._password = new_value;
  //   }
  // }


  // named constructor
  // User.Init(Map<String, dynamic> data):
  // username = data['user'],
  // password = data['pass'];

  void print_uname() {
    print(this._username);
  }

}