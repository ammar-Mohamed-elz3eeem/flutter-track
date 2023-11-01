class User {
  static int counter = 1;
  int id;
  String firstName = "";
  String lastName = "";
  String password = "";
  String email = "";

  User() : id = counter++;

  Map toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    };
  }
}
