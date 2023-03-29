import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/models/client_model.dart';
import 'package:flutter/material.dart';

import '../DAO/client_dao.dart';

class AddClient extends StatefulWidget {
  const AddClient({Key? key}) : super(key: key);

  @override
  AddClientState createState() => AddClientState();
}

class AddClientState extends BasePageState<AddClient> {
  ClientDao _clientDao=ClientDao();

  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _clientIdController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _billableSeatsController =
      TextEditingController();
  final TextEditingController _invoiceController = TextEditingController();
  final TextEditingController _meetingCreditController =
      TextEditingController();
  final TextEditingController _workingDaysController = TextEditingController();
  final TextEditingController _workingHrsController = TextEditingController();
  final TextEditingController _compCarParkingController =
      TextEditingController();
  final TextEditingController _paidCarParkingController =
      TextEditingController();
  final TextEditingController _compBikeParkingController =
      TextEditingController();
  final TextEditingController _paidBikeParkingController =
      TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _lockInPeriodController = TextEditingController();
  final TextEditingController _noticePeriodController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _signatureController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            textArea(_clientIdController, "ClientId"),
            textArea(_clientNameController, "ClientName"),
            textArea(_addressController, "Address"),
            textArea(_panController, "PAN"),
            textArea(_gstController, "GST"),
            textArea(_contactNameController, "Contact Name"),
            textArea(_contactNumberController, "Contact  Number"),
            textArea(_sizeController, "Size "),
            textArea(_billableSeatsController, "Billable Seats"),
            textArea(_invoiceController, "Invoice Amount"),
            textArea(_meetingCreditController, "Meeting Credit"),
            textArea(_workingDaysController, "Working Days"),
            textArea(_workingHrsController, "Working Hours"),
            textArea(_compCarParkingController, "Complimentary Car Parking"),
            textArea(_paidCarParkingController, "Paid Car Parking"),
            textArea(_compBikeParkingController, "Complimentary Bike Parking"),
            textArea(_paidBikeParkingController, "Paid Bike Parking"),
            textArea(_startDateController, "Starting Date"),
            textArea(_lockInPeriodController, "Lock in Period"),
            textArea(_noticePeriodController, "Notice Period"),
            textArea(_endDateController, "End Date"),
            textArea(_signatureController, "Signature"),
            textArea(_remarkController, "Remark"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                _clientDao.addClient(ClientModel(
                    clientID: _clientIdController.text,
                    clientName: _clientNameController.text,
                    address: _addressController.text,
                    PAN: _panController.text,
                    GST: _gstController.text,
                    primaryContact: _contactNameController.text,
                    primaryContactNumber: _contactNumberController.text,
                    size: _sizeController.text,
                    billableSeats: _billableSeatsController.text,
                    invoiceAmount: _invoiceController.text,
                    meetingCredits: _meetingCreditController.text,
                    workingDays: _workingDaysController.text,
                    workingHrs: _workingHrsController.text,
                    complimentaryCarParking: _compCarParkingController.text,
                    paidCarParking: _paidCarParkingController.text,
                    complimentaryBikeParking: _compBikeParkingController.text,
                    paidBikeParking: _paidBikeParkingController.text,
                    contractStartDate: _startDateController.text,
                    lockInPeriod: _lockInPeriodController.text,
                    noticePeriod: _noticePeriodController.text,
                    contractEndDate: _endDateController.text,
                    signature: _signatureController.text,
                    remarks: _remarkController.text));
                _clientIdController.clear();
                _clientNameController.clear();
                _addressController.clear();
                _panController.clear();
                _gstController.clear();
                _contactNameController.clear();
                _contactNumberController.clear();
                _sizeController.clear();
                _billableSeatsController.clear();
                _invoiceController.clear();
                _meetingCreditController.clear();
                _workingDaysController.clear();
                _workingHrsController.clear();
                _compCarParkingController.clear();
                _paidCarParkingController.clear();
                _compBikeParkingController.clear();
                _paidBikeParkingController.clear();
                _startDateController.clear();
                _lockInPeriodController.clear();
                _noticePeriodController.clear();
                _endDateController.clear();
                _signatureController.clear();
                _remarkController.clear();
              },
              child: const Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
