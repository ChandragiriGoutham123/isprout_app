import 'package:flutter/material.dart';

import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool showOperations = false;
  bool showSales=false;
  bool showData=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iSprout'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(20.0)),
            const DrawerHeader(
              child: Image(
                image:AssetImage('ispourt.png'),
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: const Text('DashBoard'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoard()));
              },
            ),
            ListTile(
              title: const Text('Operations'),
              onTap: () {
                setState(() {
                  showOperations=!showOperations;
                });
              },
            ),
            if (showOperations)...[
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: const Text('ServiceRequest'),
                    onTap: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: const Text('Bookings'),
                    onTap: () {},
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: const Text('Event Managements'),
                    onTap: () {},
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: const Text('Visitor log'),
                    onTap: () {},
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: const Text('Parking'),
                    onTap: () {},
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: const Text('Stock'),
                    onTap: () {},
                  )),
            ],
            ListTile(
              title: const Text('Sales'),
              onTap: () {
                setState(() {
                  showSales=!showSales;
                });
              },
            ),
            if (showSales) ...[
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: const Text('Leads'),
                    onTap: () {},
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: const Text('Broker Fee'),
                    onTap: () {},
                  )),

            ],
            ListTile(
              title: const Text('Data'),
              onTap: () {
                setState(() {
                  showData=!showData;
                });
              },
            ),
            if (showData)...[
              Padding(
                padding:const EdgeInsets.only(left: 20),
                child: ListTile(
                  title: const Text('Locations'),
                  onTap: (){},
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(left: 20),
                child: ListTile(
                  title: const Text('centers'),
                  onTap: (){},
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(left: 20),
                child: ListTile(
                  title: const Text('Assets'),
                  onTap: (){},
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  title: const Text('Images'),
                  onTap: (){},
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  title: const Text('Company'),
                  onTap: (){},
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  title: const Text('Client Employees'),
                  onTap: (){},
                ),
              ),
              Padding(padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: const Text('Private Offices'),
                 onTap: (){},
              ),
              ),
              Padding(padding: const EdgeInsets.only(left: 20),
              child:ListTile(
                title: const Text('Conference Rooms'),
                onTap: (){},
              ) ,
              ),
              Padding(padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: const Text('parking'),
                onTap: (){},
              ),),
              Padding(padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: const Text('Brokers'),
                onTap: (){},

              ),),
              Padding(padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: const Text('vendors'),
                onTap: (){},
              ),
              ),
              Padding(padding: const EdgeInsets.only(left: 20),
                child:ListTile(
                  title: const Text('Departments'),
                  onTap: (){},
                ) ,),
              Padding(padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: const Text('Employees'),
                onTap: (){},
              ),)

            ]
          ],
        ),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
