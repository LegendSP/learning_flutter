import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utilities/myRoutes.dart';
import 'pages/home.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Login(),
        myRoutes.homeRoute: (context) => Home(),
        myRoutes.loginRoute: (context) => Login(),
      },
    );
  }
}
