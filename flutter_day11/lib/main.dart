import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  State<TodoList> createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  List items = [];

  Future<List> getUrl([int todo = 0]) async {
    Uri url = Uri.https(
      "jsonplaceholder.typicode.com",
      "/todos/${todo > 0 ? todo : ''}",
    );
    final http = await get(url);
    final List<dynamic> myList = jsonDecode(http.body);
    return myList;
  }

  @override
  void initState() {
    super.initState();
    getUrl().then((value) {
      setState(() {
        items = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) {
            return const Divider(
              height: 10,
              thickness: 2,
              color: Colors.black54,
            );
          },
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                items[index]['title'],
              ),
              tileColor:
                  items[index]['completed'] == true ? Colors.green : Colors.red,
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(TodoList());
}
