import 'package:basic_app/models/booking_conference_room_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingConferenceRoomDao{
  final CollectionReference _crcollection =
  FirebaseFirestore.instance.collection("Conference Room Bookings");

  Future<void> addBookingConferenceRooms(BookingConferenceRoomModel booking) {
  return _crcollection.add(booking.toJson());
  }

  Stream<List<BookingConferenceRoomModel>> getBookingConferenceRooms() {
    return _crcollection
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => BookingConferenceRoomModel.fromSnapshot(doc))
        .toList());
  }
}