// getters & setters
// factory constructor
// named constructor
// const constructor
// Initializer list
// abstract methods
// static methods & variables

// constructor redirection
// magic methods: call, operators
// typedefs

import 'classes.dart';

class Rectangle extends Object{
  final double width;
  final double height;

  Rectangle({required this.height, required this.width});

  // Magic Methods for operators
  Rectangle operator +(Rectangle otherRect) {
    return new Rectangle(width: otherRect.width * this.width, height: otherRect.height * this.height);
  }

  // Rectangle operator -(Rectangle otherRect) {
  //   return new Rectangle(width: this.width - otherRect.width, height: this.height - otherRect.height);
  // }

  bool operator ==(Object otherRect) {
    Rectangle rect = otherRect as Rectangle;
    return rect.height == this.height && rect.width == this.width;
  }
}

void main() {
  // Map<String, String> userInfo = {
  //   "user": "ali",
  //   "pass": "26f55v1fg"
  // };
  // User u = User.Init(userInfo);
  // u.print_uname();
  // User u2 = new User("ahmed", "5s4dv4sfv");
  // u2.print_uname();

  // Form loginForm = Form("ali", "5f4g5f4h");
  // User u = User.Init(loginForm);
  // print(u.user);
  // u.user = "al";
  // print(u.user);

  // FreeUser u1 = new FreeUser("abbas", "fdgdfd", "abbas", "abbas@abbas.com");
  // FreeUser u2 = new FreeUser("hussien", "vdfgfhd", "hussien", "hussien@hussien.com");
  // FreeUser u3 = new FreeUser("magdy", "drgssdh", "magdy", "magdy@magdy.com");
  // FreeUser u4 = new FreeUser("omar", "dhfg", "omar", "omar@omar.com");
  // FreeUser u5 = new FreeUser("Adel", "dfkgjlkdfj", "Adel", "Adel@adel.com");

  // print(u1()["Gold"]?.discount_price);
  // print(u1()["Silver"]?.discount_price);
  // print(u1()["Diamond"]?.discount_price);

  // u1.buyProduct(25);
  // u2.buyProduct(250);
  // u3.buyProduct(15);
  // u4.buyProduct(55);
  // u5.buyProduct(95);

  Rectangle rect1 = new Rectangle(width: 50, height: 30);
  Rectangle rect2 = new Rectangle(height: 30, width: 50);
  Rectangle rect5 = rect1 - rect2;
  Rectangle rect3 = rect1 + rect2;
  Rectangle rect4 = rect1 + rect2 + rect3;

  print(rect1 == rect2);


  // print(rect5.width);
  // print(rect5.height);
}

// 5 + 6 + 7 * 12 + 3;
