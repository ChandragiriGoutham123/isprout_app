import 'dart:io';
import 'package:basic_app/DAO/service_request_dao.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final TextEditingController _serviceRequestIdSelected = TextEditingController();
  final TextEditingController _requesterIdSelected = TextEditingController();
  final TextEditingController _requestTypeSelected = TextEditingController();
  final TextEditingController _statusSelected= TextEditingController();
  final TextEditingController _modifiedBySelected = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _citiesSelected.dispose();
    _centersSelected.dispose();
    _floorSelected.dispose();
    _roomSelected.dispose();
    _comment.dispose();
    _serviceRequestIdSelected.dispose();
    _requesterIdSelected.dispose();
    _requestTypeSelected.dispose();
    _statusSelected.dispose();
    _modifiedBySelected.dispose();
    super.dispose();
  }

final ServiceRequestDao _serviceRequestDao=ServiceRequestDao();

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
  List<String> chennaiCenters = ["Anna nagar", "RedHills"];
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
                  });
                },
              ),
              const SizedBox(
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
                          });
                        },
                      ),
              const SizedBox(height: 20.0),
              if (selectCenter != "")
                TextField(
                  controller: _floorSelected,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter floor number",
                      labelText: 'Enter Floor number',
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.home)),
                ),
              const SizedBox(
                height: 20.0,
              ),
              if (selectCenter != "")
                TextField(
                  controller: _roomSelected,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter room number",
                      labelText: 'Enter Room number',
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.home)),
                ),const SizedBox(
                height: 20.0,
              ),
              if (selectCenter != "")
                TextField(
                  controller: _serviceRequestIdSelected,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Service request id",
                      labelText: "Enter Service request id",
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.home)),
                ),const SizedBox(
                height: 20.0,
              ),if (selectCenter != "")
                TextField(
                  controller: _requesterIdSelected,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter requester id",
                      labelText: "Enter  requester id",
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.home)),
                ),const SizedBox(
                height: 20.0,
              ),if (selectCenter != "")
                TextField(
                  controller: _requestTypeSelected,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter request type",
                      labelText: "Enter request type",
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.home)),
                ),const SizedBox(
                height: 20.0,
              ),if (selectCenter != "")
                TextField(
                  controller: _statusSelected,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Status",
                      labelText: "Enter Status",
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.home)),
                ),
              const SizedBox(
                height: 20.0,
              ),if (selectCenter != "")
                TextField(
                  controller: _modifiedBySelected,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter modified by",
                      labelText: "Enter modified by",
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.home)),
                ),const SizedBox(
                height: 20.0,
              ),
              if (selectCenter != "")
                TextField(
                  controller: _comment,
                  autocorrect: true,
                  maxLines: 5,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write Problem Description",
                      labelText: 'Describe your problem',
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefix: Icon(Icons.comment)),
                ),
              const SizedBox(
                height: 20.0,
              ),
              if (selectCenter != "")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: pickFile,
                        child: const Text('choose an image')),
                  ],
                ),const SizedBox(
                height: 20.0,
              ),
              if (pickedFile != null)
                Image.memory(
                  pickedFile!.bytes!,
                  height: 450,
                  width: 450,
                ),const SizedBox(
                height: 20.0,
              ),
              if (selectCenter != "")
                Container(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _serviceRequestDao.addServiceRequest(ServiceRequestModel(
                              email: _email.text,
                              location: _citiesSelected.text,
                              center: _centersSelected.text,
                              floor: _floorSelected.text,
                              room: _roomSelected.text,
                              comment: _comment.text,
                              serviceRequestId: _serviceRequestIdSelected.text,
                              requesterId: _requesterIdSelected.text,
                              requestType: _requestTypeSelected.text,
                              status: _statusSelected.text,
                              modifiedBy: _modifiedBySelected.text
                          ));
                     Navigator.pop(context);
                        },
                        child: const Text("Submit"))),
            ],
          ),
        ),
      ),
    );
  }
}