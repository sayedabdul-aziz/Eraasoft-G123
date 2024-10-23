// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(onPressed: () {}, child: Text('+')),
                // IconButton.filled(onPressed: () {}, icon: Icon(Icons.add)),
                FloatingActionButton.small(
                    backgroundColor: Colors.deepOrange,
                    onPressed: () {
                      setState(() {
                        counter--;
                      });
                    },
                    elevation: 0,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton.small(
                    backgroundColor: Colors.deepOrange,
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    elevation: 0,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
                // FloatingActionButton(onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
