import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  final String vendorID;
  final String vendorName;
  final String firmName;
  final String description;
  final String address;
  final String departmentID;
  final String primaryContact;
  final String PAN;
  final String GST;

  VendorModel(
      {required this.vendorID,
      required this.vendorName,
      required this.firmName,
      required this.description,
      required this.address,
      required this.departmentID,
      required this.primaryContact,
      required this.PAN,
      required this.GST});

  factory VendorModel.fromsnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return VendorModel(
        vendorID: snapshot["vendorID"],
        vendorName: snapshot["vendorName"],
        firmName: snapshot["firmName"],
        description: snapshot["description"],
        address: snapshot["address"],
        departmentID: snapshot["departmentID"],
        primaryContact: snapshot["primaryContact"],
        PAN: snapshot["PAN"],
        GST: snapshot["GST"]);
  }
  Map<String,dynamic> toJson()=>{
    "vendorID":vendorID,
        "vendorName":vendorName,
        "firmName":firmName,
        "description":description,
        "address":address,
        "departmentID":departmentID,
        "primaryContact":primaryContact,
        "PAN":PAN,
        "GST":GST
  };
}
