import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    primaryColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
  );
}
