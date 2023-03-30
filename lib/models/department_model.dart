import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentModel {

  final String deptId;
  final String deptName;
  final String deptDescription;

  DepartmentModel({required this.deptId,
    required this.deptName,
    required this.deptDescription});

  factory DepartmentModel.fromSnapShot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return DepartmentModel(
        deptId: snapshot["deptId"],
        deptName: snapshot["deptName"],
        deptDescription: snapshot["deptDescription"]);
  }

  Map<String, dynamic> toJson() =>
      {
        "deptId": deptId,
        "deptName": deptName,
        "deptDescription": deptDescription,
      };
}
