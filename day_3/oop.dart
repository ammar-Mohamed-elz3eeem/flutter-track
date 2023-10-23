// getters & setters
// static methods & variables

// super parameters
// Initializer list
// constructor redirection
// factory constructor
// magic methods: call, operators
// abstract methods
// typedefs

import 'classes.dart';

void main() {
  // Map<String, String> userInfo = {
  //   "user": "ali",
  //   "pass": "26f55v1fg"
  // };
  // User u = User.Init(userInfo);
  // u.print_uname();
  // User u2 = new User("ahmed", "5s4dv4sfv");
  // u2.print_uname();

  Form loginForm = Form("ali", "5f4g5f4h");
  User u = User.Init(loginForm);
  print(u.user);
  u.user = "al";
  print(u.user);
}
