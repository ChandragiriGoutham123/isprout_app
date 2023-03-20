import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'centers.dart';

class Location {
  final String name;
  final List<Centers> centers;
  final double area;

  Location({required this.name, required this.centers, required this.area});
}

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationsState();
}

class _LocationsState extends State<LocationPage> {
  List<Location> locations = [
    Location(name: 'Hyderabad', area: 1000, centers: [
      Centers(area: 1000, name: "Kphb", floors: 5, parking: 30),
      Centers(area: 1000, name: "Kphb", floors: 5, parking: 30),
      Centers(area: 1000, name: "Kphb", floors: 5, parking: 30)
    ]),
    Location(name: 'chennai', area: 1000, centers: [
      Centers(area: 1000, name: "Kphb", floors: 5, parking: 30),
      Centers(area: 1000, name: "Kphb", floors: 5, parking: 30),
      Centers(area: 1000, name: "Kphb", floors: 5, parking: 30)
    ]),
    Location(name: 'bangalore', area: 1000, centers: [
      Centers(area: 1000, name: "Kphb", floors: 5, parking: 30),
      Centers(area: 1000, name: "Kphb", floors: 5, parking: 30),
      Centers(area: 1000, name: "Kphb", floors: 5, parking: 30)
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Locations')),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(locations[index].name),
            subtitle: Text('No.of Centers ${locations[index].centers.length}'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CenterPage(),));
            },
          );
        },
      ),
    );
  }
}
