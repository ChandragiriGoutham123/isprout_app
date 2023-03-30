import 'package:basic_app/models/employee_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeDao {
  final CollectionReference _employeeRef =
      FirebaseFirestore.instance.collection("Employee");

  Future<void> addEmp(EmployeeModel employee) {
    return _employeeRef.doc(employee.empID).set(employee.toJson());
  }

  Stream<List<EmployeeModel>> getEmp() {
    return _employeeRef.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => EmployeeModel.fromSnapshot(doc)).toList());
  }
}
