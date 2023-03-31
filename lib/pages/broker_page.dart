import 'package:basic_app/DAO/broker_dao.dart';
import 'package:basic_app/adding_pages/add_vendor.dart';
import 'package:flutter/material.dart';

import '../models/broker_model.dart';

class BrokerPage extends StatefulWidget {
  const BrokerPage({Key? key}) : super(key: key);

  @override
  State<BrokerPage> createState() => _BrokerPageState();
}

class _BrokerPageState extends State<BrokerPage> {
  late Stream<List<BrokerModel>> _brokerStream;
  final BrokerDao _brokerDao = BrokerDao();

  @override
  void initState() {
    _brokerStream = _brokerDao.getBroker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brokers"),
      ),
      body: StreamBuilder<List<BrokerModel>>(
        stream: _brokerStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final broker = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                //brokerID name image brokerFirmID locationID position department	 PhoneNumber
                DataColumn(label: Text("Broker Id")),
                DataColumn(label: Text("Broker Name")),
                DataColumn(label: Text("Broker FirmId")),
                DataColumn(label: Text("Location Id")),
                DataColumn(label: Text("Position")),
                DataColumn(label: Text("Department")),
                DataColumn(label: Text("Phone Number"))
              ],
              rows: broker
                  .map((e) => DataRow(cells: [
                        DataCell(Text(e.brokerID)),
                        DataCell(Text(e.name)),
                        DataCell(Text(e.brokerFirmID)),
                        DataCell(Text(e.locationID)),
                        DataCell(Text(e.position)),
                        DataCell(Text(e.department)),
                        DataCell(Text(e.department))
                      ]))
                  .toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(context: context, builder: (_) => const AddVendor());
        },
        tooltip: "Add Broker",
        icon: const Icon(Icons.add),
        label: const Text("Add Broker"),
      ),
    );
  }
}
