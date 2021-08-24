import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavBatItems = [
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: "Search"),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.plus_app), label: "New post"),
  BottomNavigationBarItem(
      icon: Badge(
          badgeColor: Colors.red,
          badgeContent: Text("7"),
          child: Icon(CupertinoIcons.heart)),
      label: "Activity"),

  BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: "Profile")
];
