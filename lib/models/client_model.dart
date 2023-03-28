import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientModel {
  final String clientID;
  final String clientName;
  final String address;
  final String PAN;
  final String GST;
  final String primaryContact;
  final String primaryContactNumber;
  final String size;
  final String billableSeats;
  final String invoiceAmount;
  final String meetingCredits;
  final String workingDays;
  final String workingHrs;
  final String complimentaryCarParking;
  final String paidCarParking;
  final String complimentaryBikeParking;
  final String paidBikeParking;
  final String contractStartDate;
  final String lockInPeriod;
  final String noticePeriod;
  final String contractEndDate;
  final String signature;
  final String remarks;

  ClientModel({
    required this.clientID,
    required this.clientName,
    required this.address,
    required this.PAN,
    required this.GST,
    required this.primaryContact,
    required this.primaryContactNumber,
    required this.size,
    required this.billableSeats,
    required this.invoiceAmount,
    required this.meetingCredits,
    required this.workingDays,
    required this.workingHrs,
    required this.complimentaryCarParking,
    required this.paidCarParking,
    required this.complimentaryBikeParking,
    required this.paidBikeParking,
    required this.contractStartDate,
    required this.lockInPeriod,
    required this.noticePeriod,
    required this.contractEndDate,
    required this.signature,
    required this.remarks});

  factory ClientModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return ClientModel(clientID: snapshot["clientID"],
        clientName: snapshot["clientName"],
        address: snapshot[" address"],
        PAN: snapshot["PAN"],
        GST: snapshot["GST"],
        primaryContact: snapshot["primaryContact"],
        primaryContactNumber: snapshot["primaryContactNumber"],
        size: snapshot["size"],
        billableSeats: snapshot["billableSeats"],
        invoiceAmount: snapshot["invoiceAmount"],
        meetingCredits: snapshot["meetingCredits"],
        workingDays: snapshot["workingDays"],
        workingHrs: snapshot["workingHrs"],
        complimentaryCarParking:snapshot["complimentaryCarParking"] ,
        paidCarParking: snapshot["paidCarParking"],
        complimentaryBikeParking: snapshot["complimentaryBikeParking"],
        paidBikeParking: snapshot["paidBikeParking"],
        contractStartDate: snapshot["contractStartDate"],
        lockInPeriod: snapshot["lockInPeriod"],
        noticePeriod: snapshot["noticePeriod"],
        contractEndDate: snapshot["contractEndDate"],
        signature: snapshot["signature"],
        remarks: snapshot["remarks"]
    );
  }

  Map<String,dynamic> toJson()=>{
    "clientID":clientID,
    "clientName":clientName,
    "address":address,
    "PAN":PAN,
    "GST":GST,
    "primaryContact":primaryContact,
    "primaryContactNumber":primaryContactNumber,
    "size":size,
    "billableSeats":billableSeats,
    "invoiceAmount":invoiceAmount,
    "meetingCredits":meetingCredits,
    "workingDays":workingDays,
    "workingHrs":workingHrs,
    "complimentaryCarParking":complimentaryCarParking,
    "paidCarParking":paidCarParking,
    "complimentaryBikeParking":complimentaryBikeParking,
    "paidBikeParking":paidBikeParking,
    "contractStartDate":contractStartDate,
    "lockInPeriod":lockInPeriod,
    "noticePeriod":noticePeriod,
    "contractEndDate":contractEndDate,
    "signature":signature,
    "remarks":remarks
  };

}
