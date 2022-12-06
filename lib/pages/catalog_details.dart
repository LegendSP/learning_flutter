import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/Themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/catalog.dart';

class CatalogDetail extends StatelessWidget {
  final Item catalog;

  const CatalogDetail({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: myTheme.creamColor,
        child: VxArc(
          height: 15,
          edge: VxEdge.TOP,
          child: Container(
            color: Colors.white,
            child: Hero(
              tag: "heroButtonBar",
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.xl.bold.make(),
                  ElevatedButton(
                    onPressed: (() {}),
                    child: "BUY".text.make(),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder())),
                  ).wh(100, 40)
                ],
              ).p16(),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: "Catalog Detail Page".text.make(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(tag: catalog.id, child: Image.asset(catalog.imageUrl))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 20,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: myTheme.creamColor,
                child: Column(
                  children: [
                    catalog.name.text.bold
                        .color(myTheme.darkBluishColor)
                        .xl4
                        .make(),
                    10.heightBox,
                    catalog.description.text.xl2
                        .textStyle(context.captionStyle)
                        .make()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
