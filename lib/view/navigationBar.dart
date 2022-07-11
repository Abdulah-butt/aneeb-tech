import 'package:aneeb_tech/style/mycolors.dart';
import 'package:aneeb_tech/view/addScreen.dart';
import 'package:aneeb_tech/view/home.dart';
import 'package:aneeb_tech/view/myApp.dart';
import 'package:aneeb_tech/view/sendMessageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
        child: Column(

      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: new Text("Aneeb ur Rehman"),
          accountEmail: new Text("+92 341 3732356"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                'images/hibba.jpeg',
                fit: BoxFit.cover,
                height: 90,
                width: 90,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(appBarColor),
            image: DecorationImage(
                image: AssetImage('images/cover.jfif'),
                fit: BoxFit.fill),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: new Text("Home"),
          onTap: () {
            Get.offAll(() => MyApp());
          },
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: new Text("Insert Record"),
          onTap: () {
            Get.offAll(() => AddScreen());
          },
        ),
        ListTile(
          leading: Icon(Icons.send_rounded),
          title: new Text("Send Messages"),
          onTap: () {
            Get.offAll(() => SendMessageScreen());
          },
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: new Text("About Us"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: new Text("Exist"),
          onTap: () {},
        ),
        Expanded(child: Align(alignment: Alignment.bottomLeft,child: new Text("Developed By : Abdullah Butt"))),
      ],
    ));
  }
}
