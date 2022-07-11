import 'package:aneeb_tech/model/customer.dart';

class Record{
   String? name;
   String? fatherName;
   String? gender;
   String? phoneNo;
   String? address;
   String? received;
   String? pending;
   String? date;

   Record(this.name, this.fatherName, this.gender, this.phoneNo, this.address,
      this.received, this.pending, this.date);


    Map<String,dynamic> toMap(){
      return {
        Customer.name:name,
        Customer.fatherName:fatherName,
        Customer.gender:gender,
        Customer.phoneNo:phoneNo,
        Customer.address:address,
        Customer.received:received,
        Customer.pending:pending,
        Customer.date:date
      };
   }

  static List<Record?>?  records=[];
  static List<Record?>?  pendingRecords=[];

   static Record toObject(Map<String, String>? map) {
      return Record(
          map![Customer.name],
          map[Customer.fatherName],
          map[Customer.gender],
          map[Customer.phoneNo],
          map[Customer.address],
          map[Customer.received],
          map[Customer.pending],
          map[Customer.date]
      );
  }
}