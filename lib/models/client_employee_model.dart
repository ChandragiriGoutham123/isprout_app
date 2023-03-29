import 'package:cloud_firestore/cloud_firestore.dart';

class ClientEmployeeModel {
  final String clientEMPID;
  final String clientEMPName;
  final String contactNo;
  final String mailID;
  final String clientID;
  final String position;
  final String gender;


  ClientEmployeeModel(
      {required this.clientEMPID,
      required this.clientEMPName,
      required this.contactNo,
      required this.mailID,
      required this.clientID,
      required this.position,
      required this.gender,
});

  factory ClientEmployeeModel.fromSnapShot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ClientEmployeeModel(
        clientEMPID: snapshot["clientEMPID"],
        clientEMPName: snapshot["clientEMPName"],
        contactNo: snapshot["contactNo"],
        mailID: snapshot["mailID"],
        clientID: snapshot["clientID"],
        position: snapshot["position"],
        gender: snapshot["gender"],
);
  }

  Map<String, dynamic> toJson() => {
        "clientEMPID": clientEMPID,
        "clientEMPName": clientEMPName,
        "contactNo": contactNo,
        "mailID": mailID,
        "clientID": clientID,
        "position": position,
        "gender": gender,

      };
}
