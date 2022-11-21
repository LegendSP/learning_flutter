import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/myRoutes.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://www.cheatsheet.com/wp-content/uploads/2019/06/RDJ-Tony-Stark.jpg";

    return Drawer(
      child: Container(
        color: Colors.redAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                accountEmail: Text("7435954425"),
                accountName: Text("Sanjay Parmar"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
              ),
              iconColor: Colors.white,
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Log Out",
                textScaleFactor: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
