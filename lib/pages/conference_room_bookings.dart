import 'package:basic_app/DAO/booking_conference_room_dao.dart';
import 'package:basic_app/adding_pages/add_conference_room_bookings.dart';
import 'package:basic_app/main/drawer_widget.dart';
import 'package:basic_app/models/booking_conference_room_model.dart';
import 'package:flutter/material.dart';

class ConferenceRoomBookingDetails extends StatefulWidget {
  const ConferenceRoomBookingDetails({Key? key}) : super(key: key);

  @override
  State<ConferenceRoomBookingDetails> createState() =>
      _ConferenceRoomBookingDetailsState();
}

class _ConferenceRoomBookingDetailsState
    extends State<ConferenceRoomBookingDetails> {
  late Stream<List<BookingConferenceRoomModel>> _conferenceStream;
  final BookingConferenceRoomDao bookingConferenceRoomDao =
      BookingConferenceRoomDao();

  @override
  void initState() {
    super.initState();
    _conferenceStream = bookingConferenceRoomDao.getBookingConferenceRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conference room Bookings',
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: StreamBuilder<List<BookingConferenceRoomModel>>(
        stream: _conferenceStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();

          }
          final conference = snapshot.data!;
          return ListView(
              children: conference
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
                                  "Booking Id:  ${doc.bookingId}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "Company Id: ${doc.companyId}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "Conference Room Id: ${doc.conferenceRoomId}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "Starting Booking Date and Time: ${doc.startingDateTime}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "Ending Booking Date and Time: ${doc.endingDateTime}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "Amount: ${doc.amount}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "comment: ${doc.comment}",
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
              builder: (_) => const AddConferenceRoomBookings(),
            );
          },
          tooltip: 'Add Location',
          icon: const Icon(Icons.add),
          label: const Text("Add Conference Bookings")),
    );
  }
}
