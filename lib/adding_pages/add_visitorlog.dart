import 'package:flutter/material.dart';

import '../DAO/visitorlog_dao.dart';
import '../models/visitorlog_model.dart';

class AddVisitorLog extends StatefulWidget {
  const AddVisitorLog({Key? key}) : super(key: key);

  @override
  State<AddVisitorLog> createState() => _AddVisitorLogState();
}

class _AddVisitorLogState extends State<AddVisitorLog> {
  DateTime startVisitorDateTime = DateTime.now();
  DateTime endVisitorDateTime = DateTime.now();
  final TextEditingController _visitorIdSelected = TextEditingController();
  final TextEditingController _visitorNameSelected = TextEditingController();
  final TextEditingController _companyIdSelected = TextEditingController();
  final TextEditingController _clientIdSelected = TextEditingController();
  final TextEditingController _govtIdSelected = TextEditingController();
  final TextEditingController _idNumberSelected = TextEditingController();

  final VisitorLogDao visitorLogDao = VisitorLogDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitor Log'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                controller: _visitorIdSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Visitor Id",
                  labelText: 'Enter Visitor Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _visitorNameSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Visitor Name",
                  labelText: 'Enter Visitor Name',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _companyIdSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Company Id",
                  labelText: 'Enter Company Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _clientIdSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Client Id",
                  labelText: 'Enter Client Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _govtIdSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Government Id",
                  labelText: 'Enter Government Id',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _idNumberSelected,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Id Number",
                  labelText: 'Enter Id Number',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "select start date and time: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: pickStartDateTime,
                          child: Text(
                              '${startVisitorDateTime.day}/${startVisitorDateTime.month}/${startVisitorDateTime.year}  ${startVisitorDateTime.hour}:${startVisitorDateTime.minute}'))),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    "select End date and time: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: pickEndDateTime,
                          child: Text(
                              '${endVisitorDateTime.day}/${endVisitorDateTime.month}/${endVisitorDateTime.year}  ${endVisitorDateTime.hour}:${endVisitorDateTime.minute}')))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(20.0),
                  child: ElevatedButton(onPressed: (){
                    visitorLogDao.addVisitorLog(AddVisitorLogModel(visitorId: _visitorIdSelected.text,
                        visitorName: _visitorNameSelected.text,
                        companyId: _companyIdSelected.text, clientId: _clientIdSelected.text,
                        governmentId: _govtIdSelected.text,
                        idNumber: _idNumberSelected.text, startDateAndTime: startVisitorDateTime,
                        endDateAndTime: endVisitorDateTime));
                    _visitorNameSelected.clear();
                    _idNumberSelected.clear();
                    _govtIdSelected.clear();
                    _visitorIdSelected.clear();
                    _clientIdSelected.clear();
                    _companyIdSelected.clear();
                  }, child: Text("Add")))
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
      startVisitorDateTime = dateTime;
    });
  }

  Future<DateTime?> pickStartDate() => showDatePicker(
      context: context,
      initialDate: startVisitorDateTime,
      firstDate: DateTime(2014),
      lastDate: DateTime(2500));

  Future<TimeOfDay?> pickStartTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: startVisitorDateTime.hour,
          minute: startVisitorDateTime.minute));

  Future pickEndDateTime() async {
    DateTime? date = await pickStartDate();
    if (date == null) return;
    TimeOfDay? time = await pickStartTime();
    if (time == null) return;

    final dateTime =
    DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      endVisitorDateTime = dateTime;
    });
  }

  Future<DateTime?> pickEndDate() => showDatePicker(
      context: context,
      initialDate: endVisitorDateTime,
      firstDate: DateTime(2014),
      lastDate: DateTime(2500));

  Future<TimeOfDay?> pickEndTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: endVisitorDateTime.hour, minute: endVisitorDateTime.minute));
}