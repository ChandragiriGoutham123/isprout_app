import 'package:basic_app/DAO/booking_private_offices_dao.dart';
import 'package:basic_app/models/booking_private_office_model.dart';
import 'package:flutter/material.dart';

class AddPrivateRoomBookings extends StatefulWidget {
  const AddPrivateRoomBookings({Key? key}) : super(key: key);

  @override
  State<AddPrivateRoomBookings> createState() => _AddPrivateRoomBookingsState();
}

class _AddPrivateRoomBookingsState extends State<AddPrivateRoomBookings> {
  final TextEditingController _bookingId = TextEditingController();
  final TextEditingController _privateOfficeId = TextEditingController();
  final TextEditingController _companyId = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _comments = TextEditingController();

  final BookingPrivateOfficeDao bookingPrivateOfficeDao = BookingPrivateOfficeDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Private room booking'), centerTitle: true,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(25.0),
          child: Column(

            children: <Widget>[

              TextField(
                controller: _bookingId,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Booking Id",
                  labelText: 'Booking Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0,),
              TextField(
                controller: _privateOfficeId,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Private office Id",
                  labelText: 'Private office Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0,),
              TextField(
                controller: _companyId,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Company Id",
                  labelText: 'Company Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0,),
              SizedBox(height: 20.0,),
              TextField(
                controller: _amount,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Invoice Amount",
                    labelText: 'Enter Invoice Amount',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.currency_rupee)
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _comments,
                autocorrect: true,
                maxLines: 5,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Write Problem Description",
                    labelText: 'Describe your problem',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    prefix: Icon(Icons.comment)),
              ),
              Container(margin: EdgeInsets.all(20.0),
                  child: ElevatedButton(onPressed: () {
                    bookingPrivateOfficeDao.addBookingPrivateOffices(
                        BookingPrivateOfficeModel(bookingId: _bookingId.text,
                            privateOfficeId: _privateOfficeId.text,
                            companyId: _companyId.text,
                            invoiceAmount: _amount.text,
                            comments: _comments.text));
                    _bookingId.clear();
                    _privateOfficeId.clear();
                    _companyId.clear();
                    _amount.clear();
                    _comments.clear();
                  }, child: Text("Add")))

            ],
          ),
        ),
      ),
    );;
  }
}
