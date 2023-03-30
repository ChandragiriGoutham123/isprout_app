import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/client_employee_model.dart';

class ClientEmployeeDao{
  //Client Employee Services
  final CollectionReference _clientEmpCollection =
  FirebaseFirestore.instance.collection("Client Employee");

  Future<void> addCE(ClientEmployeeModel cem) {
    return _clientEmpCollection.doc(cem.clientID).set(cem.toJson());
  }

  Stream<List<ClientEmployeeModel>> getCE() {
    return _clientEmpCollection.snapshots().map((snap) =>
        snap.docs.map((doc) => ClientEmployeeModel.fromSnapShot(doc)).toList());
  }
}