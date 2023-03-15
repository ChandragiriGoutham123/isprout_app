import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool showOperations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isprout'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20.0)),
            DrawerHeader(
              child: Image(
                image:AssetImage('ispourt.png'),
                width: 400,
                height: 100,
                alignment: Alignment.center,
              ),
            ),
            ListTile(
              title: Text('DashBoard'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Operations'),
              onTap: () {
                setState(() {
                  showOperations = !showOperations;
                });
              },
            ),
            if (showOperations) ...[
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: Text('Operations 1'),
                    onTap: () {},
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: Text('Operations 2'),
                    onTap: () {},
                  )),
            ],
            ListTile(
              title: Text('Sales'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Data'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
