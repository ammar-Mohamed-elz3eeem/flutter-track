// import './classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/square_class.dart';

void main() {
  runApp(
    const Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
  
          mainAxisSize: MainAxisSize.min,
          children: [
            MyRow(),
            MyRow(),
            MyRow(),
          ],
        ),
      ),
    ),
  );
}

class MyRow extends StatelessWidget {
  const MyRow({super.key});

  @override
  Widget build(BuildContext build) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Square(),
        Square(),
        Square(),
      ],
    );
  }
}
