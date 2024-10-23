import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result;

  String getStatus() {
    if (result <= 18.4) {
      return "Underweight";
    } else if (result <= 24.9) {
      return "normal";
    } else {
      return "obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b0c21),
      appBar: AppBar(
        backgroundColor: Color(0xff0b0c21),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getStatus(),
              style: TextStyle(color: Colors.green, fontSize: 30),
            ),
            SizedBox(height: 30),
            Text(
              result.toStringAsFixed(2),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
