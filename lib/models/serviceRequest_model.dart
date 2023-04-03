import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceRequestModel{
  final String email;
  final String location;
  final String center;
  final String floor;
  final String room;
  final String comment;
  final String serviceRequestId;
  final String requesterId;
  final String requestType;
  final String status;
  final String modifiedBy;

  ServiceRequestModel({
    required this.email,
    required this.location,
    required this.center,
    required this.floor,
    required this.room,
    required this.comment,
    required this.serviceRequestId,
    required this.requesterId,
    required this.requestType,
    required this.status,
    required this.modifiedBy
  });
  factory ServiceRequestModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return ServiceRequestModel(
        email: snapshot['email'],
        location: snapshot['location'],
        center: snapshot['center'],
        floor: snapshot['floor'],
        room: snapshot['room'],
        comment: snapshot['comment'],
        serviceRequestId: snapshot['service request id'],
        requesterId: snapshot['requester id'],
        requestType: snapshot['request type'],
        status: snapshot['status'],
        modifiedBy: snapshot['modified by']
    );
  }


  Map<String,dynamic> toJson()=>{
    "email":email,
    "location":location,
    "center":center,
    "floor":floor,
    "room":room,
    "comment":comment,
    "service request id":serviceRequestId,
    "requester id":requesterId,
    "request type":requestType,
    "status":status,
    "modified by":modifiedBy,
  };




}