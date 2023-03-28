import 'package:basic_app/adding_pages/add_client.dart';
import 'package:basic_app/main/crud.dart';
import 'package:flutter/material.dart';

import '../models/client_model.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  late Stream<List<ClientModel>> _clientStream;
  Crud crud = Crud();

  @override
  void initState() {
    _clientStream = crud.getClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
      ),
      body: StreamBuilder<List<ClientModel>>(
        stream: _clientStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final clients = snapshot.data!;
          return Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.redAccent,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('clientID')),
                          DataColumn(label: Text('client Name')),
                          DataColumn(label: Text('address')),
                          DataColumn(label: Text('PAN')),
                          DataColumn(label: Text('GST')),
                          DataColumn(label: Text('primaryContact')),
                          DataColumn(label: Text('primaryContactNumber')),
                          DataColumn(label: Text('size')),
                          DataColumn(label: Text('billableSeats')),
                          DataColumn(label: Text('invoiceAmount')),
                          DataColumn(label: Text('meetingCredits')),
                          DataColumn(label: Text('workingDays')),
                          DataColumn(label: Text('workingHrs')),
                          DataColumn(label: Text('complimentaryCarParking')),
                          DataColumn(label: Text('paidCarParking')),
                          DataColumn(label: Text('complimentaryBikeParking')),
                          DataColumn(label: Text('paidBikeParking')),
                          DataColumn(label: Text('contractStartDate')),
                          DataColumn(label: Text('lockInPeriod')),
                          DataColumn(label: Text('noticePeriod')),
                          DataColumn(label: Text('contractEndDate')),
                          DataColumn(label: Text('signature')),
                          DataColumn(label: Text("remarks"))
                        ],
                        rows: clients
                            .map(
                              (client) => DataRow(cells: [
                                DataCell(Text(client.clientID)),
                                DataCell(Text(client.clientName)),
                                DataCell(Text(client.address)),
                                DataCell(Text(client.PAN)),
                                DataCell(Text(client.GST)),
                                DataCell(Text(client.primaryContact)),
                                DataCell(Text(client.primaryContactNumber)),
                                DataCell(Text(client.size)),
                                DataCell(Text(client.billableSeats)),
                                DataCell(Text(client.invoiceAmount)),
                                DataCell(Text(client.meetingCredits)),
                                DataCell(Text(client.workingDays)),
                                DataCell(Text(client.workingHrs)),
                                DataCell(Text(client.complimentaryCarParking)),
                                DataCell(Text(client.paidCarParking)),
                                DataCell(Text(client.complimentaryBikeParking)),
                                DataCell(Text(client.paidCarParking)),
                                DataCell(Text(client.contractStartDate)),
                                DataCell(Text(client.lockInPeriod)),
                                DataCell(Text(client.noticePeriod)),
                                DataCell(Text(client.contractEndDate)),
                                DataCell(Text(client.signature)),
                                DataCell(Text(client.remarks)),
                              ]),
                            )
                            .toList(),
                      ),
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
            builder: (_) => const AddClient(),
          );
        },
        tooltip: 'Add Client',
        label: const Text("AddClient"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
