import 'package:cloud_firestore/cloud_firestore.dart';

class EventManagementModel{
  final String eventId;
  final String eventName;
  final String eventDescription;
  final String centerId;
  final DateTime startDateAndTime;
  final DateTime endDateAndTime;
  final String contactNumber;
  final String vendorName;
  final String vendorContact;

  EventManagementModel({
    required this.eventId,
    required this.eventName,
    required this.eventDescription,
    required this.centerId,
    required this.startDateAndTime,
    required this.endDateAndTime,
    required this.contactNumber,
    required this.vendorName,
    required this.vendorContact
  });
  factory EventManagementModel.fromSnapshot(DocumentSnapshot con){
    var snapshot = con.data() as Map<String, dynamic>;
    print(snapshot);
    return EventManagementModel(
        eventId: snapshot['EventId'],
        eventName: snapshot['Event name'],
        eventDescription: snapshot['Event Description'],
        centerId: snapshot['CenterId'],
        startDateAndTime: DateTime.fromMillisecondsSinceEpoch(snapshot["EventStartDate"].millisecondsSinceEpoch),
        endDateAndTime: DateTime.fromMillisecondsSinceEpoch(snapshot["EventEndDate"].millisecondsSinceEpoch),
        contactNumber: snapshot['Contact number'],
        vendorName: snapshot['Vendor name'],
        vendorContact: snapshot['Vendor Contact']);
  }
  Map<String,dynamic> toJson()=>{
    "EventId":eventId,
    "Event name":eventName,
    "Event Description":eventDescription,
    "CenterId":centerId,
    "EventStartDate":startDateAndTime,
    "EventEndDate":endDateAndTime,
    "Contact number":contactNumber,
    "Vendor name":vendorName,
    "Vendor Contact":vendorContact
  };
}