import 'package:final_week1_task/classes/file_db_class.dart';

class User extends FileDB {
  final String id = FileDB.id;
  String firstName;
  String lastName;
  String email;
  String password;

  User(this.firstName, this.lastName, this.email, this.password)
      : super("user.json");

  User.fromJson(Map? data)
      : email = data?['email'] ?? "",
        firstName = data?['firstName'] ?? "",
        lastName = data?['lastName'] ?? "",
        password = data?['password'] ?? "",
        super("user.json") {
    reload();
  }

  void updateUser(Map updates) {
    updates.forEach((key, value) {
      switch (key) {
        case 'firstName':
          firstName = value;
          break;
        case 'lastName':
          lastName = value;
          break;
        case 'email':
          email = value;
          break;
        case 'password':
          password = value;
          break;
        case _:
          throw AssertionError("The $key is not valid user data");
      }
    });
  }

  Map toMap() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    };
  }
}
