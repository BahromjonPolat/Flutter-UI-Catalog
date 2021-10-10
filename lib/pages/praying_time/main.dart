import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/praying_time/screens/home/alarm_page.dart';
import 'package:flutter_ui/pages/praying_time/screens/home/home_page.dart';
import 'package:flutter_ui/pages/praying_time/screens/home/profile_page.dart';
import 'package:flutter_ui/pages/praying_time/screens/home/taqwim_page.dart';
import 'package:flutter_ui/pages/praying_time/models/time_model.dart';
import 'package:http/http.dart' as http;

class PrayerTimeMainPage extends StatefulWidget {

  List<PrayingTime> times;
  PrayerTimeMainPage(this.times);

  @override
  _PrayerTimeMainPageState createState() => _PrayerTimeMainPageState();
}

class _PrayerTimeMainPageState extends State<PrayerTimeMainPage> {
  static const Color _teal = Colors.teal;
  static const Color _grey = Colors.grey;
  static  Color _deepGreen = Colors.green.shade800;
  static const Color _white = Colors.white;
  static const Color _orange = Colors.orange;

  int _currentIndex = 0;
  double _height;
  double _width;

  List<PrayingTime> _times;

  @override
  void initState() {
    super.initState();
    _times = widget.times;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _pageList()[_currentIndex],
      bottomNavigationBar: _showBottomNavigationBar(),
    );
  }

  BottomNavigationBar _showBottomNavigationBar() => BottomNavigationBar(
        unselectedItemColor: _grey,
        selectedItemColor: _deepGreen,
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
      );

  List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "Asosiy",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.alarm),
      label: "Signal",
    ),
    BottomNavigationBarItem(
      icon: Badge(
        badgeColor: _orange,
        child: Icon(CupertinoIcons.calendar),
      ),
      label: "Zikr",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person_circle),
      label: "Profil",
    ),
  ];

  List<Widget> _pageList() => [
    PrayerHomePage(_times),
    PrayerAlarmPage(_times),
    PrayerCalendarPage(_times),
    PrayerProfilePage(),
  ];
}
