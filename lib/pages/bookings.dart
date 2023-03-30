import 'package:basic_app/main/drawer_widget.dart';
import 'package:basic_app/pages/conference_room_bookings.dart';
import 'package:basic_app/pages/private_room_bookings.dart';

import 'package:flutter/material.dart';

class AddBookings extends StatefulWidget {
  const AddBookings({Key? key}) : super(key: key);

  @override
  State<AddBookings> createState() => _AddBookingsState();
}

class _AddBookingsState extends State<AddBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookings"),centerTitle: true,),
      drawer: MyDrawer(),
      body: Column(

        children: [

          TextButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const ConferenceRoomBookingDetails()));
          }, child: Text("Conference room Bookings",style: TextStyle(fontSize: 30),)),
          TextButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const PrivateRoomBookings()));

          }, child: Text("Private Office Bookings",style: TextStyle(fontSize: 30),))
        ],
      )
    );
  }
}
