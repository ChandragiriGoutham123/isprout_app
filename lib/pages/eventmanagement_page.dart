import 'package:basic_app/DAO/event_management_dao.dart';
import 'package:basic_app/adding_pages/add_event_management.dart';
import 'package:basic_app/models/event_management_model.dart';
import 'package:flutter/material.dart';

import '../main/drawer_widget.dart';

class EventManagementDetails extends StatefulWidget {
  const EventManagementDetails({Key? key}) : super(key: key);

  @override
  State<EventManagementDetails> createState() => _EventManagementDetailsState();
}

class _EventManagementDetailsState extends State<EventManagementDetails> {
  late Stream<List<EventManagementModel>> _eventStream;
  final EventManagementDao _eventManagementDao =EventManagementDao();

  void initState() {
    print("void");

    _eventStream = EventManagementDao().getEventManagement();
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Event Management',
        ),
        centerTitle: true,
      ),
         body: StreamBuilder(
        stream: _eventStream,
        builder: (context, sna) {
          if (!sna.hasData) {
            print("no data");

            return const CircularProgressIndicator();

          }
          final event = sna.data!;
          print("snapshotdata: $event");
          return ListView(
              children: event
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
                          "Event Id:  ${doc.eventId ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Event Name: ${doc.eventName ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Event Description: ${doc.eventDescription ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Center Id: ${doc.centerId ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Starting Event Date and Time: ${doc.startDateAndTime ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Ending Event Date and Time: ${doc.endDateAndTime ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Contact Number: ${doc.contactNumber ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Vendor Name: ${doc.vendorName ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Vendor Contact: ${doc.vendorContact ?? ''}",
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
              builder: (_) => const AddEventManagement(),
            );
          },
          tooltip: 'Add Location',
          icon: const Icon(Icons.add),
          label: const Text("Add Event Managements")),
    );
  }
}