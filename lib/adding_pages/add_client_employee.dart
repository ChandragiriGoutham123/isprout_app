import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/models/client_employee_model.dart';
import 'package:flutter/material.dart';

import '../DAO/client_employee_dao.dart';

class AddClientEmployee extends StatefulWidget {
  const AddClientEmployee({Key? key}) : super(key: key);

  @override
  AddClientEmployeeState createState() => AddClientEmployeeState();
}

class AddClientEmployeeState extends BasePageState<AddClientEmployee> {
  final ClientEmployeeDao _clientEmployeeDao=ClientEmployeeDao();

  final TextEditingController _clientEMPID = TextEditingController();
  final TextEditingController _clientEMPName = TextEditingController();
  final TextEditingController _contactNo = TextEditingController();
  final TextEditingController _mailID = TextEditingController();
  final TextEditingController _clientID = TextEditingController();
  final TextEditingController _position = TextEditingController();
  final TextEditingController _gender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            textArea(_clientEMPID, "Employee Id"),
            textArea(_clientEMPName, "Employee Name"),
            textArea(_contactNo, "Contact Number"),
            textArea(_mailID, "Email"),
            textArea(_clientID, "Client Id"),
            textArea(_position, "Position of Employee"),
            textArea(_gender, "Gender"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  _clientEmployeeDao.addCE(ClientEmployeeModel(
                      clientEMPID: _clientEMPID.text,
                      clientEMPName: _clientEMPName.text,
                      contactNo: _contactNo.text,
                      mailID: _mailID.text,
                      clientID: _clientID.text,
                      position: _position.text,
                      gender: _gender.text));
                  _clientEMPID.clear();
                  _clientEMPName.clear();
                  _contactNo.clear();
                  _mailID.clear();
                  _clientID.clear();
                  _position.clear();
                  _gender.clear();
                },
                child: const Text("Add")),
          ],
        ),
      ),
    );
  }
}
