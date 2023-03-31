import 'package:cloud_firestore/cloud_firestore.dart';

class BookingPrivateOfficeModel{
  final String bookingId;
  final String privateOfficeId;
  final String companyId;
  final String invoiceAmount;
  final String comments;

  BookingPrivateOfficeModel({
    required this.bookingId,
    required this.privateOfficeId,
    required this.companyId,
    required this.invoiceAmount,
    required this.comments
  });
  factory BookingPrivateOfficeModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return BookingPrivateOfficeModel(
        bookingId: snapshot["Booking Id"],
        privateOfficeId: snapshot["Private Office Id"],
        companyId: snapshot["Company Id"],
        invoiceAmount: snapshot["Amount"],
        comments: snapshot["comments"]
    );
  }
  Map<String,dynamic> toJson()=>{
    "Booking Id":bookingId,
    "Private Office Id":privateOfficeId,
    "Company Id":companyId,

    "Amount":invoiceAmount,
    "comments":comments
  };
}