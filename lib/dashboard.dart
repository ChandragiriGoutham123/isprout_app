import 'package:basic_app/buttoncard.dart';
import 'package:basic_app/drawerwidget.dart';
import 'package:basic_app/location.dart';
import 'package:basic_app/main.dart';
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
            MyCard(
              title:'Area - 10L sq.ft.' ,

              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (Context)=>Location()));
              },
            ),
            MyCard(
              title: 'Location/Center',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Workstations',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Potential Revenue',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Employees',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Revenue',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Expences',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Occupancy',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Clients',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Happiness Index',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Service Request',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Conf.Bookings',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Leads',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
              title: 'Lead PipeLine',
              onTap: () {
                print('Card Tapped');
              },
            ),
            MyCard(
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
