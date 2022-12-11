import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class myTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.red,
      cardColor: creamColor,
      accentColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          textTheme: Theme.of(context).textTheme,
          elevation: 0.0,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black)));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      accentColor: darkCreamColor,
      buttonColor: lightBluishColor,
      backgroundColor: darkCreamColor,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          textTheme: Theme.of(context).textTheme,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white)));

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color darkCreamColor = Color.fromARGB(255, 77, 77, 77);
  static Color lightBluishColor = Color.fromARGB(255, 220, 220, 220);
}
