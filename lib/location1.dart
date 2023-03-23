import 'package:flutter/material.dart';

class LocationPage1 extends StatefulWidget {
  const LocationPage1({Key? key}) : super(key: key);

  @override
  State<LocationPage1> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage1> {
TextEditingController _nameController=TextEditingController();
TextEditingController _cityController=TextEditingController();
@override
  void dispose() {
  _nameController.dispose();
  _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Available')),
      body:Column(
        children:<Widget> [
          TextField(
            controller: _nameController,
            decoration:InputDecoration(labelText:'Location name'),
          ),
          TextField(
            controller: _cityController,
            decoration: InputDecoration(labelText: 'city name'),),
          ElevatedButton(
            child: const Text('Add'),
            onPressed: () {

            },

          ),
        ],
      )


    );
  }

}


