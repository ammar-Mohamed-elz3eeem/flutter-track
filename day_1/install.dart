void main () {
  int num = 50;
  String name = "ammar, ammar, ammar";
  Map<String, Object> person = {
    "name": "Ahmed",
    "age": 20,
    "eduction": "High School"
  };
  // double salary = 551.25;
  List<int> numbers = [6,5,4,3,2,1];
  // bool isChanged = false;

  print(name.padRight(16, "#"));
  print(person.containsKey("eduction"));
  print(person.containsKey("name"));
  (person.forEach((key, value) {
    print("(${key}): ${value}");
    print(value);
    print("${value}");
  }));
  person.putIfAbsent("eduction", () {
    return "University Student";
  });
  var i = 3;
  print(i++ + ++i);
  print(person);
  List<String> names = name.split(", ");
  names.forEach((btngan) {
    print(btngan);
  });

  print(add(50, 15));

  print(numbers.reduce((a, b) {
    return a*b;
  }));

  print(num);
  print(name);
  print(names);
  print(person);

  sum(5, 10);
  sum_printer(5, 10);
}

// function_Type function_name(parameters) {
//   // function body
// }

int sum(int a, int b) {
  return a + b;
}

void sum_printer(int a, int b) {
  print(a + b);
}

int add(int a, [int b = 2]) {
  return a + b;
}
