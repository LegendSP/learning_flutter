import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class SecondHome extends StatefulWidget {
  const SecondHome({super.key});

  @override
  State<SecondHome> createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
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
        title: Text("Secondary Home"),
      ),
      body: Center(
          child: (Catalog.Items != null && Catalog.Items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 10),
                  itemCount: Catalog.Items.length,
                  itemBuilder: ((context, index) {
                    final item = Catalog.Items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          splashColor: Colors.red,
                          onTap: () {},
                          child: GridTile(
                            child: Image.asset(item.imageUrl),
                            header: Text(item.name),
                            footer: Text(item.price),
                          ),
                        ),
                      ),
                    );
                  }))
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
