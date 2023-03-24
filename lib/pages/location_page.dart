import 'package:basic_app/main/crud.dart';
import 'package:basic_app/models/location_model.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Locations Available')),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'Location Id'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'location name'),
            ),
            TextField(
              controller: _stateController,
              decoration: const InputDecoration(labelText: 'state'),
            ),
            TextField(
              controller: _countryController,
              decoration: const InputDecoration(labelText: 'country'),
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                Crud.createLocation(LocationModel(locationId: _idController.text,
                    locationName: _nameController.text,
                    state: _stateController.text,
                    country: _countryController.text
                )
                );
              },
            ),
          ],
        ));
  }
}
