import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/friendship/screens/auth_page.dart';

/// Splash Screen class
class FriendshipSplashScreenPage extends StatelessWidget {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              CupertinoIcons.person_2,
              size: 102.0,
              color: Colors.teal.shade100,
            ),
            Column(
              children: [
                Text(
                  "Friendship App",
                  style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  "Find your friend".toUpperCase(),
                  style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.teal[100],
                      fontSize: 24.0),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => RegisterPage()));
                },
                child: Text(
                  "Start",
                  style: _getTextStyle(),
                ),
                style: _setButtonStyle(_size))
          ],
        ),
      ),
    );
  }

  ButtonStyle _setButtonStyle(Size size) => ElevatedButton.styleFrom(
      primary: Colors.white, fixedSize: Size(size.width * 0.6, 48.0));

  TextStyle _getTextStyle() => TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      );
}
