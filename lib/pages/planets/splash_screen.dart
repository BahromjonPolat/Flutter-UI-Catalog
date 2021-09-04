import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/pages/planets/main.dart';
import 'package:flutter_ui/pages/planets/planets_images.dart';

class PlanetsSplashScreen extends StatefulWidget {
  @override
  _PlanetsSplashScreenState createState() => _PlanetsSplashScreenState();
}

class _PlanetsSplashScreenState extends State<PlanetsSplashScreen> {
  Size _size;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PlanetsMainPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() => Column(
        children: [
          Expanded(
              child: Container(
            width: _size.width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: "SPAC"),
                    TextSpan(text: "E", style: TextStyle(color: Colors.red)),
                    TextSpan(text: "D"),
                  ]),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 42.0,
                      letterSpacing: 5.0,
                      fontFamily: "poppins"),
                ),
                Text("TO SPACE AND BACK SAFELY",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.50,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 3.0)),

                /// Slider
                Container(
                  margin: EdgeInsets.only(top: 64.0),
                  width: _size.width * 0.5,
                  child: Slider(
                      value: 32.0,
                      max: 100,
                      min: 0,
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      onChanged: (position) {}),
                ),
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: Image.network(
              halfMoon,
              fit: BoxFit.cover,
            ),
          )),
        ],
      );
}
