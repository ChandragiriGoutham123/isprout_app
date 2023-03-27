import 'package:basic_app/models/center_model.dart';
import 'package:basic_app/main/crud.dart';
import 'package:flutter/material.dart';

class CenterPage extends StatefulWidget {
  const CenterPage({Key? key}) : super(key: key);

  @override
  State<CenterPage> createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  late Stream<List<CenterModel>> _centersStream;

  @override
  void initState() {
    super.initState();
    _centersStream = Crud.readCenter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centers Available'),
      ),
      body: StreamBuilder<List<CenterModel>>(
        stream: _centersStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final centers = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Center ID')),
                DataColumn(label: Text('Center Name')),
                DataColumn(label: Text('Building Name')),
                DataColumn(label: Text('Location ID')),
                DataColumn(label: Text('Address')),
                DataColumn(label: Text('Pincode')),
                DataColumn(label: Text('Total Area')),
                DataColumn(label: Text('Efficiency')),
                DataColumn(label: Text('Number of Floors')),
                DataColumn(label: Text('Landline Number')),
                DataColumn(label: Text('Number of Car Parking')),
                DataColumn(label: Text('Number of Bike Parking')),
                DataColumn(label: Text('Contact Name')),
                DataColumn(label: Text('Contact Number')),
                DataColumn(label: Text('Start Time')),
                DataColumn(label: Text('End Time')),
              ],
              rows: centers
                  .map(
                    (center) => DataRow(cells: [
                  DataCell(Text(center.centerId)),
                  DataCell(Text(center.centerName)),
                  DataCell(Text(center.buildingName)),
                  DataCell(Text(center.locationId)),
                  DataCell(Text(center.address)),
                  DataCell(Text(center.pincode)),
                  DataCell(Text(center.area)),
                  DataCell(Text(center.efficiency)),
                  DataCell(Text(center.numberOfFloors)),
                  DataCell(Text(center.landLineNumber)),
                  DataCell(Text(center.numberOfCarParking)),
                  DataCell(Text(center.numberOfBikeParking)),
                  DataCell(Text(center.contactName)),
                  DataCell(Text(center.contactNumber)),
                  DataCell(Text(center.startTime)),
                  DataCell(Text(center.endTime)),
                ]),
              )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
