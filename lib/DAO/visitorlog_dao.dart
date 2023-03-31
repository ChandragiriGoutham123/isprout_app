import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/visitorlog_model.dart';

class VisitorLogDao{
  final CollectionReference _vlcollection =
  FirebaseFirestore.instance.collection("Visitor Log");

  Future<void> addVisitorLog(AddVisitorLogModel log) {
    return _vlcollection.add(log.toJson());
  }

  Stream<List<AddVisitorLogModel>> getVisitorLog() {
    return _vlcollection
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => AddVisitorLogModel.fromSnapshot(doc))
        .toList());
  }
}