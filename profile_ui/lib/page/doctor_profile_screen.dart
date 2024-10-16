// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:profile_ui/widgets/address_card.dart';
import 'package:profile_ui/widgets/profile_header.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 0x ff 123456
        backgroundColor: const Color(0xFF265ed7),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          'Doctor Profile',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- header ------
            ProfileHeader(),
            // about
            SizedBox(height: 20),
            Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Former dentist at Google and former CEO of Microsoft. graduated from Stanford University.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // address
            AddressCard(),
            SizedBox(height: 20),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.black38,
            ),
            SizedBox(height: 20),
            AddressCard(),
          ],
        ),
      ),
    );
  }
}
