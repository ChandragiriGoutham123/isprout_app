import 'package:basic_app/DAO/service_request_dao.dart';
import 'package:flutter/material.dart';
import '../adding_pages/add_serviceRequest.dart';
import '../models/serviceRequest_model.dart';

class ServiceRequestPage extends StatefulWidget {
  const ServiceRequestPage({Key? key}) : super(key: key);

  @override
  State<ServiceRequestPage> createState() =>
      _ServiceRequestPageState();
}

class _ServiceRequestPageState extends State<ServiceRequestPage> {
  late Stream<List<ServiceRequestModel>> _srStream;
final ServiceRequestDao _serviceRequestDao=ServiceRequestDao();



  @override
  void initState() {
    _srStream = _serviceRequestDao.getServiceRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Service Requests"), centerTitle: true,),
      body: StreamBuilder<List<ServiceRequestModel>>(
        stream: _srStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();


          }
          final sr = snapshot.data!;
          return ListView(

              children: sr
                  .map((doc) => Card(
                color: Colors.white38,
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(margin:const EdgeInsets.all(20),child: Text("email: ${doc.email}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("Location: ${doc.location}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("Center: ${doc.center}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("Floor number: ${doc.floor}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("Room number: ${doc.room}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("Service request id: ${doc.serviceRequestId}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("requester id: ${doc.requesterId}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("request type: ${doc.requestType}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("status: ${doc.status}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("modified by : ${doc.modifiedBy}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Container(margin:const EdgeInsets.all(20),child: Text("Comment: ${doc.comment}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
                  ],
                ),
              ))
                  .toList());

        },),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const AddServiceRequest(),
            );
          },
          tooltip: 'Add Location',
          icon: const Icon(Icons.add),
          label:

          const Text("Add Service Request")),

    );

  }}