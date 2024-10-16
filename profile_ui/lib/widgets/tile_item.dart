// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TileItem extends StatelessWidget {
  const TileItem({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Color(0xFF265ed7),
              shape: BoxShape.circle,
            ),
            child: Icon(
             icon,
              size: 18,
              color: Colors.white,
            )),
        SizedBox(width: 10),
        Text(
         text,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
