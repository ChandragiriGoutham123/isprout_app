import 'package:basic_app/DAO/employee_dao.dart';
import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/models/employee_model.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  AddEmployeeState createState() => AddEmployeeState();
}

class AddEmployeeState extends BasePageState<AddEmployee> {
  final EmployeeDao _employeeDao = EmployeeDao();
  final TextEditingController _empID = TextEditingController();
  final TextEditingController _employeeName = TextEditingController();
  final TextEditingController _position = TextEditingController();
  final TextEditingController _department = TextEditingController();
  final TextEditingController _dateOfJoining = TextEditingController();
  final TextEditingController _contactNo = TextEditingController();
  final TextEditingController _emailID = TextEditingController();
  final TextEditingController _PAN = TextEditingController();
  final TextEditingController _aadharCard = TextEditingController();
  final TextEditingController _emergencyContact = TextEditingController();
  final TextEditingController _leaveBalance = TextEditingController();
  final TextEditingController _gender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            textArea(_empID, "Employee Id"),
            textArea(_employeeName, "Employee Name"),
            textArea(_position, "Position"),
            textArea(_department, "Department"),
            textArea(_dateOfJoining, "Date of Joining"),
            textArea(_contactNo, "Contact Number"),
            textArea(_emailID, "Email ID"),
            textArea(_PAN, "PAN "),
            textArea(_aadharCard, "Aadhar Number"),
            textArea(_emergencyContact, "Emergency Contact Number"),
            textArea(_leaveBalance, "Leave Balance"),
            textArea(_gender, "Gender"),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              _employeeDao.addEmp(EmployeeModel(empID: _empID.text,
                  employeeName: _employeeName.text,
                  position: _position.text,
                  department: _department.text,
                  dateOfJoining: _dateOfJoining.text,
                  contactNo: _contactNo.text,
                  emailID: _empID.text,
                  PAN: _PAN.text,
                  aadharCard: _aadharCard.text,
                  emergencyContactNumber: _emergencyContact.text,
                  leaveBalance: _leaveBalance.text,
                  gender: _gender.text

              ));
              _empID.clear();
              _employeeName.clear();
              _position.clear();
              _department.clear();
              _dateOfJoining.clear();
              _contactNo.clear();
              _emailID.clear();
              _PAN.clear();
              _aadharCard.clear();
              _emergencyContact.clear();
              _leaveBalance.clear();
              _gender.clear();
            }, child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
