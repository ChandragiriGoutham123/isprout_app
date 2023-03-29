import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/conferenceRoom_model.dart';

class ConferenceRoomDao{

  final CollectionReference _conferenceRoomCollection =
  FirebaseFirestore.instance.collection("Conference Rooms");

  Future<void> addConference(ConferenceRoomModel room) {
    return _conferenceRoomCollection.add(room.toJson());
  }

  Stream<List<ConferenceRoomModel>> getConferenceRoom() {
    return _conferenceRoomCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => ConferenceRoomModel.fromSnapshot(doc))
        .toList());
  }
}
