import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
