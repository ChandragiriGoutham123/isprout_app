import 'package:basic_app/adding_pages/add_client_employee.dart';
import 'package:basic_app/models/client_employee_model.dart';
import 'package:flutter/material.dart';

import '../DAO/client_employee_dao.dart';


class ClientEmployeePage extends StatefulWidget {
  const ClientEmployeePage({Key? key}) : super(key: key);

  @override
  State<ClientEmployeePage> createState() => _ClientEmployeePageState();
}

class _ClientEmployeePageState extends State<ClientEmployeePage> {
  late Stream<List<ClientEmployeeModel>> _clientEmployeeStream;
  final ClientEmployeeDao _clientEmployeeDao=ClientEmployeeDao();

  @override
  void initState() {
    super.initState();
    _clientEmployeeStream = _clientEmployeeDao.getCE();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Client Employee Details"),),

      body: StreamBuilder<List<ClientEmployeeModel>>(
        stream: _clientEmployeeStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final clientEmp = snapshot.data!;
          return Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.redAccent,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Client Employee Id')),
                        DataColumn(label: Text('Client Employee Name')),
                        DataColumn(label: Text('Contact Number')),
                        DataColumn(label: Text('mailID')),
                        DataColumn(label: Text('clientID')),
                        DataColumn(label: Text('position')),
                        DataColumn(label: Text('gender')),
                                    ],
                      rows: clientEmp
                          .map(
                            (emp) => DataRow(cells: [
                          DataCell(Text(emp.clientID)),
                          DataCell(Text(emp.clientEMPName)),
                          DataCell(Text(emp.contactNo)),
                          DataCell(Text(emp.mailID)),
                          DataCell(Text(emp.clientID)),
                          DataCell(Text(emp.position)),
                          DataCell(Text(emp.gender)),
                        ]),
                      )
                          .toList(),
                    ),
                  )),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const AddClientEmployee(),
          );
        },
        tooltip: 'Add Employee',
        label: const Text("AddEmployee"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
