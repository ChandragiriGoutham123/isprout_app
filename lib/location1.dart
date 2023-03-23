
import 'package:flutter/material.dart';



class LocationPage1 extends StatefulWidget {
  const LocationPage1({Key? key}) : super(key: key);

  @override
  State<LocationPage1> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage1> {
  final controllername=TextEditingController();
  final controllercity=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Available')),
      body: ListView(
        children: <Widget>[
          TextField(decoration:InputDecoration(labelText: ('Location Name')),
          controller: controllername,
          ),
          TextField(decoration: InputDecoration(labelText: ('city')),
          controller: controllercity,
          ),
          ElevatedButton(
            child: Text('Add'),
            onPressed: (){


            },
          )
        ],
      ),
    );
  }
}

Future _create() async{
  final locationcollection=Fireba
}