import 'package:basic_app/models/booking_conference_room_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/event_management_model.dart';

class EventManagementDao {
  final CollectionReference _emcollection =
  FirebaseFirestore.instance.collection("EventManagement");

  Future<void> addEventManagement(EventManagementModel em) {
    return _emcollection.add(em.toJson());
  }

  Stream<List<EventManagementModel>> getEventManagement() {
    return _emcollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => EventManagementModel.fromSnapshot(doc))
        .toList());
  }
}