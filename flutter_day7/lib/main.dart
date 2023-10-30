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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShopPage(Product.prods);
  }

  Widget buildProductCard() {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:
              Product.prods.map((product) => ProductCard(product)).toList(),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    onGenerateRoute: routeGenerator,
    initialRoute: "/",
  ));
}

// Make application with 4 pages

// - Home
// - Blog -> Blogs
// - Shop -> products
// - PageGenerator -> pageTitle ( show in appbar ),
//   pageContent (show in middle of the image ) ,
//   pageImage ( show after appbar immediately )
