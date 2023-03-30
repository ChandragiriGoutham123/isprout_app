import 'package:basic_app/DAO/department_dao.dart';
import 'package:basic_app/adding_pages/add_department.dart';
import 'package:flutter/material.dart';

import '../models/department_model.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({Key? key}) : super(key: key);

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  late Stream<List<DepartmentModel>> _deptStream;
  final DepartmentDao _deptDao = DepartmentDao();

  @override
  void initState() {
    _deptStream = _deptDao.getDept();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Departments"),
      ),
      body: StreamBuilder<List<DepartmentModel>>(
        stream: _deptStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final dept = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
                columns: const [
                  DataColumn(label: Text("Department Id")),
                  DataColumn(label: Text("Department Name")),
                  DataColumn(label: Text("Description")),
                ],
                rows: dept
                    .map((dep) => DataRow(cells: [
                          DataCell(Text(dep.deptId)),
                          DataCell(Text(dep.deptName)),
                          DataCell(Text(dep.deptDescription))
                        ]))
                    .toList()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(context: context, builder: (_)=>const AddDepartment());
        },
        tooltip: "Add Department",
        icon: const Icon(Icons.add),
        label: const Text("Add Department"),
      ),
    );
  }
}
