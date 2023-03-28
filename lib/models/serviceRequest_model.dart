import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceRequestModel{
  final String email;
  final String location;
  final String center;
  final String floor;
  final String room;
  final String comment;
  ServiceRequestModel({
    required this.email,
    required this.location,
    required this.center,
    required this.floor,
    required this.room,
    required this.comment
  });
  factory ServiceRequestModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return ServiceRequestModel(
        email: snapshot['email'],
        location: snapshot['location'],
        center: snapshot['center'],
        floor: snapshot['floor'],
        room: snapshot['room'],
        comment: snapshot['comment']
    );
  }
  Map<String,dynamic> toJson()=>{
    "email":email,
    "location":location,
    "center":center,
    "floor":floor,
    "room":room,
    "comment":comment
  };




}