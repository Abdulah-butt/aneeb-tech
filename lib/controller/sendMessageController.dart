import 'package:aneeb_tech/model/record.dart';
import 'package:telephony/telephony.dart';
class SendMessageController{
  static Telephony telephony = Telephony.instance;



  static Future<bool> sendMessages() async{
    try {

      for (int i = 0; i < Record.pendingRecords!.length; i++) {
        String msg = "Hello ${Record.pendingRecords![i]!.name},\nPlease Submit your remaining amount of ${Record.pendingRecords![i]!.pending} Rs\nRegards: Aneeb ur rehman ";
        String no= "${Record.pendingRecords![i]!.phoneNo}";
        var bool = await SendMsg("+$no",msg);
      }

      return true;
    }catch(e){
      return false;
    }
  }


  static Future<bool> SendMsg(String no,String msg) async {
    int x=0;
    await telephony.sendSms(to:no, message:msg,
        statusListener: (SendStatus status) {
          if (status == SendStatus.DELIVERED) {
            print("delivered to $no");
          }
        }
    );
    print("Sent to ${no}");
    return true;
  }
}

