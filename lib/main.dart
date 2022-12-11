import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/second_home.dart';
import 'package:flutter_application_1/pages/valo.dart';
import 'package:flutter_application_1/utilities/myRoutes.dart';
import 'package:flutter_application_1/widgets/Themes.dart';
import 'pages/home.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: myTheme.lightTheme(context),
      darkTheme: myTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => myVelocity(),
        myRoutes.homeRoute: (context) => Home(),
        myRoutes.loginRoute: (context) => Login(),
        myRoutes.secondaryHomeRoute: (context) => SecondHome(),
        myRoutes.velocityHome: (context) => myVelocity(),
        myRoutes.cartPage: (context) => CartPage(),
      },
    );
  }
}
