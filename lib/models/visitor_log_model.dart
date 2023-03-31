import 'package:cloud_firestore/cloud_firestore.dart';

class AddVisitorLogModel{
  final String visitorId;
  final String visitorName;
  final String companyId;
  final String clientId;
  final String governmentId;
  final String idNumber;
  final DateTime startDateAndTime;
  final DateTime endDateAndTime;
  AddVisitorLogModel({
    required this.visitorId,
    required this.visitorName,
    required this.companyId,
    required this.clientId,
    required this.governmentId,
    required this.idNumber,
    required this.startDateAndTime,
    required this.endDateAndTime,

  });
  factory AddVisitorLogModel.fromSnapshot(DocumentSnapshot con){
    var snapshot = con.data() as Map<String, dynamic>;
    print(snapshot);
    return AddVisitorLogModel(
      visitorId: snapshot['Visitor Id'],
      visitorName: snapshot['Visitor Name'],
      companyId: snapshot['Company Id'],
      clientId: snapshot['Client Id'],
      governmentId: snapshot['Government Id'],
      idNumber: snapshot['Id Number'],
      startDateAndTime: DateTime.fromMillisecondsSinceEpoch(
          snapshot["VisitorStartDate"].millisecondsSinceEpoch),
      endDateAndTime: DateTime.fromMillisecondsSinceEpoch(
          snapshot["VisitorEndDate"].millisecondsSinceEpoch),);
  }
  Map<String,dynamic> toJson()=>{
    "Visitor Id":visitorId,
    "Visitor Name":visitorName,
    "Company Id":companyId,
    "Client Id":clientId,
    "Government Id":governmentId,
    "Id Number":idNumber,
    "VisitorStartDate":startDateAndTime,
    "VisitorEndDate":endDateAndTime,

  };
}