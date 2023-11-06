import 'dart:convert';
import 'dart:io';

import 'package:final_week1_task/classes/file_db_class.dart';
import 'package:final_week1_task/classes/product_class.dart';
import 'package:final_week1_task/classes/review_class.dart';
import 'package:final_week1_task/classes/user_class.dart';

Future<void> consoleListener() async {
  FileDB database = FileDB("user.json");
  database.reload();
  Object objs = database.objects;
  print(objs);
}

void lineParser(String? exec) {
  List<String>? operations = exec?.split(" ");
  switch (operations?[0]) {
    case 'create':
      doCreate(operations!.sublist(1).join(" "));
      break;
    case 'update':
      doUpdate(operations!.sublist(1).join(" "));
      break;
    case 'all':
      doAll(operations!.sublist(1).join(" "));
      break;
    case 'show':
      doShow(operations!.sublist(1).join(" "));
      break;
  }
}

Map<String, Object> classes = {
  "User": User,
  "Product": Product,
  "Review": Review,
};

void doCreate(String line) {
  if (line.isEmpty) {
    throw AssertionError("** class name missing **");
  }
  List<String> info = line.split(" ");
  if (!classes.containsKey(info[0])) {
    throw AssertionError("** class name doesn't exit");
  }
  Map? data;
  try {
    data = jsonDecode(info.sublist(1).join());
  } catch (_) {
    print("make sure data entered in valid JSON format");
  }
  User u = User.fromJson(data);
  u.add(u.toMap());
  print(u.id);
}

void doUpdate(String line) {
  if (line.isEmpty) {
    throw AssertionError("** class name missing **");
  }
  List<String> info = line.split(" ");
  if (!classes.containsKey(info[0])) {
    throw AssertionError("** class name doesn't exit **");
  }
  Map? data;
  try {
    data = jsonDecode(info.sublist(1).join());
  } catch (_) {
    print("make sure data entered in valid JSON format");
  }
  User u = User.fromJson(data);
  print(u.id);
}

void doAll(String line) {
  if (line.isEmpty) {
    throw AssertionError("** class name missing **");
  }
  List<String> info = line.split(" ");
  if (!classes.containsKey(info[0])) {
    throw AssertionError("** class name doesn't exit **");
  }
}

void doShow(String line) {
  if (line.isEmpty) {
    throw AssertionError("** class name missing **");
  }
  List<String> info = line.split(" ");
  if (!classes.containsKey(info[0])) {
    throw AssertionError("** class name doesn't exit **");
  }
}
