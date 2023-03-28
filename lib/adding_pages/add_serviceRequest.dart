import 'dart:io';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main/crud.dart';
import '../models/serviceRequest_model.dart';

class AddServiceRequest extends StatefulWidget {
  const AddServiceRequest({Key? key}) : super(key: key);

  @override
  State<AddServiceRequest> createState() => _AddServiceRequestState();
}

class _AddServiceRequestState extends State<AddServiceRequest> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _citiesSelected = TextEditingController();
  final TextEditingController _centersSelected = TextEditingController();
  final TextEditingController _floorSelected = TextEditingController();
  final TextEditingController _roomSelected = TextEditingController();
  final TextEditingController _comment = TextEditingController();

  void dispose() {
    _email.dispose();
    _citiesSelected.dispose();
    _centersSelected.dispose();
    _floorSelected.dispose();
    _roomSelected.dispose();
    _comment.dispose();
    super.dispose();
  }

  final Crud crud = Crud();

  List<File> selectedImages = [];
  final picker = ImagePicker();
  FilePickerResult? result;
  String? _filename;
  PlatformFile? pickedFile;
  bool isLoading = false;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePickerWeb.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );
      if (result != null) {
        _filename = result!.files.first.name;
        pickedFile = result!.files.first;

        // upload file

        print(_filename);
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  String selectCity = "";
  String selectCenter = "";
  int indexOfCities = -1;
  int indexOfCenters = 0;

  List<String> cities = [
    "Hyderabad",
    "Pune",
    "Bangalore",
    "Chennai",
    "Vijayawada"
  ];
  List<String> hydCenters = ["Madhapur", "Ameerpet"];
  List<String> bangCenters = ["Electronic City", "center2"];
  List<String> puneCenters = ["PuneCenter 1"];
  List<String> chennaiCenters = ["Anna nagar", "Redhills"];
  List<String> vijayCenters = ["Vijayawada center1"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Requests'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            children: [
              TextField(
                controller: _email,
                autocorrect: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter you mail",
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    prefix: Icon(
                      Icons.mail,
                      size: 20,
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              DropDownField(
                controller: _citiesSelected,
                hintText: 'Select any Location',
                enabled: true,
                itemsVisibleInDropdown: cities.length,
                items: cities,
                onValueChanged: (value) {
                  setState(() {
                    selectCity = value;
                    indexOfCities = cities.indexOf(selectCity);
                    print(indexOfCities);
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              if (indexOfCities == 1)
                DropDownField(
                  controller: _centersSelected,
                  hintText: 'Select any Center',
                  enabled: true,
                  itemsVisibleInDropdown: cities.length,
                  items: puneCenters,
                  onValueChanged: (value) {
                    setState(() {
                      selectCenter = value;
                      indexOfCenters = puneCenters.indexOf(selectCenter);
                      print(indexOfCenters);
                    });
                  },
                )
              else if (indexOfCities == 0)
                DropDownField(
                  controller: _centersSelected,
                  hintText: 'Select any Center',
                  enabled: true,
                  itemsVisibleInDropdown: cities.length,
                  items: hydCenters,
                  onValueChanged: (value) {
                    setState(() {
                      selectCenter = value;
                      indexOfCenters = hydCenters.indexOf(selectCenter);
                      print(indexOfCenters);
                    });
                  },
                )
              else if (indexOfCities == 2)
                  DropDownField(
                    controller: _centersSelected,
                    hintText: 'Select any Center',
                    enabled: true,
                    itemsVisibleInDropdown: cities.length,
                    items: bangCenters,
                    onValueChanged: (value) {
                      setState(() {
                        selectCenter = value;
                        indexOfCenters = bangCenters.indexOf(selectCenter);
                        print(indexOfCenters);
                      });
                    },
                  )
                else if (indexOfCities == 3)
                    DropDownField(
                      controller: _centersSelected,
                      hintText: 'Select any Center',
                      enabled: true,
                      itemsVisibleInDropdown: cities.length,
                      items: chennaiCenters,
                      onValueChanged: (value) {
                        setState(() {
                          selectCenter = value;
                          indexOfCenters = chennaiCenters.indexOf(selectCenter);
                          print(indexOfCenters);
                        });
                      },
                    )
                  else if (indexOfCities == 4)
                      DropDownField(
                        controller: _centersSelected,
                        hintText: 'Select any Center',
                        enabled: true,
                        itemsVisibleInDropdown: cities.length,
                        items: vijayCenters,
                        onValueChanged: (value) {
                          setState(() {
                            selectCenter = value;
                            indexOfCenters = vijayCenters.indexOf(selectCenter);
                            print(indexOfCenters);
                          });
                        },
                      ),
              SizedBox(height: 20.0),
              if (selectCenter != "")
                TextField(
                  controller: _floorSelected,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter floor number",
                      labelText: 'Enter Floor number',
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.home)),
                ),
              SizedBox(
                height: 20.0,
              ),
              if (selectCenter != "")
                TextField(
                  controller: _roomSelected,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter room number",
                      labelText: 'Enter Room number',
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.home)),
                ),
              SizedBox(
                height: 20.0,
              ),
              if (selectCenter != "")
                TextField(
                  controller: _comment,
                  autocorrect: true,
                  maxLines: 5,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write Problem Description",
                      labelText: 'Describe your problem',
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.comment)),
                ),
              SizedBox(
                height: 20.0,
              ),
              if (selectCenter != "")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: ElevatedButton(
                            onPressed: pickFile,
                            child: Text('choose an image'))),
                  ],
                ),
              if (pickedFile != null)
                Image.memory(
                  pickedFile!.bytes!,
                  height: 450,
                  width: 450,
                ),
              if (selectCenter != "")
                Container(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          crud.addServiceRequest(ServiceRequestModel(
                              email: _email.text,
                              location: _citiesSelected.text,
                              center: _centersSelected.text,
                              floor: _floorSelected.text,
                              room: _roomSelected.text,
                              comment: _comment.text));
                        },
                        child: Text("Submit"))),
            ],
          ),
        ),
      ),
    );
  }
}