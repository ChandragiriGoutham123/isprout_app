import 'package:basic_app/models/center_model.dart';
import 'package:basic_app/models/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Crud {
  static createCenter(CenterModel center) async {
    final centerCollection = FirebaseFirestore.instance.collection("Centers");
    final docRef = centerCollection.doc();

    final newCenter = CenterModel(
        name: center.name,
        floors: center.floors,
        area: center.area,
        parking: center.parking
    ).toJson();
    try {
      await docRef.set(newCenter);
    } catch (e) {
      print('Some error occured $e');
    }
  }

  static Stream<List<CenterModel>> readCenter() {
    final centerCollection = FirebaseFirestore.instance.collection("Centers");
    return centerCollection.snapshots().map((querysnapshot) =>
        querysnapshot.docs.map((e) => CenterModel.fromSnapshot(e)).toList());
  }

  static createLocation(LocationModel location) async{
    final locationCollection = FirebaseFirestore.instance.collection(
        "Locations");
    final docRef = locationCollection.doc();

    final newLocation = LocationModel(locationId: location.locationId,
        locationName: location.locationName,
        state: location.state,
        country: location.country).toJson();
    try {
      await docRef.set(newLocation);
    } catch (e) {
      print('Some error occured $e');
    }
  }
  static Stream<List<LocationModel>> readLocation() {
    final locationCollection = FirebaseFirestore.instance.collection("Locations");
    return locationCollection.snapshots().map((querysnapshot) =>
        querysnapshot.docs.map((e) => LocationModel.fromSnapshot(e)).toList());
  }
  }
