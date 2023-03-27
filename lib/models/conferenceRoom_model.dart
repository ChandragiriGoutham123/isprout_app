import 'package:cloud_firestore/cloud_firestore.dart';

class ConferenceRoomModel {
  final String meetingRoomId;
  final String meetingRoomName;
  final String centerId;
  final String size;
  final informalSeats;
  final creditFor30Mins;
  final String av;

  ConferenceRoomModel(
      {required this.meetingRoomId,
      required this.meetingRoomName,
      required this.centerId,
      required this.size,
      required this.informalSeats,
      required this.creditFor30Mins,
      required this.av});

  factory ConferenceRoomModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ConferenceRoomModel(
        meetingRoomId: snapshot["meetingRoomId"],
        meetingRoomName: snapshot["meetingRoomName"],
        centerId: snapshot["centerId"],
        size: snapshot["size"],
        informalSeats: snapshot["informalSeats"],
        creditFor30Mins: snapshot["creditFor30Mins"],
        av: snapshot["av"]);
  }

  Map<String, dynamic> toJson() => {
        "meetingRoomId": meetingRoomId,
        "meetingRoomName": meetingRoomName,
        "centerId": centerId,
        "size": size,
        "informalSeats": informalSeats,
        "creditFor30Mins": creditFor30Mins,
        "av": av
      };
}
