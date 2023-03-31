
import 'package:basic_app/pages/privateroom_booking_page.dart';
import 'package:flutter/material.dart';

import 'conferenceroom_booking.dart';

class AddBookings extends StatefulWidget {
  const AddBookings({Key? key}) : super(key: key);

  @override
  State<AddBookings> createState() => _AddBookingsState();
}

class _AddBookingsState extends State<AddBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Bookings"),centerTitle: true,),

        body: Column(

          children: [

            TextButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const ConferenceRoomBookingDetails()));
            }, child: const Text("Conference room Bookings",style: TextStyle(fontSize: 30),)),
            TextButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const PrivateRoomBookings()));

            }, child: const Text("Private Office Bookings",style: TextStyle(fontSize: 30),))
          ],
        )
    );
  }
}