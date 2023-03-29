import 'package:basic_app/adding_pages/add_conference_room_bookings.dart';
import 'package:basic_app/main/drawer_widget.dart';
import 'package:flutter/material.dart';

class ConferenceRoomBookingDetails extends StatefulWidget {
  const ConferenceRoomBookingDetails({Key? key}) : super(key: key);

  @override
  State<ConferenceRoomBookingDetails> createState() => _ConferenceRoomBookingDetailsState();
}

class _ConferenceRoomBookingDetailsState extends State<ConferenceRoomBookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conference room Bookings',),centerTitle: true,),
      drawer: MyDrawer(),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AddConferenceRoomBookings(),
            );
          },
          tooltip: 'Add Location',
          icon: const Icon(Icons.add),
          label:

          const Text("Add Conference Bookings")),
    );
  }
}
