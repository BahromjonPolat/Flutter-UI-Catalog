import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/authorization/screens/login_page.dart';

class AuthSplashScreenPage extends StatefulWidget {
  @override
  _AuthSplashScreenPageState createState() => _AuthSplashScreenPageState();
}

class _AuthSplashScreenPageState extends State<AuthSplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AuthLoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
