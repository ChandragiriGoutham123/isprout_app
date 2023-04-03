import 'package:basic_app/DAO/event_management_dao.dart';
import 'package:basic_app/models/event_management_model.dart';
import 'package:flutter/material.dart';

class AddEventManagement extends StatefulWidget {
  const AddEventManagement({Key? key}) : super(key: key);

  @override
  State<AddEventManagement> createState() => _AddEventManagementState();
}

class _AddEventManagementState extends State<AddEventManagement> {
  DateTime startEventDateTime = DateTime.now();
  DateTime endEventDateTime = DateTime.now();
  final TextEditingController _eventIdSelected = TextEditingController();
  final TextEditingController _eventNameSelected = TextEditingController();
  final TextEditingController _eventDescription = TextEditingController();
  final TextEditingController _centerIdSelected = TextEditingController();
  final TextEditingController _contactNumberSelected = TextEditingController();
  final TextEditingController _vendorNameSelected = TextEditingController();
  final TextEditingController _vendorContactSelected = TextEditingController();

  final EventManagementDao eventManagementDao = EventManagementDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Management"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                controller: _eventIdSelected,
                autocorrect: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter  Event Id",
                  labelText: 'Booking Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _eventNameSelected,
                autocorrect: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter  Event Name",
                  labelText: 'EventName',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _eventDescription,
                autocorrect: true,
                maxLines: 5,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Write Event Description",
                    labelText: 'Event Description',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    prefix: Icon(Icons.comment)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _centerIdSelected,
                autocorrect: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter  Center Id",
                  labelText: 'Center Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "select start date and time: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: pickStartDateTime,
                          child: Text(
                              '${startEventDateTime.day}/${startEventDateTime.month}/${startEventDateTime.year}  ${startEventDateTime.hour}:${startEventDateTime.minute}'))),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  const Text(
                    "select End date and time: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: pickEndDateTime,
                          child: Text(
                              '${endEventDateTime.day}/${endEventDateTime.month}/${endEventDateTime.year}  ${endEventDateTime.hour}:${endEventDateTime.minute}')))
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _contactNumberSelected,
                autocorrect: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter  Contact Number",
                  labelText: 'Contact Number',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _vendorNameSelected,
                autocorrect: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter  Vendor Name",
                  labelText: 'Vendor Name',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _vendorContactSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter  Vendor Contact",
                  labelText: 'Vendor Contact Number',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.all(20.0),
                  child: ElevatedButton(onPressed: () {
                    eventManagementDao.addEventManagement(EventManagementModel(eventId: _eventIdSelected.text
                        , eventName: _eventNameSelected.text,
                        eventDescription: _eventDescription.text,
                        centerId: _centerIdSelected.text,
                        startDateAndTime: startEventDateTime,
                        endDateAndTime: endEventDateTime,
                        contactNumber: _contactNumberSelected.text,
                        vendorName: _vendorNameSelected.text,
                        vendorContact: _vendorContactSelected.text)

                    );
                    _eventIdSelected.clear();
                    _eventNameSelected.clear();
                    _eventDescription.clear();
                    _centerIdSelected.clear();
                    _contactNumberSelected.clear();
                    _vendorNameSelected.clear();
                    _vendorContactSelected.clear();
                  }, child: const Text("Add")))
            ],
          ),
        ),
      ),
    );
  }

  Future pickStartDateTime() async {
    DateTime? date = await pickStartDate();
    if (date == null) return;
    TimeOfDay? time = await pickStartTime();
    if (time == null) return;

    final dateTime =
    DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      startEventDateTime = dateTime;
    });
  }

  Future<DateTime?> pickStartDate() => showDatePicker(
      context: context,
      initialDate: startEventDateTime,
      firstDate: DateTime(2014),
      lastDate: DateTime(2500));

  Future<TimeOfDay?> pickStartTime() => showTimePicker(
      context: context,
      initialTime:
      TimeOfDay(hour: startEventDateTime.hour, minute: startEventDateTime.minute));

  Future pickEndDateTime() async {
    DateTime? date = await pickStartDate();
    if (date == null) return;
    TimeOfDay? time = await pickStartTime();
    if (time == null) return;

    final dateTime =
    DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      endEventDateTime = dateTime;
    });
  }

  Future<DateTime?> pickEndDate() => showDatePicker(
      context: context,
      initialDate: endEventDateTime,
      firstDate: DateTime(2014),
      lastDate: DateTime(2500));

  Future<TimeOfDay?> pickEndTime() => showTimePicker(
      context: context,
      initialTime:
      TimeOfDay(hour: endEventDateTime.hour, minute: endEventDateTime.minute));
}