import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
   String locationId;
   String locationName;
   String state;
   String country;

  LocationModel(
      {required this.locationId,
      required this.locationName,
      required this.state,
      required this.country});

  factory LocationModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return LocationModel(
        locationId: snapshot['locationId'],
        locationName: snapshot['locationName'],
        state: snapshot['state'],
        country: snapshot['country']);
  }

  Map<String, dynamic> toJson() => {
        "locationId": locationId,
        "locationName": locationName,
        "state": state,
        "country": country
      };
}
