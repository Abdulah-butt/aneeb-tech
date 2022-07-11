import 'package:aneeb_tech/model/customer.dart';
import 'package:aneeb_tech/model/record.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetAPI{
  static const _credential=r'''
  {
  "type": "service_account",
  "project_id": "gsheets-326016",
  "private_key_id": "374571af0d09efde5e4a1b76cc2942011e0c504a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEugIBADANBgkqhkiG9w0BAQEFAASCBKQwggSgAgEAAoIBAQCdSDObs8n1LfDp\ng++6eBDwOAceddnWVU28jbz0yPbCrZHOs/D9e5umFYLq0047KdLzkdGr6/ETm/6j\nndNLVnBrzPZBXuLtsxT18yIh1+H+Un2hCaAn3/X9p9Pu5NRI3j7udS+yKgjkv6rr\n0vY3IIs7RyLwUufDv7wiLuJPCmAKKucFcGUopgVo9IdFGNwEePsVTceZIFHWAyOU\nkaxJt6LaCEWbUM0tUfWsaCVJ+LfPeQatEp1g8XgxFsdqtv1RsHAxU/KuFnwo3P7+\nx3VybRAWhKh07ehgnv6F2vuQfYTZ1K4BMxVce1biibzejlTrr7J4Y1zlYs6UICSd\ng7Hfza/NAgMBAAECgf9KzMu+gQLLV837QIQCapejpwG7utCe3nLZ+Y6j2+9/Jozx\ngSJbay3bDt/0TgommP16WR8eZFeCu+2eYrDaY4GTwyZacIX8Be8yCS9yaPlRummE\n7M7+J8UVnXttYeaTwR6syY6lbNhN8dmXzfzKuu98gZhcMxGGRulyWFnIvWZvbrj8\nR2xMQ860QZNkmji5SUw1mDbhp9rgqJHbOzZFDEiev5MkM2PFf0lwvYNo+LJxtrrY\nZVgl6UM7jkU0w0Q1DQn/vRAzXvBOJ3eB9DHc2iD7c3gc5Ks9S7PU2woMcV716NVL\ns5A/zFRFv7jjbtnworGuj6oxRi+qkiuiR/0IuJECgYEAzvK+O5smW3NrHnjlrPdU\niRyB+gbNrXSlCLJocjoSGFKb7xtlliDALuUVRSECXgM0eH/L1xi/SL3PiiQgQief\n+SszyB70T/WHMX6UuJJjQM5BDB1yAZ3nMQRq2yhD/Q6vt2otjj6ef5GdzNrkQzuS\nHN6zT9+RmpB7geyLNGln2P0CgYEAwo/NKeqsH8YXzWmGhibiKn19o5GLcVIYTVD4\nMiyJkYju0bzXsyo+mS0+/2JKwg6wehPHsKMf+YeiswAUbGCXkbpfHYuXoQ3RSb5k\nxrkKWmgpbfLYWiDjB5ZXsSrCX4Uqp07uscys1yroy3RbPZXcHqhlM+oVy4gYoChm\nGOw7kxECgYBJ9D0/F8axT6GsFhAdq5UuGl3od53wqop/fSIOD+p/fqXy4JuA9ts2\n5u6e8Zji98o8dY7moxVYbVxJRXexrG9in6m1jjpIiLlzWoTTIJ0Pf6WHKs6e/Uqt\nHaMCBnWlbSYmKW92MbJ6bBM0LdT8ocEpR/xUQtTJo3A/kcR9Sl2uEQKBgAh0d1X6\n/L/ku+QRUedCiVGPYoZZLNYf2y6A9kg350KL0NUMf9MpYs8FSFeQze7g9IpZkbP7\nYshVPJzKxBhxmiSbFMcT6eL11sJ9o6N/JxQGssY0Z3KDO1p5DhaE5S2Be/kJVRYk\n7t3q33L3+38RpB8w8jTvV0MhBvDu0IEEwxIBAoGAXVRNtoGFVFaZhbaku6/MtOV3\nSZ9K623KxNbp6jaoUWdORLdiiY5CjMfY1RltyUDXoiPIz3GXrovmgGCbeATxueqo\nKRPa9PNptruIXWiHw625OjuHjvoteCbKHWMb3gJWrKYuuCTAQg6+Auv9zNZDvFta\n3cu+ggmB6nizoC4vcvc=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-326016.iam.gserviceaccount.com",
  "client_id": "114397242314261408259",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-326016.iam.gserviceaccount.com"
}

  ''';
  static final _spreadsheetid='1YIlAZegiDgeXzrsygyFbsf69gZ4vhHnd0UWtXywnJ9M';
  static final _gsheet=GSheets(_credential);
  static Worksheet? _usersheet;

  static Future init() async{
    try {
      final spreadsheet = await _gsheet.spreadsheet(_spreadsheetid);
      _usersheet = await _getWorksheet(spreadsheet, title: "USERS");
      final first_row = Customer.getFields();
      _usersheet!.values.insertRow(1, first_row);
    }catch(e){
      print(e);
    }
  }

  static Future<Worksheet> _getWorksheet(Spreadsheet spreadsheet, {required String title}) async{
    try {
      return await spreadsheet.addWorksheet(title);
    }catch (e){
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<void> insert(List<Map<String, dynamic>> list) async {
   await  _usersheet!.values.map.appendRows(list);
  }

  static Future<Record?> getbyName(String name) async{
    if(_usersheet==null) return null;
    final map=await _usersheet!.values.map.rowByKey(name,fromColumn: 1);
    return Record.toObject(map);

  }

  static Future<List<Record?>?> getAll() async{
    Record.records!.clear();
    if(_usersheet==null) return null;
    final customers=await _usersheet!.values.map.allRows();
     for(int i=0;i<customers!.length;i++){
       Record.records!.add(Record.toObject(customers[i]));
    }
    return  Record.records;
  }

  static Future<List<Record?>?> getPending() async{
    Record.pendingRecords!.clear();
    if(_usersheet==null) return null;
    final customers=await _usersheet!.values.map.allRows();
    for(int i=0;i<customers!.length;i++){
      if(int.parse(Record.toObject(customers[i]).pending!)>0){
        print("pending  $i");
        Record.pendingRecords!.add(Record.toObject(customers[i]));
      }
    }
    return Record.pendingRecords;
  }





}