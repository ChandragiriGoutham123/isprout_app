import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/main/crud.dart';
import 'package:basic_app/models/private_offices_model.dart';
import 'package:flutter/material.dart';

class AddPrivateOffice extends StatefulWidget {
  const AddPrivateOffice({Key? key}) : super(key: key);

  @override
  AddPrivateOfficeState createState() => AddPrivateOfficeState();
}

class AddPrivateOfficeState extends BasePageState<AddPrivateOffice> {
  Crud crud = Crud();

  final TextEditingController _officeIdController = TextEditingController();
  final TextEditingController _officeNameController = TextEditingController();
  final TextEditingController _centerIdController = TextEditingController();
  final TextEditingController _billableSeatsController =
      TextEditingController();
  final TextEditingController _wsCountController = TextEditingController();
  final TextEditingController _wsSizeController = TextEditingController();
  final TextEditingController _managerCabinsController =
      TextEditingController();
  final TextEditingController _discussionRoomsController =
      TextEditingController();
  final TextEditingController _conferenceRoomsController =
      TextEditingController();
  final TextEditingController _pantryController = TextEditingController();
  final TextEditingController _receptionController = TextEditingController();
  final TextEditingController _breakoutsController = TextEditingController();
  final TextEditingController _ahuIdController = TextEditingController();

  @override
  void dispose() {
    _officeIdController.dispose();
    _officeNameController.dispose();
    _centerIdController.dispose();
    _billableSeatsController.dispose();
    _wsCountController.dispose();
    _wsSizeController.dispose();
    _managerCabinsController.dispose();
    _discussionRoomsController.dispose();
    _conferenceRoomsController.dispose();
    _pantryController.dispose();
    _receptionController.dispose();
    _breakoutsController.dispose();
    _ahuIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            textArea(_officeIdController, "Office Id"),
            textArea(_officeNameController, "Office Name"),
            textArea(_centerIdController, "Center Id"),
            textArea(_billableSeatsController, "Billable Seats"),
            textArea(_wsCountController, "WS Count"),
            textArea(_wsSizeController, "WS Size"),
            textArea(_managerCabinsController, "Manager Cabins"),
            textArea(_discussionRoomsController, "Discussion Rooms"),
            textArea(_conferenceRoomsController, "Conference Rooms"),
            textArea(_pantryController, "Pantry"),
            textArea(_receptionController, "Reception"),
            textArea(_breakoutsController, "Breakouts"),
            textArea(_ahuIdController, "AHU Id"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  crud.addPrivateOffice(PrivateOfficeModel(
                      privateOfficeId: _officeIdController.text,
                      privateOfficeName: _officeNameController.text,
                      centerId: _centerIdController.text,
                      billableSeats: _billableSeatsController.text,
                      wsCount: _wsCountController.text,
                      wsSize: _wsSizeController.text,
                      managerCabins: _managerCabinsController.text,
                      discussionRooms: _discussionRoomsController.text,
                      confRooms: _conferenceRoomsController.text,
                      pantry: _pantryController.text,
                      reception: _receptionController.text,
                      breakouts: _breakoutsController.text,
                      ahuId: _ahuIdController.text));
                  _officeIdController.clear();
                  _officeNameController.clear();
                  _centerIdController.clear();
                  _billableSeatsController.clear();
                  _wsCountController.clear();
                  _wsSizeController.clear();
                  _managerCabinsController.clear();
                  _discussionRoomsController.clear();
                  _conferenceRoomsController.clear();
                  _pantryController.clear();
                  _receptionController.clear();
                  _breakoutsController.clear();
                  _ahuIdController.clear();
                },
                child: const Text("Add")),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
