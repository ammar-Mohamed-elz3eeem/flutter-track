import 'package:flutter/material.dart';
import 'package:flutter_day7/api_models/product_class.dart';

class HomePage extends StatelessWidget {
  final Object? pageInfo;
  const HomePage(
    this.pageInfo, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageInfo = this.pageInfo as Map? ?? {};
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.black12),
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
              icon: Icon(Icons.menu_rounded),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/about");
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/products",
                    arguments: Product.prods);
              },
              icon: Icon(Icons.account_balance_rounded),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/gallery");
              },
              icon: Icon(Icons.account_circle_rounded),
            ),
          ],
        ),
      ),
      body: Container(
        child: Text(
          pageInfo['description'] ?? "",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
        ),
      ),
      appBar: AppBar(title: Text(pageInfo["title"] ?? "Entry Page")),
    );
  }
}
