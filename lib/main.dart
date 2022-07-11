import 'package:aneeb_tech/api/user_sheet_api.dart';
import 'package:aneeb_tech/model/customer.dart';
import 'package:aneeb_tech/model/record.dart';
import 'package:aneeb_tech/view/myApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetAPI.init();
  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text("SMS Sending"),
//       ),
//       body: Center(
//           child: new Column(
//               children: <Widget>[
//               ElevatedButton(onPressed: (){
//                 final user={
//                   Customer.id:'1',
//                   Customer.name:'Abdullah',
//                   Customer.fatherName:'Abdul Mannan Butt',
//                   Customer.phoneNo:'+93401226839',
//                   Customer.address:'Muslim Colony Pasrur'
//                 };
//                 UserSheetAPI.insert([user]);
//               }, child: new Text("Send Message"))
//       ],
//     ),
//     ),
//     );
//   }
//
//
//
//
//  }

//   void sendMessage() async{
//     SmsSender sender = SmsSender();
//     String address = "+923067529424";
//
//      for(int i=0;i<numbers.length;i++) {
//        numbers.add("")
//       SmsMessage message = SmsMessage(numbers[i], 'Hello ${name[i].toUpperCase()},\nI am testing my software.\nThanks');
//       message.onStateChanged.listen((state) {
//         if (state == SmsMessageState.Sent) {
//           print("SMS is sent to ${name[i]}");
//         } else if (state == SmsMessageState.Delivered) {
//           print("SMS is delivered!");
//         }
//       });
//       sender.sendSms(message);
//     }
//   }
//
//


