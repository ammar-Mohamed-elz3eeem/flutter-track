import 'package:flutter/material.dart';
import 'package:flutter_day7/api_models/product_class.dart';

class ShopPage extends StatelessWidget {
  final List<Product> products;

  const ShopPage(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return buildProductCard();
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue,
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
              Text(product.price.toString())
            ],
          )
        ],
      ),
    );
  }
}
