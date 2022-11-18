import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/myRoutes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "images/login_img.png",
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Welcome to our first app",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter username", labelText: "Username"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, myRoutes.homeRoute);
            },
            child: Text(
              "Login",
            ),
            style: TextButton.styleFrom(minimumSize: Size(175, 40)),
          )
        ],
      ),
    ));
  }
}
