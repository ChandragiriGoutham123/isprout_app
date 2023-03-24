import 'package:basic_app/main/base_page.dart';
import 'package:flutter/material.dart';

class AddCenter extends StatefulWidget {
  const AddCenter({Key? key}) : super(key: key);

  @override
  _AddCenterState createState() => _AddCenterState();
}

class _AddCenterState extends BasePageState<AddCenter> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _centerNameController = TextEditingController();
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _locationIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _efficiencyController = TextEditingController();
  final TextEditingController _NoOfFloorsController = TextEditingController();
  final TextEditingController _landlinenumController = TextEditingController();
  final TextEditingController _carparkingController = TextEditingController();
  final TextEditingController _bikeparkingController = TextEditingController();
  final TextEditingController _contactnameController = TextEditingController();
  final TextEditingController _contactnumberController = TextEditingController();
  final TextEditingController _starttimeController = TextEditingController();
  final TextEditingController _endtimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textArea(_idController, "Id"),
          textArea(_centerNameController, "Center Name"),
        textArea(_buildingNameController, "Building Name"),
        textArea(_locationIdController, "Location Id"),
        textArea(_addressController,"Address"),
        textArea(_pincodeController, "Pincode"),
        textArea(_areaController, "Total Area"),
        textArea(_efficiencyController,"Efficiency"),
        textArea(_NoOfFloorsController, "Number of Floors"),
        textArea(_landlinenumController, "LandLine Number "),
        textArea(_carparkingController, "Number of Car Parking"),
        textArea(_bikeparkingController, "Number Of Bike Parking"),
        textArea(_contactnameController, "Contact Name"),
        textArea(_contactnumberController, "contact Number"),
        textArea(_starttimeController, "Start time"),
        textArea(_endtimeController,"end Time"),
        const SizedBox(height: 30.0,),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: () {

          }

        ),
]
    ),);
  }
}
