import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/location_model.dart';

class LocationDao {
  final CollectionReference _locationsCollection =
      FirebaseFirestore.instance.collection('Locations');

  Future<void> saveLocation(LocationModel location) {
    return _locationsCollection.doc(location.locationId).set(location.toJson());
  }

  Future<LocationModel> getLocation(String locationId) async {
    return LocationModel.fromSnapshot(
        await _locationsCollection.doc(locationId).get());
  }

  Stream<List<LocationModel>> getLocations() {
    return _locationsCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => LocationModel.fromSnapshot(doc)).toList());
  }
}
