import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/catalog_details.dart';
import 'package:flutter_application_1/utilities/myRoutes.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.buttonColor,
        onPressed: () {
          Navigator.pushNamed(context, myRoutes.cartPage);
        },
        child: Icon(Icons.shopping_cart_outlined)
            .iconColor(context.theme.canvasColor),
      ).p0(),
      backgroundColor: context.theme.backgroundColor,
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
                CircularProgressIndicator().centered().expand()
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
        final catalog = Catalog.getByPosition(index);
        return InkWell(
          splashColor: myTheme.creamColor,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatalogDetail(catalog: catalog),
                ));
          },
          child: CatalogItem(
            catalog: catalog,
          ),
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
          Hero(tag: catalog.id, child: myImage(image: catalog.imageUrl)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.color(Theme.of(context).buttonColor).lg.make(),
              catalog.description.text.color(context.theme.buttonColor).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}"
                      .text
                      .xl
                      .color(context.theme.buttonColor)
                      .make(),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Buying")));
                    },
                    child: "BUY".text.color(context.theme.canvasColor).make(),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder()),
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor)),
                  )
                ],
              ).px4()
            ],
          ))
        ],
      ),
    )
        .color(context.theme.cardColor)
        .roundedLg
        .square(110)
        .make()
        .py8()
        .expand();
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
        .color(context.theme.canvasColor)
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
        "Catalog App".text.xl4.color(context.theme.buttonColor).make(),
        "Trending Products".text.xl2.color(context.theme.buttonColor).make(),
      ],
    );
  }
}
