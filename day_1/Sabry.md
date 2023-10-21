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
import 'dart:io';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  bool anyNumbers = any(numbers, (int number) => number == 2);
  print(anyNumbers);
}

bool any(Iterable<int> list, bool Function(int) anyFunction) {
  List<int> mappedList = [];

  for (int element in list) {
    if (anyFunction(element)) {
      mappedList.add(element);
      break;
    }
    ;
  }
  if (mappedList.length > 0)
    return true;
  else
    return false;
}

// Task 3
import 'dart:io';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  bool anyNumbers = any(numbers, (int number) => number == 2);
  print(anyNumbers);
}

bool any(Iterable<int> list, bool Function(int) anyFunction) {
  List<int> mappedList = [];

  for (int element in list) {
    if (anyFunction(element)) {
      mappedList.add(element);
    }
    ;
  }
  // print(mappedList.length);
  // print(list.length);
  if (mappedList.length == list.length)
    return true;
  else
    return false;
}

