import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(const MaterialApp(
  home:DashBoard(),
));
class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

      body: Text('hello'),
    );
  }
}

