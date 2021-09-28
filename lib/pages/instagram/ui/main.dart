import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/instagram/ui/bottom_nav_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InstagramMainPage extends StatefulWidget {
  // Started 23-08-2021 20:00

  @override
  _InstagramMainPageState createState() => _InstagramMainPageState();
}

class _InstagramMainPageState extends State<InstagramMainPage> {
  var _homePageBucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Instagram",
          style: TextStyle(
              fontFamily: "lobster",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24.0),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                Fluttertoast.showToast(msg: "Direct was clicked");
              }),
        ],
      ),
      body: _getCurrentPage(),
      bottomNavigationBar: _getBottomNavBar(),
    );
  }

  int _currentIndex = 0;

  void _onTapBottomNavItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getCurrentPage() => _pageList[_currentIndex];

  _getBottomNavBar() => BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: bottomNavBatItems,
        type: BottomNavigationBarType.fixed,
        onTap: _onTapBottomNavItem,
      );

  List _pageList = [
    // _homePage(),
  ];
  PageStorage _homePage() => PageStorage(
    bucket: _homePageBucket,
    child: ListView.builder(
      itemCount: 24,
        itemBuilder: (context, index) => Container(
          height: 120.0,
          margin: EdgeInsets.symmetric(vertical: 3.0),
              child: Text("$index"),
            )),
  );
}
