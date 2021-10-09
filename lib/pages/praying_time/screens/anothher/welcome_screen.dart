import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/praying_time/data.dart';
import 'package:flutter_ui/pages/praying_time/main.dart';

class PrayerTimeWelcomeSceen extends StatefulWidget {
  @override
  _PrayerTimeWelcomeScreenState createState() =>
      _PrayerTimeWelcomeScreenState();
}

class _PrayerTimeWelcomeScreenState extends State<PrayerTimeWelcomeSceen> {
  @override
  void initState() {
    super.initState();
    getPrayerTimes.then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PrayerTimeMainPage(value),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CupertinoActivityIndicator(radius: 48.0),),
    );
  }
}
