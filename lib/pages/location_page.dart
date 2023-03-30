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

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

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
                      DataCell(IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Update Location"),
                              content: StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        textArea(_idController, "Location Id"),
                                        // add location id field
                                        textArea(
                                            _nameController, "Location Name"),
                                        textArea(_stateController, "State"),
                                        textArea(_countryController, "Country"),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Cancel"),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                TextButton(
                                  child: const Text("Update"),
                                  onPressed: () {
                                    final LocationModel updatedLocation =
                                        LocationModel(
                                      locationId: _idController.text,
                                      locationName: _nameController.text,
                                      state: _stateController.text,
                                      country: _countryController.text,
                                    );
                                    _locationDao
                                        .updateLocation(updatedLocation);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ))
                    ]),
                  )
                  .toList(),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
        ],
      ),
    );
  }
}
