import 'package:cloud_firestore/cloud_firestore.dart';

class PrivateOfficeModel {
  final String privateOfficeId;
  final String privateOfficeName;
  final String centerId;
  final String billableSeats;
  final String wsCount;
  final String wsSize;
  final String managerCabins;
  final String discussionRooms;
  final String confRooms;
  final String pantry;
  final String reception;
  final String breakouts;
  final String ahuId;

  PrivateOfficeModel({required this.privateOfficeId,
    required this.privateOfficeName,
    required this.centerId,
    required this.billableSeats,
    required this.wsCount,
    required this.wsSize,
    required this.managerCabins,
    required this.discussionRooms,
    required this.confRooms,
    required this.pantry,
    required this.reception,
    required this.breakouts,
    required this.ahuId});

  factory PrivateOfficeModel.fromsnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return PrivateOfficeModel(privateOfficeId: snapshot["privateOfficeId"],
        privateOfficeName: snapshot["privateOfficeName"],
        centerId: snapshot["centerId"],
        billableSeats: snapshot["billableSeats"],
        wsCount: snapshot ["wsCount"],
        wsSize: snapshot["wsSize"],
        managerCabins: snapshot["managerCabins"],
        discussionRooms: snapshot["discussionRooms"],
        confRooms: snapshot["confRooms"],
        pantry: snapshot["pantry"],
        reception: snapshot["reception"],
        breakouts: snapshot["breakouts"],
        ahuId: snapshot["ahuId"]);
  }

    Map<String,dynamic> toJson()=>{
      "privateOfficeId":privateOfficeId,
      "privateOfficeName":privateOfficeName,
          "centerId":centerId,
          "billableSeats":billableSeats,
          "wsCount":wsCount,
          "wsSize":wsSize,
          "managerCabins":managerCabins,
      "discussionRooms":discussionRooms,
          "confRooms":confRooms,
          "pantry":pantry,
          "reception":reception,
          "breakouts":breakouts,
          "ahuId":ahuId
    };
  }



