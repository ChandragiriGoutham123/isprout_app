import 'package:flutter/material.dart';

// ignore: camel_case_types
class ButtonCard extends StatelessWidget {
  final String title;
  final Function onTap;

  const ButtonCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.only(left: 30, top: 30, right: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 80,
          width: 140,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
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
