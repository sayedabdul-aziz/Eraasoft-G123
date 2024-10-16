import 'package:flutter/material.dart';

class CallCard extends StatelessWidget {
  const CallCard({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFe4f2fd)),
      child: Row(children: [
        const Icon(Icons.phone),
        const SizedBox(
          width: 2,
        ),
        Text(
          number,
          style: const TextStyle(fontSize: 16),
        )
      ]),
    );
  }
}
