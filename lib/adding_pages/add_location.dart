
import 'package:basic_app/main/base_page.dart';
import 'package:flutter/material.dart';
import '../DAO/location_dao.dart';
import '../models/location_model.dart';

class AddLocation extends StatefulWidget {
  const AddLocation(

      {Key? key}) : super(key: key);

  @override
  AddLocationState createState() => AddLocationState();
}

class AddLocationState extends BasePageState<AddLocation> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {  
    _idController.dispose();
    _nameController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    super.dispose();
  }
  final LocationDao _locationDao= LocationDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          textArea(_idController,"Location Id"),
          textArea(_nameController,"Location Name"),
          textArea(_stateController,"State"),
          textArea(_countryController,"Country"),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
            child: const Text('Add'),
            onPressed: () {
              _locationDao.addLocation(LocationModel(
                  locationId: _idController.text,
                  locationName: _nameController.text,
                  state: _stateController.text,
                  country: _countryController.text));

              _idController.clear();
              _nameController.clear();
              _stateController.clear();
              _countryController.clear();
            },
          ),
        ]),
      ),
    );
  }
}
