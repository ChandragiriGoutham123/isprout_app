import 'package:basic_app/DAO/vendors_dao.dart';
import 'package:basic_app/adding_pages/add_vendor.dart';
import 'package:flutter/material.dart';

import '../models/vendors.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({Key? key}) : super(key: key);

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  late Stream<List<VendorModel>> _vendorStream;
  final VendorsDao _vendorsDao = VendorsDao();

  @override
  void initState() {
    _vendorStream = _vendorsDao.getVendor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vendors"),
      ),
      body: StreamBuilder<List<VendorModel>>(
        stream: _vendorStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final vendor = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: const [
                  DataColumn(label: Text("Vendor ID")),
                  DataColumn(label: Text("Vendor Name")),
                  DataColumn(label: Text("Firm Name")),
                  DataColumn(label: Text("Description")),
                  DataColumn(label: Text("Address")),
                  DataColumn(label: Text("Department Id")),
                  DataColumn(label: Text("Primary Contact")),
                  DataColumn(label: Text("PAN")),
                  DataColumn(label: Text("GST"))
                ],
                rows: vendor
                    .map((ven) => DataRow(cells: [
                          DataCell(Text(ven.vendorID)),
                          DataCell(Text(ven.vendorName)),
                          DataCell(Text(ven.firmName)),
                          DataCell(Text(ven.description)),
                          DataCell(Text(ven.address)),
                          DataCell(Text(ven.departmentID)),
                          DataCell(Text(ven.primaryContact)),
                          DataCell(Text(ven.PAN)),
                          DataCell(Text(ven.GST))
                        ]))
                    .toList()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(context: context, builder: (_) => const AddVendor());
          },
          tooltip: "Add Vendor",
          icon: const Icon(Icons.add),
          label: const Text("Add Vendor")),
    );
  }
}
