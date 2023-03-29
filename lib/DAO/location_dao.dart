import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/location_model.dart';

class LocationDao{

  final CollectionReference _locationsCollection =
  FirebaseFirestore.instance.collection('Locations');

  Future<void> addLocation(LocationModel location) {
    return _locationsCollection.add(location.toJson());
  }

  Stream<List<LocationModel>> getLocations() {
    return _locationsCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => LocationModel.fromSnapshot(doc)).toList());
  }

}