// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.menu, color: Colors.deepOrange),
        centerTitle: true,
        title: Text(
          'My First App',
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(
              Icons.notifications_active,
              color: Colors.deepOrange,
            ),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(
              Icons.search,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical
          crossAxisAlignment: CrossAxisAlignment.center, // hori.
          children: [
            // ---------- image ----------
            // -- 1) Rounded image --
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   // borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            //   // borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
            //   child: Image.network(
            //     'https://assets.goal.com/images/v3/bltb9c1555d420b1d87/GOAL%20-%20Blank%20WEB%20-%20Facebook%20-%202024-08-18T185849.997.png?auto=webp&format=pjpg&width=3840&quality=60',
            //     width: 200,
            //     height: 200,
            //     fit: BoxFit.cover,
            //   ),
            // ),

            // -- 2) Circle image --

            // ClipOval(
            //   child: Image.asset(
            //     'assets/mosalah.webp',
            //     width: 200,
            //     height: 200,
            //     fit: BoxFit.cover,
            //   ),
            // ),

            CircleAvatar(
              radius: 100,
              // backgroundColor: Colors.deepOrange,
              backgroundImage: NetworkImage(
                  'https://assets.goal.com/images/v3/bltb9c1555d420b1d87/GOAL%20-%20Blank%20WEB%20-%20Facebook%20-%202024-08-18T185849.997.png?auto=webp&format=pjpg&width=3840&quality=60'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10),
                // gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     stops: [
                //       .2,
                //       1.4
                //     ],
                //     colors: [
                //       Colors.black,
                //       Colors.deepOrange,
                //     ]),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.white54,
                //       spreadRadius: 3,
                //       blurRadius: 9,
                //       offset: Offset(0, 2))
                // ]
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ahmed Ali Ahmed',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // hor
                      children: [
                        IconButton(
                          onPressed: () {
                            //
                          },
                          icon: Icon(
                            Icons.facebook,
                            color: Colors.blueGrey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            //
                          },
                          icon: Icon(
                            Icons.snapchat,
                            color: Colors.yellow,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            //
                          },
                          icon: Icon(
                            Icons.telegram,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // -----------------------
          ],
        ),
      ),
    );
  }
}
