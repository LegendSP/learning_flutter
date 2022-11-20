import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, ((index) => Catalog.Items[0]));

    return Scaffold(
      appBar: AppBar(
        title: Text("Sanjay Parmar"),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummyList[index],
          );
        },
      )),
      drawer: myDrawer(),
    );
  }
}
