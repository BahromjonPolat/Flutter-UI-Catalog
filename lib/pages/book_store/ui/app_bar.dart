import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

AppBar _appBar() =>  AppBar(
  backwardsCompatibility: false,
  systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
  iconTheme: IconThemeData(color: Colors.black87),
  backgroundColor: Colors.white,
  elevation: 0.0,
  actions: [
    Container(
      margin: EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: CircleAvatar(
          backgroundColor: Colors.orange,
          backgroundImage: AssetImage("assets/images/logo.jpg"),
        ),
        onTap: () {
          Fluttertoast.showToast(
            msg: "profile Image was clicked!",
            toastLength: Toast.LENGTH_SHORT,
          );
        },
      ),
    ),
  ],
);

AppBar get bookStoreAppBar => _appBar();