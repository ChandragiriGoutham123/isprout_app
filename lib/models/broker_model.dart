import 'package:cloud_firestore/cloud_firestore.dart';

class BrokerModel {
  String brokerID;
  String name;
  String image;
  String brokerFirmID;
  String locationID;
  String position;
  String department;
  String phoneNumber;

  BrokerModel(
      {required this.brokerID,
      required this.name,
      required this.image,
      required this.brokerFirmID,
      required this.locationID,
      required this.position,
      required this.department,
      required this.phoneNumber});

  factory BrokerModel.fromsnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return BrokerModel(
        brokerID: snapshot["BrokerId"],
        name: snapshot["Name"],
        image: snapshot["Image"],
        brokerFirmID: snapshot["BrokerFirmId"],
        locationID: snapshot["LocationId"],
        position: snapshot["Position"],
        department: snapshot["Department"],
        phoneNumber: snapshot["PhoneNumber"]);
  }
  Map<String,dynamic> toJson()=>{
    "BrokerId":brokerID,
        "Name":name,
        "Image":image,
        "BrokerFirmId":brokerFirmID,
        "LocationId":locationID,
        "Position":position,
        "Department":department,
        "PhoneNumber":phoneNumber
  };
}
