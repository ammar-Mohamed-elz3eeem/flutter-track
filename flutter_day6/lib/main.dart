import 'package:flutter/material.dart';
import 'package:flutter_day6/api_models/product_class.dart';

// cd .\path\to\folder
// flutter create .\<FLUTTER_PROJECT_FOLDER>
// cd .\<FLUTTER_PROJECT_FOLDER>
// flutter run

// UI using Column, Row, Container
// UI using Padding, Expanded
// Maping object to return UI Widget

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final Map ButtonIcons = {
//     "call": const Icon(Icons.phone, color: Colors.blue),
//     "route": const Icon(Icons.route, color: Colors.blue),
//     "share": const Icon(Icons.share, color: Colors.blue),
//   };

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: [
//             Image.asset(
//               "images/logo.png",
//               height: 300,
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Oeschinen Lake Campground",
//                           style: TextStyle(
//                               color: Colors.black, fontWeight: FontWeight.w700),
//                           textAlign: TextAlign.left,
//                         ),
//                         Text("Alexandria, Egypt",
//                             style: TextStyle(color: Colors.black38),
//                             textAlign: TextAlign.left),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.star,
//                         color: Color.fromRGBO(255, 143, 0, 1),
//                       ),
//                       Text("41")
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: ButtonIcons.keys.map((key) {
//                 return Column(
//                   children: [
//                     ButtonIcons[key],
//                     Text(
//                       key.toUpperCase(),
//                       style: const TextStyle(color: Colors.blue),
//                     )
//                   ],
//                 );
//               }).toList(),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: const Text(
//                 "Lorem Ipsum is just simple text, Lorem Ipsum is just simple text, Lorem Ipsum is just simple text, Lorem Ipsum is just simple text, Lorem Ipsum is just simple text, Lorem Ipsum is just simple text, Lorem Ipsum is just simple text",
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(HomePage());
// }

List<Widget> buildProductsSection() {
  return Product.prods.map((product) => ProductCard(product)).toList();
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
          Image.asset(
            product.image_path,
            width: 200,
            height: 100,
          ),
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

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Image.asset(
//           "images/logo.png",
//           width: 25,
//           height: 25,
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [...buildProductsSection()],
//         ),
//       ),
//     ),
//   ));
// }

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: buildProductsSection(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Home Page"),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/products");
            },
            child: const Text(
              "Go To Shop",
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    routes: {
      "/products": (BuildContext context) => ShopPage(),
      "/": (BuildContext context) => HomePage(),
    },
    initialRoute: "/",
  ));
}
