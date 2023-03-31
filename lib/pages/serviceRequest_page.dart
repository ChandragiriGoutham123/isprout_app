import 'package:basic_app/adding_pages/add_serviceRequest.dart';
import 'package:basic_app/models/serviceRequest_model.dart';
import 'package:flutter/material.dart';

import '../DAO/service_request_dao.dart';

class ServiceRequestPage extends StatefulWidget {
  const ServiceRequestPage({Key? key}) : super(key: key);

  @override
  State<ServiceRequestPage> createState() => _ServiceRequestPageState();
}

class _ServiceRequestPageState extends State<ServiceRequestPage> {
  late Stream<List<ServiceRequestModel>> _srStream;
  final ServiceRequestDao _serviceRequestDao = ServiceRequestDao();

  @override
  void initState() {
    _srStream = _serviceRequestDao.getServiceRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Service Requests"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _srStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final sr = snapshot.data;
          return SingleChildScrollView();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AddServiceRequest(),
            );
          },
          tooltip: 'Add Location',
          icon: const Icon(Icons.add),
          label: const Text("Add Location")),
    );
  }
}
