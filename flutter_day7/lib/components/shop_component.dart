import 'package:flutter/material.dart';
import 'package:flutter_day7/api_models/product_class.dart';

class ShopPage extends StatelessWidget {
  final List<Product> products;

  const ShopPage(this.products, {super.key});

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
      body: buildProductCard(),
    );
  }

  Widget buildProductCard() {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: products.map((product) => ProductCard(product)).toList(),
        ));
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(product.name),
                    Text(product.items_in_stock.toString())
                  ],
                ),
                Text(product.price.toString()),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ProductDetails(product: product),
                    //   ),
                    // );
                    Navigator.pushNamed(context, "/product-details",
                        arguments: product);
                  },
                  child: const Text("View Details"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    product.image_path,
                    width: 400,
                  ),
                  Column(
                    children: [
                      Text(
                        product.name,
                      ),
                      Text(
                        "Items in Stock: ${product.items_in_stock}",
                      ),
                      Text(
                        "\$${product.price}",
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
