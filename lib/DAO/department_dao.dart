import 'package:basic_app/models/department_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentDao{
  final CollectionReference _deptCollection =
  FirebaseFirestore.instance.collection('Department');

  Future<void> addDept(DepartmentModel dept) {
    return _deptCollection.doc(dept.deptId).set(dept.toJson());

  }

  Stream<List<DepartmentModel>> getDept() {
    return _deptCollection.snapshots().map((snapshot) =>snapshot.docs.map((doc) => DepartmentModel.fromSnapShot(doc)).toList());
  }
}
