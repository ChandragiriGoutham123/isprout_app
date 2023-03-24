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
        centerId:snapshot["Id"],
      centerName: snapshot["name"],
      buildingName: snapshot["buildingName"],
      locationId: snapshot["locationId"],
      address: snapshot["Address"],
      pincode: snapshot["pincode"],
      area: snapshot["area"],
      efficiency:snapshot["efficiency"],
      numberOfFloors: snapshot["number of floors"],
      landLineNumber: snapshot["landlineNumber"],
      numberOfCarParking: snapshot["number of car parking"],
      numberOfBikeParking: snapshot["number of Bike Parking"],
      contactName: snapshot["contactName"],
      contactNumber: snapshot["contactNumber"],
      startTime: snapshot["start time"],
      endTime: snapshot["end time"]


    );
  }

  Map<String, dynamic> toJson() =>
      {
        "Id":centerId,
        "name":centerName,
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
