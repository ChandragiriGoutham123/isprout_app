import 'package:basic_app/pages/ConferenceRoom_page.dart';
import 'package:basic_app/pages/asset_page.dart';
import 'package:basic_app/pages/broker_page.dart';
import 'package:basic_app/pages/client-employee_page.dart';
import 'package:basic_app/pages/client_page.dart';
import 'package:basic_app/pages/department_page.dart';
import 'package:basic_app/pages/employee_page.dart';
import 'package:basic_app/pages/location_page.dart';
import 'package:basic_app/pages/serviceRequest_page.dart';
import 'package:basic_app/pages/vendor_page.dart';
import 'package:flutter/material.dart';
import '../pages/center_page.dart';
import '../pages/private_office_page.dart';
import 'dashboard.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('ispourt.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(''),
          ),
          ListTile(
            title: const Text('DashBoard'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashBoard()),
              );
            },
          ),
          ExpansionTile(
            title: const Text('Operations'),
            children: [
              ListTile(
                title: const Text('ServiceRequest'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const ServiceRequestPage()));
                },
              ),
              ListTile(
                title: const Text('Bookings'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Event Managements'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Visitor log'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Parking'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Stock'),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Sales'),
            children: [
              ListTile(
                title: const Text('Leads'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Broker Fee'),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Data'),
            children: [
              ListTile(
                title: const Text('Locations'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>(const LocationPage())));
                },
              ),
              ListTile(
                title: const Text('Centers'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>(const CenterPage())));
                },
              ),
              ListTile(
                title: const Text('Assets'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AssetPage()));
                },
              ),
              ListTile(
                title: const Text('Images'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Clients'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ClientPage()));
                },
              ),
              ListTile(
                title: const Text('Client Employees'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ClientEmployeePage()));
                },
              ),
              ListTile(
                title: const Text('private offices'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PrivateOfficePage()));
                },
              ),
              ListTile(
                title: const Text('Conference Rooms'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const ConferenceRoomPage()));
                },
              ),
              ListTile(
                title: const Text('Parking'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Brokers'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BrokerPage()));
                },
              ),
              ListTile(
                title: const Text('Vendors'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const VendorPage()));
                },
              ),
              ListTile(
                title: const Text('Departments'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const DepartmentPage()));
                },
              ),
              ListTile(
                title: const Text('Employees'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmployeePage()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
