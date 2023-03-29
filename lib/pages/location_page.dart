import 'package:basic_app/adding_pages/add_location.dart';
import 'package:basic_app/models/location_model.dart';
import 'package:flutter/material.dart';

import '../DAO/location_dao.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late Stream<List<LocationModel>> _locationStream;
  final LocationDao _locationDao=LocationDao();

  @override
  void initState() {
    super.initState();
    _locationStream = _locationDao.getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Locations Available')),
      body: StreamBuilder<List<LocationModel>>(
        stream: _locationStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          final locations = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Location Id")),
                DataColumn(label: Text("Location Name")),
                DataColumn(label: Text("State")),
                DataColumn(label: Text("Country")),
              ],
              rows: locations
                  .map(
                    (location) => DataRow(cells: [
                      DataCell(Text(location.locationId)),
                      DataCell(Text(location.locationName)),
                      DataCell(Text(location.state)),
                      DataCell(Text(location.country)),
                    ]),
                  )
                  .toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AddLocation(),
            );
          },
          tooltip: 'Add Location',
          icon: const Icon(Icons.add),
          label:

          const Text("Add Location")),

    );
  }
}
