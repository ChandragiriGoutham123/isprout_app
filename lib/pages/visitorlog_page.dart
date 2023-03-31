import 'package:flutter/material.dart';
import '../DAO/visitorlog_dao.dart';
import '../adding_pages/add_visitorlog.dart';
import '../models/visitorlog_model.dart';

class VisitorLogDetails extends StatefulWidget {
  const VisitorLogDetails({Key? key}) : super(key: key);

  @override
  State<VisitorLogDetails> createState() => _VisitorLogDetailsState();
}

class _VisitorLogDetailsState extends State<VisitorLogDetails> {
  late Stream<List<AddVisitorLogModel>> _visitorStream;
  final VisitorLogDao visitorLogDao = VisitorLogDao();

  @override
  void initState() {
    print("void");
    super.initState();
    _visitorStream = visitorLogDao.getVisitorLog();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visitor Log'),centerTitle: true),
      body: StreamBuilder(
        stream: _visitorStream,
        builder: (context, sna) {
          if (!sna.hasData) {
            print("no data");

            return const CircularProgressIndicator();

          }
          final visitor = sna.data!;
          print("snapshotdata: $visitor");
          return ListView(
              children: visitor
                  .map((doc) => Card(
                color: Colors.white38,
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Visitor Id:  ${doc.visitorId ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),Container(

                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Visitor Name:  ${doc.visitorName ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Company Id: ${doc.companyId ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Client Id: ${doc.clientId ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),Container(

                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Government Id:  ${doc.governmentId ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),Container(

                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Id Number:  ${doc.idNumber ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Start Date and Time: ${doc.startDateAndTime ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "End Date and Time: ${doc.endDateAndTime ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),

                  ],
                ),
              ))
                  .toList());
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AddVisitorLog(),
            );
          },
          tooltip: 'Add Location',
          icon: const Icon(Icons.add),
          label: const Text("Add Visitor Log")),
    );
  }
}