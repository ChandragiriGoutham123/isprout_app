

import 'package:flutter/material.dart';

class Centers{
 final String name;
 final int floors;
 final double area;
 final int parking;

 Centers({required this.area,  required this.name, required this.floors, required this.parking});
}
class CenterPage extends StatefulWidget {
  const CenterPage({Key? key}) : super(key: key);

  @override
  State<CenterPage> createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  List<Centers> centers=[
    Centers(area: 1000, name: "Kphb", floors: 5, parking: 30),
    Centers(area: 1000, name: "Kphb", floors: 5, parking: 30),
    Centers(area: 1000, name: "Kphb", floors: 5, parking: 30)
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     appBar: AppBar(title: const Text('Centers Available')),
     body:ListView.builder(
         itemCount:centers.length,
         itemBuilder: (context,int index){
           return ListTile(
             title: Text(centers[index].name),
           );
         }
     )
    );
  }
}

