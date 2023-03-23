import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocationPage1 extends StatefulWidget {
  const LocationPage1({Key? key}) : super(key: key);

  @override
  State<LocationPage1> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Available')),
      body:

           ElevatedButton(
            child: const Text('Add'),
            onPressed: () {
              _create();
            },

      ),
    );
  }
}

Future _create() async {
  final locationcollection = FirebaseFirestore.instance.collection('Locations');
  final docref = locationcollection.doc('user-id');
  await docref.set({
    'name': 'Hyderbad',
    'city': 'Kphb'
  });
}
