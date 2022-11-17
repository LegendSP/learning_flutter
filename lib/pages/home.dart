import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sanjay Parmar"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to my first flutter app"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
