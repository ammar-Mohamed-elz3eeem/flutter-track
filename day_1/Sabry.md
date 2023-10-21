// Day 1

// Task 1
import 'dart:io';

void main() {
  List<int> numbers =[1,2,3,4,5];
  bool Checker = true;
  List<int> mappedNumbers = map(numbers, (int number) => number * 2, Checker);
  print(mappedNumbers);
}

List<T> map<T>(Iterable<T> list, T Function(T) mappingFunction, bool Checker) {
  List<T> mappedList = [];

  for (T element in list) {
    if (Checker == true)
      mappedList.add(mappingFunction(element));
    else  mappedList.add(element);
  }

  return mappedList;
}

// Task 2

// 1
import 'dart:io';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  bool anyNumbers = any(numbers, (int number) => number == 2);
  print(anyNumbers);
}

bool any(Iterable<int> list, bool Function(int) anyFunction) {
  List<int> anyList = [];

  for (int element in list) {
    if (anyFunction(element)) {
      anyList.add(element);
      break;
    }
    ;
  }
  if (anyList.length > 0)
    return true;
  else
    return false;
}

// 2
import 'dart:io';

void main() {
  List<int> numbers = [1, 2, 3, 2, 5];
  bool everyNumbers = every(numbers, (int number) => number == 2);
  print(everyNumbers);
}

bool every(Iterable<int> list, bool Function(int) everyFunction) {
  List<int> everyList = [];

  for (int element in list) {
    if (everyFunction(element)) {
      everyList.add(element);
    }
    ;
  }
  // print(mappedList.length);
  // print(list.length);
  if (everyList.length == list.length)
    return true;
  else
    return false;
}

// 3

import 'dart:io';

void main() {
  List<int> numbers = [1, 2, 3, 2, 5];
  bool someNumbers = some(numbers, (int number) => number == 2);
  print(someNumbers);
}

bool some(Iterable<int> list, bool Function(int) someFunction) {
  List<int> someList = [];

  for (int element in list) {
    if (someFunction(element)) {
      someList.add(element);
    }
    ;
  }
  // print(mappedList.length);
  // print(list.length);
  if (someList.length >= 2)
    return true;
  else
    return false;
}


