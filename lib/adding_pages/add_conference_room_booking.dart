import 'package:basic_app/DAO/booking_conference_room_dao.dart';
import 'package:basic_app/models/booking_conference_room_model.dart';
import 'package:flutter/material.dart';

class AddConferenceRoomBookings extends StatefulWidget {
  const AddConferenceRoomBookings({Key? key}) : super(key: key);

  @override
  State<AddConferenceRoomBookings> createState() => _AddConferenceRoomBookingsState();
}

class _AddConferenceRoomBookingsState extends State<AddConferenceRoomBookings> {
  DateTime startDateTime=DateTime.now();
  DateTime endDateTime = DateTime.now();
  final TextEditingController _bookingIdSelected = TextEditingController();
  final TextEditingController _companyIdSelected = TextEditingController();
  final TextEditingController _conferenceRoomIdSelected = TextEditingController();
  final TextEditingController _invoiceAmountSelected = TextEditingController();
  final TextEditingController _descriptionSelected = TextEditingController();


  final BookingConferenceRoomDao bookingConferenceRoomDao = BookingConferenceRoomDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('conference room booking'),centerTitle: true,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.all(25.0),
          child: Column(

            children: <Widget> [

              TextField(
                controller: _bookingIdSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Booking Id",
                  labelText: 'Booking Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),const SizedBox(height: 20.0,),
              TextField(
                controller: _companyIdSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Company Id",
                  labelText: 'Company Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),const SizedBox(height: 20.0,),
              TextField(
                controller: _conferenceRoomIdSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Conference room  Id",
                  labelText: 'conference room Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),const SizedBox(height: 20.0,),
              Row(

                children: [
                  const Text("select start date and time: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child:

                      ElevatedButton(onPressed: pickStartDateTime

                          , child: Text('${startDateTime.day}/${startDateTime.month}/${startDateTime.year}  ${startDateTime.hour}:${startDateTime.minute}'))
                  ),
                ],
              ),const SizedBox(height: 20.0,),Row(
                children: [

                  const Text("select End date and time: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child:

                      ElevatedButton(onPressed: pickEndDateTime

                          , child: Text('${endDateTime.day}/${endDateTime.month}/${endDateTime.year}  ${endDateTime.hour}:${endDateTime.minute}'))
                  )],
              ),const SizedBox(height: 20.0,),
              TextField(
                controller: _invoiceAmountSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Invoice Amount",
                    labelText: 'Enter Invoice Amount',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.currency_rupee)
                ),
              ),const SizedBox(height: 20,),
              TextField(
                controller: _descriptionSelected,
                autocorrect: true,
                maxLines: 5,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Write Problem Description",
                    labelText: 'Describe your problem',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    prefix: Icon(Icons.comment)),
              ),Container(margin:const EdgeInsets.all(20.0),child: ElevatedButton(onPressed: (){
                bookingConferenceRoomDao.addBookingConferenceRooms(BookingConferenceRoomModel(
                    bookingId: _bookingIdSelected.text, companyId: _companyIdSelected.text,
                    conferenceRoomId: _conferenceRoomIdSelected.text,
                    startingDateTime: startDateTime, endingDateTime: endDateTime,
                    amount: _invoiceAmountSelected.text, comment: _descriptionSelected.text));
                _bookingIdSelected.clear();
                _companyIdSelected.clear();
                _conferenceRoomIdSelected.clear();
                _invoiceAmountSelected.clear();
                _descriptionSelected.clear();
              }, child: const Text("Add"))),


            ],
          ),
        ),
      ),
    );
  }
  Future pickStartDateTime()async{
    DateTime? date = await pickStartDate();
    if (date== null) return;
    TimeOfDay? time= await pickStartTime();
    if (time==null) return;

    final dateTime= DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute
    );
    setState(() {
      startDateTime=dateTime;
    });
  }
  Future<DateTime?>pickStartDate() => showDatePicker(
      context: context, initialDate: startDateTime, firstDate: DateTime(2014), lastDate: DateTime(2500));
  Future<TimeOfDay?>pickStartTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: startDateTime.hour, minute: startDateTime.minute));
  Future pickEndDateTime()async{
    DateTime? date = await pickStartDate();
    if (date== null) return;
    TimeOfDay? time= await pickStartTime();
    if (time==null) return;

    final dateTime= DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute
    );
    setState(() {
      endDateTime=dateTime;
    });
  }
  Future<DateTime?>pickEndDate() => showDatePicker(
      context: context, initialDate: endDateTime, firstDate: DateTime(2014), lastDate: DateTime(2500));
  Future<TimeOfDay?>pickEndTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: endDateTime.hour, minute: endDateTime.minute));
}