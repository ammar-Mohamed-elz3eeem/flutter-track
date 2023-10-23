class Form {
  String username = "";
  String password = "";
  List<String> errors = [];

  Form(String username, String password) {
    this.username = username;
    this.password = password;
    if (this.isValidUsername() && this.isValidPassword()) {
      print("Successfully Logged in");
    } else {
      throw new AssertionError("User info is not correct");
    }
  }

  bool isValidUsername() {
    if (this.username.length < 3 || this.username.length > 20) {
      this.errors.add("username must be between 3 and 20 chars");
      return false;
    }
    return true;
  }

  bool isValidPassword() {
    if (this.password.length < 8 || this.password.length > 20) {
      this.errors.add("Password must be between 8 and 20 chars");
      return false;
    }
    return true;
  }

  Map<String, dynamic> userInfo() {
    return {
      "user": this.username,
      "pass": this.password,
      "errors": this.errors
    };
  }
}
