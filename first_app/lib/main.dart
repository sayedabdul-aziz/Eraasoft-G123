// ignore_for_file: prefer_const_constructors

import 'package:first_app/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// widget => class extends statelessWidget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen()
    );
  }
}
