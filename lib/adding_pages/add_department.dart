import 'package:basic_app/DAO/department_dao.dart';
import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/models/department_model.dart';
import 'package:flutter/material.dart';

class AddDepartment extends StatefulWidget {
  const AddDepartment({Key? key}) : super(key: key);

  @override
  AddDepartmentState createState() => AddDepartmentState();
}

class AddDepartmentState extends BasePageState<AddDepartment> {
  final TextEditingController _deptId = TextEditingController();
  final TextEditingController _deptName = TextEditingController();
  final TextEditingController _description = TextEditingController();

  final DepartmentDao _departmentDao = DepartmentDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            textArea(_deptId, "DepartmentId"),
            textArea(_deptName, "Department Name"),
            textArea(_description, "Description"),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              _departmentDao.addDept(DepartmentModel(deptId: _deptId.text,
                  deptName: _deptName.text,
                  deptDescription: _description.text));
              _deptId.clear();
              _deptName.clear();
              _description.clear();
            }, child: const Text("Add"))
          ],
        ),
      ),

    );
  }
}
