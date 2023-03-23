import 'package:basic_app/center_model.dart';
import 'package:basic_app/main/crud.dart';
import 'package:flutter/material.dart';

class CenterPage extends StatefulWidget {
  const CenterPage({Key? key}) : super(key: key);

  @override
  State<CenterPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<CenterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _floorsController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _parkingController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _floorsController.dispose();
    _areaController.dispose();
    _parkingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Centers Available')),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'City Name'),
            ),
            TextField(
              controller: _floorsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number of floors'),
            ),
            TextField(
              controller: _areaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Area'),
            ),
            TextField(
              controller: _parkingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Available Parking'),
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                Crud.create(CenterModel(
                    name: _nameController.text,
                    floors: _floorsController.text,
                    area: _areaController.text,
                    parking: _parkingController.text));
              },
            ),
            StreamBuilder<List<CenterModel>>(
              stream: Crud.read(),
              builder: (context, snapshot) {

                  final centerdata = snapshot.data;
                  return Expanded(
                      child: ListView.builder(
                          itemCount: centerdata!.length,
                          itemBuilder: (context, index) {
                            final singleCenter=centerdata![index];
                            return Container(
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                ),

                                title: Text("${singleCenter.name}"),
                                subtitle: Text("${singleCenter.area}"),
                              ),
                            );
                          }));

              },
            )
          ],
        ));
  }
}
