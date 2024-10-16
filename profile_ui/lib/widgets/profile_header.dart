// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:profile_ui/widgets/call_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
            child: Image.network(
          'https://picsum.photos/200',
          width: 150,
          height: 150,
        )),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Dr. Ahmed Ali',
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF265ed7),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Dentist',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.orangeAccent,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  '3',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CallCard(
                  number: '1',
                ),
                SizedBox(
                  width: 5,
                ),
                CallCard(
                  number: '2',
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
