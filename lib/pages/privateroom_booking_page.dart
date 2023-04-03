import 'package:basic_app/DAO/booking_private_offices_dao.dart';
import 'package:basic_app/models/booking_private_office_model.dart';
import 'package:flutter/material.dart';
import '../adding_pages/add_privateroom_booking.dart';


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
    _privateStream = bookingPrivateOfficeDao. getBookingPrivateOffices();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Private room Bookings',),centerTitle: true,),

      body: StreamBuilder<List<BookingPrivateOfficeModel>>(
        stream: _privateStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();


          }
          final private = snapshot.data!;
          return ListView(

              children: private
                  .map((doc) => Card(
                color: Colors.white38,
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(margin:const EdgeInsets.all(20),child: Text("Booking Id:  ${doc.bookingId}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("Private Office Id: ${doc.privateOfficeId}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("Company Id: ${doc.companyId}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("Amount: ${doc.invoiceAmount}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("comment: ${doc.comments}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),

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