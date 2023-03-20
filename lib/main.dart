import 'package:flutter/material.dart';
import './location.dart';
import 'main/drawerwidget.dart';
void main() =>runApp(const MyApp());


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iSprout'),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
         Container(

         )
        ],
      ),
    );
  }
}
