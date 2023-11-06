import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: Counters(),
    ),
  ));
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class Counter extends StatefulWidget {
//   const Counter({super.key});
//   @override
//   State createState() => _CounterState();
// }

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ToDoAppState();
  }
}

class _ToDoAppState extends State {
  TextEditingController txtController = TextEditingController();
  ValueNotifier<List<String>> todos = ValueNotifier(<String>[]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: todos,
          builder: (context, value, child) {
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        child: ValueListenableBuilder(
                          valueListenable: txtController,
                          builder: (context, value, child) {
                            return Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextField(
                                    controller: txtController,
                                    onChanged: (value) {
                                      todos.value.add(value);
                                      print(todos);
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    print(txtController.value.text);
                                  },
                                  child: Text(
                                      "Show Value ${txtController.value.text}"),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ...todos.value.map(
                  (todo) {
                    return Container(
                      child: Row(
                        children: [
                          Text(
                            todo,
                          )
                        ],
                      ),
                    );
                  },
                ).toList(),
              ],
            );
          },
        ),
      ],
    );
  }
}

// class CounterData {
//   static int id = 0;
//   final int index;
//   int counter;

//   CounterData()
//       : index = ++id,
//         counter = 0;

//   void increment() {
//     counter++;
//   }

//   void decrement() {
//     counter--;
//   }
// }

class Counters extends StatelessWidget {
  final ValueNotifier<List<ValueNotifier<int>>> counters = ValueNotifier([]);

  Counters({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          child: Row(
            children: [
              const Text("Counter"),
              ValueListenableBuilder(
                valueListenable: counters,
                builder: (context, value, child) {
                  return CounterBuilder(counters: counters);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
  // Widget build(BuildContext context) {
  //   return ValueListenableBuilder(
  //     valueListenable: counter,
  //     builder: (context, value, _) => Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(
  //           width: 3,
  //           color: const Color.fromRGBO(255, 111, 0, 1),
  //         ),
  //       ),
  //       width: 135,
  //       height: 120,
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             Expanded(child: Text("${counter.value}")),
  //             Row(
  //               children: [
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     counter.value -= 1;
  //                   },
  //                   child: const Icon(Icons.remove),
  //                 ),
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     counter.value += 1;
  //                   },
  //                   child: const Icon(Icons.add),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class CounterBuilder extends StatelessWidget {
  const CounterBuilder({
    super.key,
    required this.counters,
  });

  final ValueNotifier<List<ValueNotifier<int>>> counters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 7,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          ...counters.value.map(
            (counter) {
              return ValueListenableBuilder(
                valueListenable: counter,
                builder: (context, value, _) => Counter(
                  counter: counter,
                ),
              );
            },
          ).toList(),
          ElevatedButton(
            onPressed: () {
              counters.value = [...counters.value, ValueNotifier(1)];
            },
            child: const Text(
              "ADD NEW COUNTER",
            ),
          )
        ],
      ),
    );
    // child: Column(
    //   children: [
    //     ...counters.value.map(
    //       (counter) {
    //         return ValueListenableBuilder(
    //           valueListenable: counter,
    //           builder: (context, value, _) => Counter(
    //             counter: counter,
    //           ),
    //         );
    //       },
    //     ).toList(),
    //     ElevatedButton(
    //       onPressed: () {
    //         counters.value = [...counters.value, ValueNotifier(1)];
    //       },
    //       child: const Text(
    //         "ADD NEW COUNTER",
    //       ),
    //     )
    //   ],
    // ),
  }
}

class Counter extends StatelessWidget {
  final ValueNotifier<int> counter;

  const Counter({
    required this.counter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(255, 111, 0, 1),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                counter.value.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Ink(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      counter.value += 1;
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ),
              Expanded(
                child: Ink(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      counter.value -= 1;
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class XOGame extends StatefulWidget {
  const XOGame({super.key});

  @override
  State createState() => _XOGame();
}

class _XOGame extends State {
  List<List<String>> xoBoard =
      List.generate(3, (index) => List.generate(3, (index) => ""));

  bool isX = true;

  // List<int> squares = [0,1,2,3,4,5,6,7,8,9,10];
  // List<int> squares = List.generate(11, (index) => index * index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: xoBoard
          .map(
            (rows) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rows
                  .map(
                    (row) => InkWell(
                      onTap: () {
                        setState(() {
                          xoBoard[xoBoard.indexOf(rows)][
                                  xoBoard[xoBoard.indexOf(rows)].indexOf(row)] =
                              isX ? "O" : "X";
                          isX = !isX;
                        });
                        print(xoBoard);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(
                            color: Colors.black54,
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            row,
                            style: const TextStyle(
                              fontSize: 75,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

// [
// [, , ],
// [, , ],
// [, , ]
// ]

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State createState() => _HomePageState();
// }

// class _HomePageState extends State {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text("Counter is: ${counter}"),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   counter += 1;
//                 });
//                 print("My counter is: ${counter}");
//               },
//               child: const Text(
//                 "Increase Counter",
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   State createState() => _HomePageState();
// }

// class _HomePageState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Placeholder();
//   }
// }

// class MyApp extends StatelessWidget {
//   int counter = 0;

//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text("Counter is: ${counter}"),
//             ElevatedButton(
//               onPressed: () {
//                 counter += 1;
//                 print("My counter is: ${counter}");
//               },
//               child: const Text(
//                 "Increase Counter",
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// // counter = 1
