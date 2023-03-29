import 'package:basic_app/adding_pages/add_private_office.dart';
import 'package:flutter/material.dart';

import '../DAO/private_offices_dao.dart';
import '../models/private_offices_model.dart';

class PrivateOfficePage extends StatefulWidget {
  const PrivateOfficePage({Key? key}) : super(key: key);

  @override
  State<PrivateOfficePage> createState() => _PrivateOfficePageState();
}

class _PrivateOfficePageState extends State<PrivateOfficePage> {
  late Stream<List<PrivateOfficeModel>> _privateOfficeStream;
final PrivateOfficesDao _privateOfficesDao=PrivateOfficesDao();

  @override
  void initState() {
    _privateOfficeStream = _privateOfficesDao.getPrivateOffice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Private Office"),
      ),
      body: StreamBuilder<List<PrivateOfficeModel>>(
        stream: _privateOfficeStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final privateOffices = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("PrivateOfficeId")),
                DataColumn(label: Text("PrivateOfficeName")),
                DataColumn(label: Text("centerId")),
                DataColumn(label: Text("Billable Seats")),
                DataColumn(label: Text("WS Count")),
                DataColumn(label: Text("WS Size")),
                DataColumn(label: Text("Manager Cabins")),
                DataColumn(label: Text("Discussion Rooms")),
                DataColumn(label: Text("ConferenceRooms")),
                DataColumn(label: Text("Pantry")),
                DataColumn(label: Text("Reception ")),
                DataColumn(label: Text("BreakOuts")),
                DataColumn(label: Text("AHU Id")),
              ],
              rows: privateOffices.map((po) => DataRow(cells: [
                DataCell(Text(po.privateOfficeId)),
                DataCell(Text(po.privateOfficeName)),
                DataCell(Text(po.centerId)),
                DataCell(Text(po.billableSeats)),
                DataCell(Text(po.wsCount)),
                DataCell(Text(po.wsSize)),
                DataCell(Text(po.managerCabins)),
                DataCell(Text(po.discussionRooms)),
                DataCell(Text(po.confRooms)),
                DataCell(Text(po.pantry)),
                DataCell(Text(po.reception)),
                DataCell(Text(po.breakouts)),
                DataCell(Text(po.ahuId))
              ])).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AddPrivateOffice(),
            );
          },
          tooltip: 'Add PrivateOffice',
          icon: const Icon(Icons.add),
          label:

          const Text("Add PrivateOffice")),
    );
  }
}
