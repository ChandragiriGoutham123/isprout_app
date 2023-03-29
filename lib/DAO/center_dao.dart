import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/center_model.dart';

class CenterDao{

  final CollectionReference _centerCollection =
  FirebaseFirestore.instance.collection("Centers");

  Future<void> addCenter(CenterModel center)  {
    return _centerCollection.add(center.toJson());
  }

  Stream<List<CenterModel>> getCenter() {
    return _centerCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => CenterModel.fromSnapshot(doc)).toList());
  }
}