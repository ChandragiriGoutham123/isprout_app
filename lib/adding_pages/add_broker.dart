import 'package:basic_app/DAO/broker-dao.dart';
import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/models/broker_model.dart';
import 'package:flutter/material.dart';

class AddBroker extends StatefulWidget {
  const AddBroker({Key? key}) : super(key: key);

  @override
  AddBrokerState createState() => AddBrokerState();
}

class AddBrokerState extends BasePageState<AddBroker> {
  final BrokerDao _brokerDao = BrokerDao();

  final TextEditingController _brokerID = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _brokerFirmID = TextEditingController();
  final TextEditingController _locationID = TextEditingController();
  final TextEditingController _position = TextEditingController();
  final TextEditingController _department = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            textArea(_brokerID, "Broker Id"),
            textArea(_name, "Broker Name"),
            textArea(_brokerFirmID, "Broker FirmId"),
            textArea(_locationID, "Location Id"),
            textArea(_position, "Position"),
            textArea(_department, "Department"),
            textArea(_phoneNumber, "PhoneNumber"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  _brokerDao.addBroker(BrokerModel(
                      brokerID: _brokerID.text,
                      name: _name.text,
                      brokerFirmID: _brokerFirmID.text,
                      locationID: _locationID.text,
                      position: _position.text,
                      department: _department.text,
                      phoneNumber: _phoneNumber.text));
                  _brokerID.clear();
                  _name.clear();
                  _brokerFirmID.clear();
                  _locationID.clear();
                  _position.clear();
                  _department.clear();
                  _phoneNumber.clear();
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
