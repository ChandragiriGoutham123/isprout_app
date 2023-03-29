import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeModel {
  final String empID;
  final String employeeName;
  final String position;
  final String department;
  final String dateOfJoining;
  final String contactNo;
  final String emailID;
  final String PAN;
  final String aadharCard;
  final String emergencyContactNumber;
  final String leaveBalance;
  final String gender;

  EmployeeModel(
      {required this.empID,
      required this.employeeName,
      required this.position,
      required this.department,
      required this.dateOfJoining,
      required this.contactNo,
      required this.emailID,
      required this.PAN,
      required this.aadharCard,
      required this.emergencyContactNumber,
      required this.leaveBalance,
      required this.gender});

  factory EmployeeModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return EmployeeModel(
        empID: snapshot["empID"],
        employeeName: snapshot["employeeName"],
        position: snapshot["position"],
        department: snapshot["department"],
        dateOfJoining: snapshot["dateOfJoining"],
        contactNo: snapshot["contactNo"],
        emailID: snapshot["emailID"],
        PAN: snapshot["PAN"],
        aadharCard: snapshot["aadharCard"],
        emergencyContactNumber: snapshot["emergencyContactNumber"],
        leaveBalance: snapshot["leaveBalance"],
        gender: snapshot["gender"]);
  }

  Map<String,dynamic> toJson()=>{
    "empID":emailID,
        "employeeName":employeeName,
        "position":position,
        "department":department,
        "dateOfJoining":dateOfJoining,
        "contactNo":contactNo,
        "emailID":emailID,
        "PAN":PAN,
        "aadharCard":aadharCard,
        "emergencyContactNumber":emergencyContactNumber,
        "leaveBalance":leaveBalance,
        "gender":gender
  };
}
