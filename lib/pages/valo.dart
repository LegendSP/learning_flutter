import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/Themes.dart';
import 'package:velocity_x/velocity_x.dart';

class myVelocity extends StatefulWidget {
  const myVelocity({super.key});

  @override
  State<myVelocity> createState() => _myVelocityState();
}

class _myVelocityState extends State<myVelocity> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myHeader(),
              if (Catalog.Items != null && Catalog.Items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }

  void loadJsonData() async {
    await Future.delayed(Duration(seconds: 3));

    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var products = decodedData["products"];

    Catalog.Items =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catalog.Items.length,
      itemBuilder: (context, index) {
        final catalog = Catalog.Items[index];
        return CatalogItem(
          catalog: catalog,
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          myImage(image: catalog.imageUrl),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.make(),
              catalog.description.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    child: "BUY".text.make(),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder()),
                        backgroundColor:
                            MaterialStateProperty.all(myTheme.darkBluishColor)),
                  )
                ],
              ).px4()
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(110).make().py8().expand();
  }
}

class myImage extends StatelessWidget {
  final String image;

  const myImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        .box
        .rounded
        .p4
        .color(myTheme.creamColor)
        .make()
        .p12();
  }
}

class myHeader extends StatelessWidget {
  const myHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Catalog App".text.xl4.color(myTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.color(myTheme.darkBluishColor).make(),
      ],
    );
  }
}
