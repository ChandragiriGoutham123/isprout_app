import 'package:basic_app/DAO/vendors_dao.dart';
import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/models/vendors.dart';
import 'package:flutter/material.dart';

class AddVendor extends StatefulWidget {
  const AddVendor({Key? key}) : super(key: key);

  @override
  AddVendorState createState() => AddVendorState();
}

class AddVendorState extends BasePageState<AddVendor> {
  final TextEditingController _vendorID = TextEditingController();
  final TextEditingController _vendorName = TextEditingController();
  final TextEditingController _firmName = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _departmentID = TextEditingController();
  final TextEditingController _primaryContact = TextEditingController();
  final TextEditingController _PAN = TextEditingController();
  final TextEditingController _GST = TextEditingController();

  VendorsDao _vendorsDao = VendorsDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            textArea(_vendorID, "Vendor Id"),
            textArea(_vendorName, "Vendor Name"),
            textArea(_firmName, "Firm Name"),
            textArea(_description, "Description"),
            textArea(_address, "Address"),
            textArea(_departmentID, "Department Id"),
            textArea(_primaryContact, "Primary Contact"),
            textArea(_PAN, "PAN"),
            textArea(_GST, "GST"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  _vendorsDao.addVendor(VendorModel(
                      vendorID: _vendorID.text,
                      vendorName: _vendorName.text,
                      firmName: _firmName.text,
                      description: _description.text,
                      address: _address.text,
                      departmentID: _departmentID.text,
                      primaryContact: _primaryContact.text,
                      PAN: _PAN.text,
                      GST: _GST.text));
                  _vendorID.clear();
                  _vendorName.clear();
                  _firmName.clear();
                  _description.clear();
                  _address.clear();
                  _departmentID.clear();
                  _primaryContact.clear();
                  _PAN.clear();
                  _GST.clear();
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
