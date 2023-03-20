import 'package:basic_app/dummy.dart';
import 'package:basic_app/location.dart';
import 'package:basic_app/main/buttoncard.dart';
import 'package:basic_app/main/drawerwidget.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: MyDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        child: Wrap(
          children: <Widget>[
            Button_Card(
              title:'Area\n ' ,

              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (Context)=>(LocationPage())));
                },
            ),
            Button_Card(
              title: 'Location/Center',

              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (Context)=>(LocationPage())));
              },
            ),
            Button_Card(
              title: 'Workstations',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Potential Revenue',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Employees',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Revenue',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Expences',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Occupancy',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Clients',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Happiness Index',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Service Request',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Conf.Bookings',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Leads',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Lead PipeLine',
              onTap: () {
                print('Card Tapped');
              },
            ),
            Button_Card(
              title: 'Lead Closed',
              onTap: () {
                print('Card Tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}
