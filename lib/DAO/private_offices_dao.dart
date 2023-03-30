import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/private_offices_model.dart';

class PrivateOfficesDao{

  final CollectionReference _privateOfficeCollection =
  FirebaseFirestore.instance.collection("Private offices");

  Future<void> addPrivateOffice(PrivateOfficeModel pom) {
    return _privateOfficeCollection.doc(pom.privateOfficeId).set(pom.toJson());
  }

  Stream<List<PrivateOfficeModel>> getPrivateOffice() {
    return _privateOfficeCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => PrivateOfficeModel.fromsnapshot(doc))
        .toList());
  }

}