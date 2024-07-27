import 'package:flutter/material.dart';
import 'dart:async';

import 'package:kairiz3/Login/login.dart'; // Import to use Timer

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the main screen after 3 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize this color
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset('assets/registerr.png'), // Replace with your logo asset
            SizedBox(height: 10,),
            Text('Daily Drive',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              color: Colors.pink
            ),),

            Text('Organize, Achieve, Succeed',
              style: TextStyle(
                  fontSize: 16,
                  //ontWeight: FontWeight.bold,
                  color: Colors.black,
              ),)

          ],
        ),
      ),
    );
  }
}
