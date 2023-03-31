import 'package:basic_app/adding_pages/add_parking.dart';
import 'package:basic_app/main/drawer_widget.dart';
import 'package:flutter/material.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({Key? key}) : super(key: key);

  @override
  State<ParkingPage> createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Parking Allotment"),centerTitle: true,),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AddParkingPage(),
            );
          },
          tooltip: 'Add PrivateOffice',
          icon: const Icon(Icons.add),
          label:

          const Text("Add Parking")),
    );
  }
}
