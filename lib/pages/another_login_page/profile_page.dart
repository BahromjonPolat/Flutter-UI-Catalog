import 'package:flutter/material.dart';

class AnotherProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
    );
  }

  AppBar _getAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Center(
            child: Text(
          "Back",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        actions: [IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})],
        iconTheme: IconThemeData(color: Colors.black),
      );
}
