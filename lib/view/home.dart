import 'package:aneeb_tech/api/user_sheet_api.dart';
import 'package:aneeb_tech/model/record.dart';
import 'package:aneeb_tech/style/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  var _search_txt = new TextEditingController();
  List<Record?>? records;


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            new Container(
              height: size.height * 0.15,
              decoration: BoxDecoration(
                  color: Color(containerColor),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  border: Border.all(color: Colors.black12),
                  image: DecorationImage(
                      image: AssetImage('images/cover.jfif'),
                      fit: BoxFit.fill)),
            ),
            new SizedBox(
              height: 20,
            ),
            // new Container(
            //   height: size.height * 0.07,
            //   width: size.width*0.2,
            //   decoration: BoxDecoration(
            //     color: Color(containerColor),
            //     borderRadius: BorderRadius.circular(20),
            //     border: Border.all(color: Colors.black12),
            //   ),
            //   child: new Row(
            //     children: <Widget>[
            //       new Icon(Icons.search),
            //       Expanded(
            //           child: new TextField(
            //         controller: _search_txt,
            //         decoration: InputDecoration(
            //           labelText: "Enter Name of Customer",
            //         ),
            //       ))
            //     ],
            //   ),
            // ),
            new SizedBox(
              height: 20,
            ),
            new Text(
              "All Record",
              style: new TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            FutureBuilder(
              future: UserSheetAPI.getAll(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: new DataTable(
                      columns: [
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Father Name")),
                        DataColumn(label: Text("Gender")),
                        DataColumn(label: Text("Phone No")),
                        DataColumn(label: Text("Address")),
                        DataColumn(label: Text("Received")),
                        DataColumn(label: Text("Pending")),
                        DataColumn(label: Text("Date")),
                      ],
                      rows: customDataRow(),
                    ),
                  );
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              }
            ),
          ],
        ),
      ),
    );
  }

  void ShowAllRecord() {
    for (int i = 0; i < records!.length; i++) {
      print(i);
      print(
          "NAME : ${records![i]!.name}, Father Name : ${records![i]!.fatherName}, Phone No ${records![i]!.pending}");
    }
  }
}


List<DataRow> customDataRow(){

  List<DataRow> data=[];
  for(int i=0;i<Record.records!.length;i++){
    data.add(
        DataRow(cells: [
          DataCell(Text("${Record.records![i]!.name}")),
          DataCell(Text("${Record.records![i]!.fatherName}")),
          DataCell(Text("${Record.records![i]!.gender}")),
          DataCell(Text("${Record.records![i]!.phoneNo}")),
          DataCell(Text("${Record.records![i]!.address}")),
          DataCell(Text("${Record.records![i]!.received}")),
          DataCell(Text("${Record.records![i]!.pending}")),
          DataCell(Text("${Record.records![i]!.date}"))
        ])
    );
  }

  return data;
}
