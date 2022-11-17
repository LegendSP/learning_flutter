import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Text(
        "Login Page",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
          fontSize: 14,
        ),
        textScaleFactor: 2.0,
      )),
    );
  }
}
