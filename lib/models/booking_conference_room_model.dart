import 'package:cloud_firestore/cloud_firestore.dart';

class BookingConferenceRoomModel{
  final String bookingId;
  final String companyId;
  final String conferenceRoomId;
  final DateTime startingDateTime;
  final DateTime endingDateTime;
  final String amount;
  final String comment;
  BookingConferenceRoomModel({
    required this.bookingId,
    required this.companyId,
    required this.conferenceRoomId,
    required this.startingDateTime,
    required this.endingDateTime,
    required this.amount,
    required this.comment,
  });
  factory BookingConferenceRoomModel.fromSnapshot(DocumentSnapshot con){
    var snapshot = con.data() as Map<String, dynamic>;
    return BookingConferenceRoomModel(
        bookingId: snapshot["BookingId"],
        companyId: snapshot["CompanyId"],
        conferenceRoomId: snapshot["ConferenceRoomId"],
        startingDateTime: DateTime.fromMillisecondsSinceEpoch(snapshot["BookingStartDate"].millisecondsSinceEpoch),
        endingDateTime:  DateTime.fromMillisecondsSinceEpoch(snapshot["BookingEndDate"].millisecondsSinceEpoch),
        amount: snapshot["Amount"],
        comment: snapshot["Comment"]
    );
  }
  Map<String,dynamic> toJson()=>{
    "BookingId":bookingId,
    "CompanyId":companyId,
    "ConferenceRoomId":conferenceRoomId,
    "BookingStartDate":startingDateTime,
    "BookingEndDate":endingDateTime,
    "Amount":amount,
    "Comment":comment
  };
}