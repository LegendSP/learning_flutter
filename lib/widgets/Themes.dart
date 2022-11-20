import 'package:flutter/material.dart';

class myTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.red,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.red,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}
