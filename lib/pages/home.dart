import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sanjay Parmar"),
      ),
      body: Center(
          child: (Catalog.Items != null && Catalog.Items.isNotEmpty)
              ? ListView.builder(
                  itemCount: Catalog.Items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: Catalog.Items[index],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: myDrawer(),
    );
  }

  Future<void> loadJson() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var products = decodedData["products"];

    Catalog.Items =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }
}
