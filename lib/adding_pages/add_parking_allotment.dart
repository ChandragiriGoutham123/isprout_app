import 'package:flutter/material.dart';

class AddParkingPage extends StatefulWidget {
  const AddParkingPage({Key? key}) : super(key: key);

  @override
  State<AddParkingPage> createState() => _AddParkingPageState();
}

class _AddParkingPageState extends State<AddParkingPage> {
  DateTime startParkingDateTime = DateTime.now();
  DateTime endParkingDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parking Allotment"),),
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const TextField(

              autocorrect: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter ParkingLot Id",
                labelText: 'Enter parkingLot Id',
                labelStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),const SizedBox(
              height: 20,
            ),const TextField(

              autocorrect: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Allocated To",
                labelText: 'Allocated To',
                labelStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),const SizedBox(
              height: 20,
            ),const TextField(

              autocorrect: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Sell Price",
                labelText: 'Sell Price',
                labelStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),const SizedBox(
              height: 20,
            ),Row(
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
                            '${startParkingDateTime.day}/${startParkingDateTime.month}/${startParkingDateTime.year}  ${startParkingDateTime.hour}:${startParkingDateTime.minute}'))),
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
                            '${endParkingDateTime.day}/${endParkingDateTime.month}/${endParkingDateTime.year}  ${endParkingDateTime.hour}:${endParkingDateTime.minute}')))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: const ElevatedButton(onPressed: null, child: Text("Add")))
          ],
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
      startParkingDateTime = dateTime;
    });
  }

  Future<DateTime?> pickStartDate() => showDatePicker(
      context: context,
      initialDate: startParkingDateTime,
      firstDate: DateTime(2014),
      lastDate: DateTime(2500));

  Future<TimeOfDay?> pickStartTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: startParkingDateTime.hour,
          minute: startParkingDateTime.minute));

  Future pickEndDateTime() async {
    DateTime? date = await pickStartDate();
    if (date == null) return;
    TimeOfDay? time = await pickStartTime();
    if (time == null) return;

    final dateTime =
    DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      endParkingDateTime = dateTime;
    });
  }

  Future<DateTime?> pickEndDate() => showDatePicker(
      context: context,
      initialDate: endParkingDateTime,
      firstDate: DateTime(2014),
      lastDate: DateTime(2500));

  Future<TimeOfDay?> pickEndTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: endParkingDateTime.hour, minute: endParkingDateTime.minute));
}