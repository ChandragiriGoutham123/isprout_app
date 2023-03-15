import 'package:flutter/material.dart';
import 'places.dart';
void main()=>runApp(const MaterialApp(
  home:Location(),
));

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Places> location=[
    Places( name: 'Hyderabad'),
    Places( name: 'Chennai'),
    Places( name: 'Pune'),
    Places( name: 'Visakha Pattanam'),
    Places( name: 'Nellore')
  ];
  Widget locationTemplate(location){
  return  Card(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
           children:<Widget> [
             const SizedBox(height: 6.0,),
              Text(
                location.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                ),
              )
           ],
         ),
       ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title:const Text('Locations'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children:location.map((loc)=>locationTemplate(loc) ).toList()
      ),
    );
  }
}
