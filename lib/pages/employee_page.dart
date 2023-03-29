import 'package:basic_app/DAO/employee_dao.dart';
import 'package:basic_app/adding_pages/add_employee.dart';
import 'package:flutter/material.dart';

import '../models/employee_model.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  late Stream<List<EmployeeModel>> _employeeStream;
  EmployeeDao _employeeDao = EmployeeDao();

  @override
  void initState() {
    _employeeStream = _employeeDao.getEmp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employees')),
      body: StreamBuilder<List<EmployeeModel>>(
        stream: _employeeStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          final employee = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Employee Id")),
                DataColumn(label: Text("Employee Name")),
                DataColumn(label: Text("Position")),
                DataColumn(label: Text("Department")),
                DataColumn(label: Text("Date of Joining")),
                DataColumn(label: Text("Contact Number")),
                DataColumn(label: Text("Email ")),
                DataColumn(label: Text("PAN")),
                DataColumn(label: Text("Aadhar Number")),
                DataColumn(label: Text("Emergency Contact Number")),
                DataColumn(label: Text("Leave Balance")),
                DataColumn(label: Text("Gender")),
              ],
              rows: employee
                  .map(
                    (emp) => DataRow(cells: [
                      DataCell(Text(emp.empID)),
                      DataCell(Text(emp.employeeName)),
                      DataCell(Text(emp.position)),
                      DataCell(Text(emp.department)),
                      DataCell(Text(emp.dateOfJoining)),
                      DataCell(Text(emp.contactNo)),
                      DataCell(Text(emp.emailID)),
                      DataCell(Text(emp.PAN)),
                      DataCell(Text(emp.aadharCard)),
                      DataCell(Text(emp.emergencyContactNumber)),
                      DataCell(Text(emp.leaveBalance)),
                      DataCell(Text(emp.gender)),
                    ]),
                  )
                  .toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AddEmployee(),
            );
          },
          tooltip: 'Add Employee',
          icon: const Icon(Icons.add),
          label: const Text("Add Employee")),
    );
  }
}
