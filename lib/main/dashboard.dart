import 'package:basic_app/location.dart';
import 'package:basic_app/main/button_card.dart';
import 'package:basic_app/main/drawer_widget.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const MyDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        child: Wrap(
          children: <Widget>[
            Button_Card(
              title:'Area\n ' ,

              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>(const LocationPage())));
                },
            ),
            Button_Card(
              title: 'Location/Center',


              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>(const LocationPage())));
              },
            ),
            Button_Card(
              title: 'Workstations',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Potential Revenue',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Employees',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Revenue',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Expenses',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Occupancy',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Clients',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Happiness Index',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Service Request',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Conf.Bookings',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Leads',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Lead PipeLine',
              onTap: () {
              },
            ),
            Button_Card(
              title: 'Lead Closed',
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
