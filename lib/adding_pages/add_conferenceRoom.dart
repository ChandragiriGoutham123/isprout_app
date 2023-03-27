import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/main/crud.dart';
import 'package:basic_app/models/conferenceRoom_model.dart';
import 'package:flutter/material.dart';

class AddConferenceRoom extends StatefulWidget {
  const AddConferenceRoom({Key? key}) : super(key: key);

  @override
  AddConferenceRoomState createState() => AddConferenceRoomState();
}

class AddConferenceRoomState extends BasePageState<AddConferenceRoom> {
  Crud crud = Crud();

  final TextEditingController _roomIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _centerIdController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _seatsController = TextEditingController();
  final TextEditingController _creditController = TextEditingController();
  final TextEditingController _avController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            textArea(_roomIdController, "Room Id"),
            textArea(_nameController, "Room Name"),
            textArea(_centerIdController, "Center Id"),
            textArea(_sizeController, "Size of Room"),
            textArea(_seatsController, "Number Of Seats"),
            textArea(_creditController, "Credit For 30Mins"),
            textArea(_avController, "Is Available"),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              crud.addConference(ConferenceRoomModel(
                  meetingRoomId: _roomIdController.text,
                  meetingRoomName: _nameController.text,
                  centerId: _centerIdController.text,
                  size: _sizeController.text,
                  informalSeats: _seatsController.text,
                  creditFor30Mins: _creditController.text,
                  av: _avController.text));
              _roomIdController.clear();
              _nameController.clear();
              _centerIdController.clear();
              _sizeController.clear();
              _seatsController.clear();
              _creditController.clear();
              _avController.clear();
            }, child: Text("Add"))

          ],
        ),
      ),


    );
  }
}
