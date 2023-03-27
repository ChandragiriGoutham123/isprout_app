import 'package:cloud_firestore/cloud_firestore.dart';
class CenterModel {
  final String centerId;
  final String centerName;
  final String buildingName;
  final String locationId;
  final String address;
  final String pincode;
  final String area;
  final String efficiency;
  final String numberOfFloors;
  final String landLineNumber;
  final String numberOfCarParking;
  final String numberOfBikeParking;
  final String contactName;
  final String contactNumber;
  final String startTime;
  final String endTime;

  CenterModel(
      {required this.centerId,
      required this.centerName,
      required this.buildingName,
      required this.locationId,
      required this.address,
      required this.pincode,
      required this.area,
      required this.efficiency,
      required this.numberOfFloors,
      required this.landLineNumber,
      required this.numberOfCarParking,
      required this.numberOfBikeParking,
      required this.contactName,
      required this.contactNumber,
      required this.startTime,
      required this.endTime});

  factory CenterModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CenterModel(
        centerId:snapshot["centerId"],
      centerName: snapshot["centerName"],
      buildingName: snapshot["buildingName"],
      locationId: snapshot["locationId"],
      address: snapshot["address"],
      pincode: snapshot["pincode"],
      area: snapshot["area"],
      efficiency:snapshot["efficiency"],
      numberOfFloors: snapshot["numberOfFloors"],
      landLineNumber: snapshot["landLineNumber"],
      numberOfCarParking: snapshot["numberOfCarParking"],
      numberOfBikeParking: snapshot["numberOfBikeParking"],
      contactName: snapshot["contactName"],
      contactNumber: snapshot["contactNumber"],
      startTime: snapshot["startTime"],
      endTime: snapshot["endTime"]


    );
  }

  Map<String, dynamic> toJson() =>
      {
        "centerId":centerId,
        "centerName":centerName,
        "buildingName":buildingName,
        "locationId":locationId,
        "address":address,
        "pincode":pincode,
        "area":area,
        "efficiency":efficiency,
        "numberOfFloors":numberOfFloors,
        "landLineNumber":landLineNumber,
        "numberOfCarParking":numberOfCarParking,
        "numberOfBikeParking":numberOfBikeParking,
        "contactName":contactName,
        "contactNumber":contactNumber,
        "startTime":startTime,
        "endTime":endTime
      };
}
