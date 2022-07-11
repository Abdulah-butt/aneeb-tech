import 'package:aneeb_tech/style/mycolors.dart';
import 'package:aneeb_tech/view/home.dart';
import 'package:aneeb_tech/view/navigationBar.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Aneeb Tech House"),
        centerTitle: true,
        backgroundColor: Color(appBarColor),
      ),

      drawer: new NavigationBar(),
      body: Home(),
    );
  }
}
