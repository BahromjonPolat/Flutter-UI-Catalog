import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/instagram/ui/main.dart';

class InstagramSplashScreen extends StatefulWidget {
  @override
  _InstagramSplashScreenState createState() => _InstagramSplashScreenState();
}

class _InstagramSplashScreenState extends State<InstagramSplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 700), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return InstagramMainPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.pink,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            fontFamily: "lobster"
          ),
        ),
      ),
    );
  }
}
