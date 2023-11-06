// anonymous routing
// named routing -> name, route
// generated Routes
// navigator with state

import 'package:flutter/material.dart';
import 'package:flutter_day7/api_models/product_class.dart';
import 'package:flutter_day7/components/shop_component.dart';
import 'app_router.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       onGenerateRoute: routeGenerator,
//       initialRoute: "/",
//       // home: HomePage(),
//     );
//   }
// }

// class Book {
//   final int id;
//   final String name;
//   final double price;
//   final String description =
//       "This is just simple text, This is just simple text, This is just simple text, This is just simple text, This is just simple text";

//   Book(this.id, this.name, this.price);
// }

// class MyApp extends StatelessWidget {
//   static List<Book> books = [
//     Book(1, "Zikola's Land", 50),
//     Book(1, "Garteen Rules", 150),
//     Book(1, "Linux 101", 250),
//     Book(1, "Advanced PHP", 500),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Row(
//         children: books
//             .map(
//               (book) => Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       book.name,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       book.price.toString(),
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => BookComponent(book),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "Buy Now",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }

// class BookComponent extends StatelessWidget {
//   final Book book;

//   const BookComponent(this.book, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         decoration: const BoxDecoration(color: Colors.white),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [Text(book.name), Text(book.price.toString())],
//             ),
//             Text(book.description),
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
//     return ShopPage(Product.prods);
//   }

//   Widget buildProductCard() {
//     return SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children:
//               Product.prods.map((product) => ProductCard(product)).toList(),
//         ));
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     onGenerateRoute: routeGenerator,
//     initialRoute: "/",
//   ));
// }

// Make application with 4 pages

// - Home
// - Blog -> Blogs
// - Shop -> products
// - PageGenerator -> pageTitle ( show in appbar ),
//   pageContent (show in middle of the image ) ,
//   pageImage ( show after appbar immediately )

class ToDoItem {
  final String todoText;
  ToDoItem(this.todoText);
}

// class ToDo extends StatefulWidget {
//   const ToDo({super.key});

//   @override
//   State<ToDo> createState() => _ToDo();
// }

// class _ToDo extends State<ToDo> {
//   final List<ToDoItem> todos = <ToDoItem>[];
//   final TextEditingController controller =
//       TextEditingController(text: "todo item");

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 50,
//                 vertical: 20,
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                     color: Colors.black54,
//                     width: 2,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             controller: controller,
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black45,
//                                   width: 3,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         IconButton.filled(
//                           onPressed: () {
//                             setState(() {
//                               todos.add(ToDoItem(controller.text));
//                             });
//                           },
//                           icon: const Icon(Icons.add),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Column(
//                       children: todos
//                           .map(
//                             (item) => Container(
//                               width: 300,
//                               margin: const EdgeInsets.symmetric(
//                                 horizontal: 5,
//                                 vertical: 5,
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 5,
//                                 vertical: 5,
//                               ),
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   width: 2,
//                                   color: Colors.black12,
//                                 ),
//                                 color: Colors.white38,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(item.todoText),
//                                   IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         todos.remove(item);
//                                       });
//                                     },
//                                     icon: const Icon(Icons.delete),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                           .toList(),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _ToDo extends StatefulWidget {
  const _ToDo();
  @override
  State<_ToDo> createState() => ToDo();
}

class ToDoNotifier extends ValueNotifier<List<ToDoItem>> {
  ToDoNotifier(List<ToDoItem> todos) : super(todos);

  void add(ToDoItem item) {
    value.add(item);
    print(value);
  }

  void remove(ToDoItem item) {
    value.remove(item);
    print(value);
  }
}

class ToDo extends State<_ToDo> {
  final TextEditingController controller =
      TextEditingController(text: "todo item");

  final ToDoNotifier todos = ToDoNotifier([]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton.filled(
                          onPressed: () {
                            todos.add(ToDoItem(controller.text));
                            print(todos.value);
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      ValueListenableBuilder(
                          valueListenable: todos,
                          builder: (context, value, _) {
                            return Column(children: [
                              Text("New Data Coming"),
                              ...todos.value
                                  .map(
                                    (item) => Container(
                                      width: 300,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 5,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.black12,
                                        ),
                                        color: Colors.white38,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(item.todoText),
                                          IconButton(
                                            onPressed: () {
                                              todos.remove(item);
                                            },
                                            icon: const Icon(Icons.delete),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ]);
                          })
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _ToDo extends State<ToDo> {
//   final List<ToDoItem> todos = <ToDoItem>[];
//   final TextEditingController controller =
//       TextEditingController(text: "todo item");

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 50,
//                 vertical: 20,
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                     color: Colors.black54,
//                     width: 2,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             controller: controller,
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black45,
//                                   width: 3,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         IconButton.filled(
//                           onPressed: () {
//                             setState(() {
//                               todos.add(ToDoItem(controller.text));
//                             });
//                           },
//                           icon: const Icon(Icons.add),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Column(
//                       children: todos
//                           .map(
//                             (item) => Container(
//                               width: 300,
//                               margin: const EdgeInsets.symmetric(
//                                 horizontal: 5,
//                                 vertical: 5,
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 5,
//                                 vertical: 5,
//                               ),
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   width: 2,
//                                   color: Colors.black12,
//                                 ),
//                                 color: Colors.white38,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(item.todoText),
//                                   IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         todos.remove(item);
//                                       });
//                                     },
//                                     icon: const Icon(Icons.delete),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                           .toList(),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(_ToDo());
}
