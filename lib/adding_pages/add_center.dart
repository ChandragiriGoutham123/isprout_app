import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/main/crud.dart';
import 'package:flutter/material.dart';

import '../models/center_model.dart';

class AddCenter extends StatefulWidget {
  const AddCenter({Key? key}) : super(key: key);

  @override
  AddCenterState createState() => AddCenterState();
}

class AddCenterState extends BasePageState<AddCenter> {
  Crud crud=Crud();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _centerNameController = TextEditingController();
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _locationIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _efficiencyController = TextEditingController();
  final TextEditingController _noOfFloorsController = TextEditingController();
  final TextEditingController _landLineNumController = TextEditingController();
  final TextEditingController _carParkingController = TextEditingController();
  final TextEditingController _bikeParkingController = TextEditingController();
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                textArea(_idController, "Id"),
                textArea(_centerNameController, "Center Name"),
                textArea(_buildingNameController, "Building Name"),
                textArea(_locationIdController, "Location Id"),
                textArea(_addressController, "Address"),
                textArea(_pincodeController, "Pincode"),
                textArea(_areaController, "Total Area"),
                textArea(_efficiencyController, "Efficiency"),
                textArea(_noOfFloorsController, "Number of Floors"),
                textArea(_landLineNumController, "LandLine Number "),
                textArea(_carParkingController, "Number of Car Parking"),
                textArea(_bikeParkingController, "Number Of Bike Parking"),
                textArea(_contactNameController, "Contact Name"),
                textArea(_contactNumberController, "contact Number"),
                textArea(_startTimeController, "Start time"),
                textArea(_endTimeController, "End Time"),
              ],
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  crud.addCenter(CenterModel(
                    centerId: _idController.text,
                    centerName: _centerNameController.text,
                    buildingName: _buildingNameController.text,
                    locationId: _locationIdController.text,
                    address: _addressController.text,
                    pincode: _pincodeController.text,
                    area: _areaController.text,
                    efficiency: _efficiencyController.text,
                    numberOfFloors: _noOfFloorsController.text,
                    landLineNumber: _landLineNumController.text,
                    numberOfCarParking: _carParkingController.text,
                    numberOfBikeParking: _bikeParkingController.text,
                    contactName: _contactNameController.text,
                    contactNumber: _contactNumberController.text,
                    startTime: _startTimeController.text,
                    endTime: _endTimeController.text,
                  ));

                  // Clear the text fields after adding the new center
                  _idController.clear();
                  _centerNameController.clear();
                  _buildingNameController.clear();
                  _locationIdController.clear();
                  _addressController.clear();
                  _pincodeController.clear();
                  _areaController.clear();
                  _efficiencyController.clear();
                  _noOfFloorsController.clear();
                  _landLineNumController.clear();
                  _carParkingController.clear();
                  _bikeParkingController.clear();
                  _contactNameController.clear();
                  _contactNumberController.clear();
                  _startTimeController.clear();
                  _endTimeController.clear();
                }
                ),

            const SizedBox(height: 30.0),


          ],
        ),
      ),
    );
  }
}
