import 'package:flutter/material.dart';
import 'package:flutter_day7/api_models/product_class.dart';
import 'components.dart';

Route routeGenerator(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => HomePage(settings.arguments),
      );
    case '/about':
      return MaterialPageRoute(
        builder: (context) => const AboutPage(),
      );
    case '/products':
      return MaterialPageRoute(
        builder: (context) => ShopPage(settings.arguments as List<Product>),
      );
  }
  return MaterialPageRoute(
    builder: (context) => const ErrorPage(),
  );
}
