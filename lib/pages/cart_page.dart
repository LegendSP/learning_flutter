import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/Themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.creamColor,
      appBar: AppBar(
        title: "Cart Page".text.color(context.theme.canvasColor).make(),
        backgroundColor: context.theme.cardColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1.5,
      ),
    );
  }
}
