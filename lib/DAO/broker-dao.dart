import 'package:basic_app/models/broker_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrokerDao {
  final CollectionReference _brokerCollection =
      FirebaseFirestore.instance.collection("Brokers");

  Future<void> addBroker(BrokerModel broker) {
    return _brokerCollection.doc(broker.brokerID).set(broker.toJson());
  }

  Stream<List<BrokerModel>> getBroker() {
    return _brokerCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => BrokerModel.fromsnapshot(doc)).toList());
  }
}
