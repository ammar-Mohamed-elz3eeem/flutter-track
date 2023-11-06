import 'package:flutter/material.dart';
import 'package:flutter_day9/models/category.model.dart';
import 'package:flutter_day9/screens/players_screen.dart';

class HomePage extends StatelessWidget {
  final List<Category> categories;

  const HomePage(this.categories, {super.key});

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("اختار القسم"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: CategoryBuilder(categories),
          ),
        ),
      ],
    );
  }
}

class CategoryBuilder extends StatelessWidget {
  final List<Category> categories;

  const CategoryBuilder(
    this.categories, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          if (categories[index].childern.isNotEmpty) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return HomePage(categories[index].childern);
              },
            ));
          } else {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Players(categories[index]);
              },
            ));
          }
        },
        child: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.green, Colors.greenAccent])),
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(categories[index].catIcon),
              Text(
                categories[index].name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
