import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/booking_private_office_model.dart';
import '../models/center_model.dart';

class BookingPrivateOfficeDao{
  final CollectionReference _bookingPrivateOfficeCollection =
  FirebaseFirestore.instance.collection("Private Offices Bookings");

  Future<void> addBookingPrivateOffices(BookingPrivateOfficeModel model) {
    return _bookingPrivateOfficeCollection.add(model.toJson());
  }

  Stream<List<BookingPrivateOfficeModel>> getBookingPrivateOffices() {
    return _bookingPrivateOfficeCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => BookingPrivateOfficeModel.fromSnapshot(doc)).toList());
  }
}