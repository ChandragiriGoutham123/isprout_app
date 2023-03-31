import 'package:basic_app/DAO/location_dao.dart';
import 'package:basic_app/adding_pages/add_location.dart';
import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/models/location_model.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  LocationPageState createState() => LocationPageState();
}

class LocationPageState extends BasePageState<LocationPage> {
 late Stream<List<LocationModel>> _locationStream;
  final LocationDao _locationDao = LocationDao();

  @override
  void initState() {
    _locationStream = _locationDao.getLocations();
    super.initState();
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
                DataColumn(label: Text("Update")),
              ],
              rows: locations
                  .map(
                    (location) => DataRow(cells: [
                      DataCell(Text(location.locationId)),
                      DataCell(Text(location.locationName)),
                      DataCell(Text(location.state)),
                      DataCell(Text(location.country)),
                      DataCell(IconButton(onPressed: () {
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>const AddLocation()));
                      }, icon: const Icon(Icons.edit)
                      ),)
                    ]),
                  )
                  .toList(),
            ),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton.extended(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const AddLocation(),
              );
            },
            tooltip: 'Add Location',
            icon: const Icon(Icons.add),
            label: const Text("Add Location"),
          ),
    );
  }
}
