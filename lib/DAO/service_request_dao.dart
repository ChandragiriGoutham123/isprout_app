import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/serviceRequest_model.dart';

class ServiceRequestDao{
  final CollectionReference _srcollection =
  FirebaseFirestore.instance.collection("Service requests");

  Future<void> addServiceRequest(ServiceRequestModel serviceRequest) {
    return _srcollection.add(serviceRequest.toJson());
  }

  Stream<List<ServiceRequestModel>> getServiceRequest() {
    return _srcollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => ServiceRequestModel.fromSnapshot(doc))
        .toList());
  }
}