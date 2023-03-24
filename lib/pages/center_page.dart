import 'package:basic_app/models/center_model.dart';
import 'package:basic_app/main/crud.dart';
import 'package:flutter/material.dart';

class CenterPage extends StatefulWidget {
  const CenterPage({Key? key}) : super(key: key);

  @override
  State<CenterPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<CenterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Centers Available')),
        body:
            StreamBuilder<List<CenterModel>>(
              stream: Crud.readCenter(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return LinearProgressIndicator();
                }

                final centerData = snapshot.data;
                return Expanded(
                    child: Card(
                      margin: EdgeInsets.all(10.0),
                      elevation: 10,
                      child: ListView.builder(
                          itemCount: centerData!.length,
                          itemBuilder: (context, index) {
                            final singleCenter = centerData[index];
                            return Card(
                              margin: EdgeInsets.all(10.0),
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                ),
                              //  title: Text("${singleCenter.name}"),
                                //subtitle: Text("${singleCenter.area}"),
                              ),
                            );
                          }),
                    ));
              },
            )
        );
  }
}
