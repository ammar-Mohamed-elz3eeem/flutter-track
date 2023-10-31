import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter = counter + 1;
    notifyListeners();
  }

  void decrement() {
    counter--;
    if (counter < 0) {
      throw AssertionError("Counters must be positive or 0");
    }
    notifyListeners();
  }
}

class SearchProvider with ChangeNotifier {
  String text = "";

  void searchedText(String txt) {
    text = txt;
    notifyListeners();
  }
}

class ToDoProvider with ChangeNotifier {
  List<String> todoList = [
    "ab",
    "ab",
    "ab",
    "ab",
    "ab",
    "ab",
    "ab",
    "ab",
    "ab",
    "ab",
    "ab"
  ];

  void addTodo(value) {
    todoList.add(value);
    notifyListeners();
  }

  void removeTodo(value) {
    todoList.remove(value);
    notifyListeners();
  }
}
