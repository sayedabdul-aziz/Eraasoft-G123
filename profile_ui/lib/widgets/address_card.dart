// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:profile_ui/widgets/tile_item.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFe4f2fd),
      ),
      child: Column(
        children: const [
          TileItem(
            text: 'Cairo Hospital',
            icon: Icons.local_hospital_rounded,
          ),
          SizedBox(height: 10),
          TileItem(
            text: '10:12 AM',
            icon: Icons.watch_later_outlined,
          ),
          SizedBox(height: 10),
          TileItem(
            text: 'Cairo Governorate',
            icon: Icons.location_on,
          ),
        ],
      ),
    );
  }
}
