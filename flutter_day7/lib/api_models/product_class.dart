class Product {
  String name;
  double price;
  int items_in_stock;
  String image_path;

  Product(this.name, this.price, this.items_in_stock, this.image_path);

  static List<Product> prods = [
    Product(
      "Demo Product #1",
      30.00,
      20,
      "images/demo_product1.jpeg",
    ),
    Product(
      "Demo Product #2",
      60.5,
      1000,
      "images/demo_product2.jpeg",
    ),
    Product(
      "Demo Product #3",
      10.75,
      5,
      "images/demo_product3.jpeg",
    ),
    Product(
      "Demo Product #4",
      63.50,
      5,
      "images/demo_product4.jpeg",
    ),
    Product(
      "Demo Product #5",
      12.50,
      5000,
      "images/demo_product5.jpeg",
    ),
    Product(
      "Demo Product #6",
      512.25,
      1,
      "images/demo_product6.jpeg",
    ),
  ];
}
