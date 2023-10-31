import 'package:flutter/material.dart';
import 'package:flutter_day9/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider<ToDoProvider>(
          create: (context) => ToDoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        )
      ],
      child: MaterialApp(
        routes: {
          "/": (context) => HomePage(),
          "/search": (context) => SearchPage(),
          "/todos-grid": (context) => const Todos(),
        },
        initialRoute: "/",
      ),
    ),
  );
}

class SearchPage extends StatelessWidget {
  TextEditingController text = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Consumer<SearchProvider>(
          builder: (context, searchedTodo, _) {
            return Consumer<ToDoProvider>(
              builder: (context, todos, child) {
                List<String> founded = todos.todoList
                    .where((element) => element.contains(text.value.text))
                    .toList();
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: text,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            searchedTodo.searchedText(text.value.text);
                          },
                          child: const Text("Search Todos"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: founded.length,
                        itemBuilder: (context, index) {
                          if (searchedTodo.text.isEmpty) {
                            return Container();
                          }
                          return Container(
                            width: 200,
                            height: 50,
                            child: Text(founded[index]),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              icon: Icon(
                Icons.home,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search");
              },
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/todos-grid");
              },
              icon: Icon(
                Icons.today_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  TextEditingController todo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              child: Consumer<CounterProvider>(
                builder: (context, ahmed, _) => Column(
                  children: [
                    Text(ahmed.counter.toString()),
                    IconButton(
                      onPressed: () {
                        ahmed.increment();
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        try {
                          ahmed.decrement();
                        } catch (e) {
                          print(e);
                        }
                      },
                      icon: const Icon(
                        Icons.remove,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 600,
              height: 600,
              child: Column(
                children: [
                  const Text(
                    "To Do Application",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  Consumer<ToDoProvider>(
                    builder: (context, todoProvider, child) {
                      ToDoProvider todoP = todoProvider as ToDoProvider;
                      return Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  child: TextField(
                                    controller: todo,
                                  ),
                                  width: 300,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    todoP.addTodo(todo.value.text);
                                  },
                                  child: const Text("Add Todo"),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: todoP.todoList
                                .map(
                                  (e) => Text(e),
                                )
                                .toList(),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              icon: Icon(
                Icons.home,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search");
              },
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/todos-grid");
              },
              icon: Icon(
                Icons.today_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Todos extends StatelessWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ToDoProvider>(
        builder: (context, value, child) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 5,
            crossAxisSpacing: 20,
          ),
          itemCount: value.todoList.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Text(
              value.todoList[index],
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
        // builder: (context, value, child) => GridView(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 5,
        //     crossAxisSpacing: 5,
        //     mainAxisSpacing: 5,
        //   ),
        //   children: value.todoList.map(
        //     (e) {
        //       return Container(
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             color: Colors.black,
        //           ),
        //         ),
        //         child: Text(
        //           e,
        //           style: TextStyle(fontSize: 50),
        //         ),
        //       );
        //     },
        //   ).toList(),
        // ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              icon: Icon(
                Icons.home,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search");
              },
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/todos-grid");
              },
              icon: Icon(
                Icons.today_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
