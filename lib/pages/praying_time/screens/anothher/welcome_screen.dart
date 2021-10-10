import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/pages/praying_time/data/api_data.dart';
import 'package:flutter_ui/pages/praying_time/main.dart';
import 'package:flutter_ui/pages/praying_time/widgets/set_text.dart';

class PrayerTimeWelcomeSceen extends StatefulWidget {
  @override
  _PrayerTimeWelcomeScreenState createState() =>
      _PrayerTimeWelcomeScreenState();
}

class _PrayerTimeWelcomeScreenState extends State<PrayerTimeWelcomeSceen> {
  LinearGradient _gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: [
        Colors.green[600],
        Colors.green[500],
        Colors.green[400],
        Colors.green[300],
        Colors.green[400],
      ]);

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

  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  Stack _getBody() => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: _gradient,
            ),
          ),
          SvgPicture.asset(
            "assets/images/svg/mosque.svg",
            color: Color(0x4fffffff),
          ),
          Positioned(
            bottom: 120.0,
            left: 12,
            right: 12,
            child: CupertinoActivityIndicator(radius: 16.0),
          ),
          Positioned(
            bottom: 90.0,
            left: 12,
            right: 12,
            child: Text(
              "Yuklanmoqda...",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
}
