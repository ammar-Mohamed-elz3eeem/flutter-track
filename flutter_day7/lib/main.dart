// anonymous routing
// named routing -> name, route
// generated Routes
// navigator with state

import 'package:flutter/material.dart';
import 'app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: routeGenerator,
      initialRoute: "/",
      // home: HomePage(),
    );
  }
}

void main() {
  runApp(const MyApp());
}

// Make application with 4 pages

// - Home
// - Blog -> Blogs
// - Shop -> products
// - PageGenerator -> pageTitle ( show in appbar ), 
//   pageContent (show in middle of the image ) , 
//   pageImage ( show after appbar immediately )
