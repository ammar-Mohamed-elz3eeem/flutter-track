import 'package:flutter/material.dart';
import 'package:flutter_day7/api_models/product_class.dart';

class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/", arguments: {
                  "title": "Home Page",
                  "description": "Welcome to our website"
                });
              },
              icon: const Icon(Icons.menu_rounded),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/about");
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/products",
                    arguments: Product.prods);
              },
              icon: const Icon(Icons.account_balance_rounded),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/gallery");
              },
              icon: const Icon(Icons.account_circle_rounded),
            ),
          ],
        ),
      ),
      body: const Center(child: Text("Sorry we can't find this page")),
    );
  }
}
