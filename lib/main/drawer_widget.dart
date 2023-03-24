import 'package:basic_app/pages/location_page.dart';
import 'package:flutter/material.dart';
import '../pages/center_page.dart';
import 'dashboard.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
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
                onTap: () {},
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
                onTap: () {},
              ),
              ListTile(
                title: const Text('Images'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Company'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Client Employees'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('private offices'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Conference Rooms'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Parking'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Brokers'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Vendors'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Departments'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Employees'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}