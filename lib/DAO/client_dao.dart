import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/client_model.dart';

class ClientDao{
  final CollectionReference _clientCollection =
  FirebaseFirestore.instance.collection("Client Details");

  Future<void> addClient(ClientModel client) {
    return _clientCollection.add(client.toJson());
  }

  Stream<List<ClientModel>> getClient() {
    return _clientCollection.snapshots().map((snap) =>
        snap.docs.map((doc) => ClientModel.fromSnapshot(doc)).toList());
  }

}