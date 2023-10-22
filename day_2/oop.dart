// OOP
// extension

// extension ListExtensions on List {
//   dynamic summer() {
//     dynamic acc;
//     for (final item in this) {
//       if (item is int) {
//         if (acc is Null) {
//           acc = 0;
//         }
//         acc += item;
//       } else if (item is String) {
//         if (acc is Null) {
//           acc = "";
//         }
//         acc += item + " ";
//       }
//     }
//     return acc;
//   }
// }

// void main () {
//   List<String> numbers = ["ahmed", "alaa", "hassan", "Hany"];
//   print(numbers.summer().length);
//   print(numbers.summer().trim().length);
// }


// User has properties: name, username, dob, password
class User {
  var name;
  var username;
  var dob;
  var password;

  User(name, username, dob, password) {
    this.name = name;
    this.username = username;
    this.dob = dob;
    this.password = password;
  }
}

// Has same properties as user with additional discount property
// has specifiec method called greetUser that print message Welcome Premium User
class PremiumUser extends User {
  var discount;
  PremiumUser(discount, name, username, password, dob): super(name, username, password, dob) {
    this.discount = discount;
    print("Welcome premium user");
    print("you have ${this.discount * 100}% discount");
    print("${this.name} ${this.username}: ${this.password} ${this.dob}");
  }
}

class Animal {
  var number_of_legs;
  var sound;
  var kind;

  Animal(String sound, String kind, [int number_of_legs = 4]) {
    this.sound = sound;
    this.kind = kind;
    this.number_of_legs = number_of_legs;
  }
}

class Dog extends Animal {
  Dog(): super("woof", "wild animal");
}

class Monkey extends Animal {
  Monkey(): super("talk", "wild animal", 2);
}


class Shape {
  var line1;
  var line2;
  var line3;
  var line4;

  Shape(l1, l2, l3, l4) {
    line1 = l1;
    line2 = l2;
    line3 = l3;
    line4 = l4;
  }

  void draw_shape() {
    print("I will draw this shape");
  }
}

class Rectangle extends Shape {
  Rectangle(width, height): super(width, height, width, height);
  
  void print_rectangle() {
    print(line1);
    print(line2);
    print(line3);
    print(line4);
  }


  @override
  void draw_shape() {
    super.draw_shape();
    for(int i=0;i<line1;i++){
      String w="";
      for(int j=0;j<line2;j++){
        w+="*";
      }
      print(w);        
    }
  }
}

class Square extends Rectangle {
  double width;
  String ch;
  Square(this.width, this.ch): super(width, width);

  @override
  void draw_shape() {
    for(int i = 0; i < width; i++) {
      String line = "";
      for(int j = 0; j < width; j++) {
        line += ch;
      }
      print(line);
    }
  }
}

void main() {
  // PremiumUser user1 = new PremiumUser(0.25, "ammar", "alaa", "28-28-28", "1245652");
  // PremiumUser user2 = new PremiumUser(0.30, "ahmed", "hoho", "28-28-28", "1245652");
  // PremiumUser user3 = new PremiumUser(0.35, "Huessin", "momo", "28-28-28", "1245652");
  // PremiumUser user4 = new PremiumUser(0.40, "Bahi", "soso", "28-28-28", "1245652");
  // PremiumUser user5 = new PremiumUser(0.45, "Fadi", "koko", "28-28-28", "1245652");
  // Animal dog = new Dog();
  // Animal monkey = new Monkey();
  // Rectangle rect = new Rectangle(5, 3);
  // rect.print_rectangle();
  // rect.draw_shape();
  Square sq = new Square(10, "\$");
  sq.draw_shape();
}

// magic methods: call, operators
