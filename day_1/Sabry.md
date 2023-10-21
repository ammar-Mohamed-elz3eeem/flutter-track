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
