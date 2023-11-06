import 'package:final_week1_task/classes/file_db_class.dart';
import 'package:final_week1_task/classes/review_class.dart';

class Product extends FileDB {
  final String id = FileDB.id;
  String name;
  double price;
  int itemsInStock = 0;
  List reviews = <Review>[];

  Product(this.name, this.price) : super("product.json") {
    reload();
    add(toMap());
  }

  void updateUser(Map updates) {
    updates.forEach((key, value) {
      switch (key) {
        case 'name':
          name = value;
          break;
        case 'price':
          price = value;
          break;
        case 'itemsInStock':
          itemsInStock = value;
          break;
        case 'reviews':
          reviews = value;
          break;
        case _:
          throw AssertionError("The $key is not valid user data");
      }
    });
  }

  Map toMap() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "itemsInStock": itemsInStock,
      "reviews": reviews,
    };
  }
}
