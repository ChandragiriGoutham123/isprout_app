import 'package:basic_app/DAO/booking_private_offices_dao.dart';
import 'package:basic_app/models/booking_private_office_model.dart';
import 'package:flutter/material.dart';

import '../adding_pages/add_privateroom_booking.dart';
import '../main/drawer_widget.dart';

class PrivateRoomBookings extends StatefulWidget {
  const PrivateRoomBookings({Key? key}) : super(key: key);

  @override
  State<PrivateRoomBookings> createState() => _PrivateRoomBookingsState();
}

class _PrivateRoomBookingsState extends State<PrivateRoomBookings> {
  late Stream<List<BookingPrivateOfficeModel>> _privateStream;
  final BookingPrivateOfficeDao bookingPrivateOfficeDao= BookingPrivateOfficeDao();



  @override
  void initState() {
    _privateStream = bookingPrivateOfficeDao. getBookingPrivateOffices() as Stream<List<BookingPrivateOfficeModel>>;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Private room Bookings',),centerTitle: true,),

      body: StreamBuilder<List<BookingPrivateOfficeModel>>(
        stream: _privateStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();


          }
          final private = snapshot.data!;
          return ListView(

              children: private
                  .map((doc) => Card(
                color: Colors.white38,
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(margin:EdgeInsets.all(20),child: Text("Booking Id:  ${doc.bookingId}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:EdgeInsets.all(20),child: Text("Private Office Id: ${doc.privateOfficeId}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:EdgeInsets.all(20),child: Text("Company Id: ${doc.companyId}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:EdgeInsets.all(20),child: Text("Amount: ${doc.invoiceAmount}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:EdgeInsets.all(20),child: Text("comment: ${doc.comments}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),

                  ],
                ),
              ))
                  .toList());

        },),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AddPrivateRoomBookings(),
            );
          },
          tooltip: 'Add Location',
          icon: const Icon(Icons.add),
          label:

          const Text("Add Private Room Bookings")),
    );
  }
}