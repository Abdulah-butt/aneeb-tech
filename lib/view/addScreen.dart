import 'package:aneeb_tech/api/user_sheet_api.dart';
import 'package:aneeb_tech/controller/addScreenController.dart';
import 'package:aneeb_tech/model/record.dart';
import 'package:aneeb_tech/style/mycolors.dart';
import 'package:aneeb_tech/view/navigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aneeb_tech/view/addScreen.dart';
import 'package:get/get.dart';


final _formKey = GlobalKey<FormState>();

class AddScreen extends StatelessWidget {

  var name_txt = new TextEditingController();
  var fatherName_txt = new TextEditingController();
  var gender_txt = new TextEditingController();
  var phone_txt = new TextEditingController();
  var address_txt = new TextEditingController();
  var received_txt = new TextEditingController();
  var pending_txt = new TextEditingController();
  var date_txt = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Aneeb Tech House"),
          centerTitle: true,
          backgroundColor: Color(appBarColor),
        ),

        drawer: NavigationBar(),
        body: new ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: new Text("Insert Record",
                style: new TextStyle(fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),)),
            ),
            Center(
              child: Container(
                padding: new EdgeInsets.all(30),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Color(containerColor),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: new Form(
                    key: _formKey,
                    child: new Column(
                      children: <Widget>[
                        CustomTextFormField(name_txt, "Full Name", "Full Name"),
                        CustomTextFormField(
                            fatherName_txt, "Father Name", "Father Name"),
                        CustomTextFormField(gender_txt, "Gender", "Gender"),
                        CustomTextFormField(phone_txt, "Phone No", "Phone No"),
                        CustomTextFormField(address_txt, "Address", "Address"),
                        CustomTextFormField(
                            received_txt, "Received Amount", "Received Amount"),
                        CustomTextFormField(
                            pending_txt, "Pending Amount", "Pending Amount"),
                        CustomTextFormField(date_txt, "Date", "Date"),
                        SizedBox(height: 30,),
                        ElevatedButton.icon(onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final record=new Record(name_txt.text, fatherName_txt.text, gender_txt.text,
                                phone_txt.text, address_txt.text, received_txt.text, pending_txt.text, date_txt.text);
                            Get.snackbar('Please wait.....','',backgroundColor: Colors.orange,);
                            await UserSheetAPI.insert([record.toMap()]);
                            Get.snackbar('Uploaded Successfully','',backgroundColor: Colors.green);
                          }
                        },
                          label: new Text("Add Record"),
                          icon:Icon(Icons.person_add),
                        )
                      ],
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget CustomTextFormField(TextEditingController _controller, String _label,
      String _validation) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: _label,
      ),
      validator: (value) => value != "" ? null : "Pleaase Fill ${_validation}",
    );
  }






}


