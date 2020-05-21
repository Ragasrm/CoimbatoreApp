import 'dart:async';
import 'package:flutter/material.dart';
import 'package:politicalApp/Screens/publicPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 5), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => PublicPage1()
    )));


    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/img_1.jpg'),
                fit: BoxFit.none,
                
              ),
            ),
          ),
          Positioned(
            bottom: 48.0,
            left: 10.0,
            right: 10.0,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Disclaimer ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "All views Expressed on this site are dummy data for testing puspose and do not represent any Specific Person..!"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}