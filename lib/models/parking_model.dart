import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingModel {
  String parkingLotID;
  String floor;
  String carOrBike;
  String type;
  String centreId;
  bool available;
  String costToCompany;

  ParkingModel(
      {required this.parkingLotID,
      required this.floor,
      required this.carOrBike,
      required this.type,
      required this.centreId,
      required this.available,
      required this.costToCompany});

  factory ParkingModel.fromsnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ParkingModel(
        parkingLotID: snapshot["parkingLotID"],
        floor: snapshot["floor"],
        carOrBike: snapshot["carOrBike"],
        type: snapshot["type"],
        centreId: snapshot["centreId"],
        available: snapshot["available"],
        costToCompany: snapshot["costToCompany"]);
  }

  Map<String, dynamic> toJson() => {
        "parkingLotID": parkingLotID,
        "floor": floor,
        "carOrBike": carOrBike,
        "type": type,
        "centreId": centreId,
        "available": available,
        "costToCompany": costToCompany
      };
}
