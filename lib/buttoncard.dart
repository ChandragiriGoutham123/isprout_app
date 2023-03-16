import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final Function onTap;

  const MyCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.only(left: 30, top: 30, right: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 80,
          width: 140,
          child: Center(
            child: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
