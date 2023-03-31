import 'package:basic_app/main/base_page.dart';
import 'package:flutter/material.dart';
import '../DAO/location_dao.dart';
import '../models/location_model.dart';

class AddLocation extends StatefulWidget {
  final String? locationId;

  const AddLocation(this.locationId, {Key? key}) : super(key: key);

  @override
  AddLocationState createState() => AddLocationState(locationId);
}

class AddLocationState extends BasePageState<AddLocation> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final String? locationId;

  AddLocationState(this.locationId);

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  final LocationDao _locationDao = LocationDao();

  @override
  void initState() {
    super.initState();
    if (locationId != null) {
      _locationDao.getLocation(locationId!).then((location) {
        _idController.text = location.locationId;
        _nameController.text = location.locationName;
        _countryController.text = location.country;
        _stateController.text = location.state;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          textArea(_idController, "Location Id", enabled: locationId == null),
          textArea(_nameController, "Location Name"),
          textArea(_stateController, "State"),
          textArea(_countryController, "Country"),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  _locationDao.saveLocation(LocationModel(
                      locationId: _idController.text,
                      locationName: _nameController.text,
                      state: _stateController.text,
                      country: _countryController.text));
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel"))
            ],
          ),
        ]),
      ),
    );
  }
}
