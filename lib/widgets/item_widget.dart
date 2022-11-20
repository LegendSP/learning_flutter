import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      shadowColor: Colors.red,
      child: InkWell(
        splashColor: Colors.redAccent,
        onTap: () {},
        child: ListTile(
          leading: Image.asset(item.imageUrl),
          title: Text(
            item.name,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            item.description,
            style: TextStyle(color: Colors.redAccent),
          ),
          trailing: Text(
            "\$${item.price}",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
