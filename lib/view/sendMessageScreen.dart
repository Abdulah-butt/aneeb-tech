import 'package:aneeb_tech/api/user_sheet_api.dart';
import 'package:aneeb_tech/controller/sendMessageController.dart';
import 'package:aneeb_tech/model/record.dart';
import 'package:aneeb_tech/style/mycolors.dart';
import 'package:aneeb_tech/view/navigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: NavigationBar(),
        appBar: new AppBar(
          title: new Text("Aneeb Tech House"),
          centerTitle: true,
          backgroundColor: Color(appBarColor),
        ),
        body: Center(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: Container(
                  padding: new EdgeInsets.all(30),
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Color(containerColor),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: FutureBuilder(
                      future: UserSheetAPI.getPending(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              new Text(
                                "Pending Payments",
                                textAlign: TextAlign.center,
                                style: new TextStyle(fontSize: 28),
                              ),
                              ListTile(
                                leading: Icon(Icons.people_sharp),
                                title: new Text("${Record.pendingRecords!.length}"),
                              ),
                              ListTile(
                                leading: Icon(Icons.send_rounded),
                                title: new Text("Send Messages"),
                                onTap: () {
                                  Get.defaultDialog(
                                      backgroundColor: Colors.orangeAccent,
                                      titleStyle: TextStyle(color: Colors.black),
                                      middleTextStyle: TextStyle(color: Colors.white),
                                      textConfirm: "Confirm",
                                      textCancel: "Cancel",
                                      cancelTextColor: Colors.white,
                                      confirmTextColor: Colors.white,
                                      buttonColor: Colors.green,
                                      barrierDismissible: false,
                                      radius: 50,
                                      content: Column(
                                        children: [
                                          Container(
                                              child: Text(
                                                  "Do you really want to start sending message?")),
                                        ],
                                      ),
                                      onConfirm: () async {
                                        Navigator.pop(context);
                                        Get.snackbar("Sending Messages.......", "please wait :) ", backgroundColor: Colors.orangeAccent);
                                        bool result=await SendMessageController.sendMessages();
                                        if(result==true){
                                          Get.snackbar("Sent to all Successfully" ,"", backgroundColor: Colors.green);
                                        }
                                      });
                                },
                              ),
                            ],
                          );
                        }else{
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
