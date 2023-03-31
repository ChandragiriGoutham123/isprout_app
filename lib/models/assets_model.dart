import 'package:cloud_firestore/cloud_firestore.dart';

class AssetsModel {
  String assetID;
  String assetName;
  String centreID;
  String privateOfficeID;
  String type;
  String description;
  String value;

  AssetsModel(
      {required this.assetID,
      required this.assetName,
      required this.centreID,
      required this.privateOfficeID,
      required this.type,
      required this.description,
      required this.value});

  factory AssetsModel.fromsnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return AssetsModel(
        assetID: snapshot["AssetId"],
        assetName: snapshot["AssetName"],
        centreID: snapshot["CenterId"],
        privateOfficeID: snapshot["PrivateOfficeId"],
        type: snapshot["Type"],
        description: snapshot["Description"],
        value: snapshot["Value"]);
  }

  Map<String, dynamic> toJson() => {
        "AssetId": assetID,
        "AssetName": assetName,
        "CenterId": centreID,
        "PrivateOfficeId": privateOfficeID,
        "Type": type,
        "Description": description,
        "Value": value
      };
}
