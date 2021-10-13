import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AudioPlayerAlbumPage extends StatefulWidget {
  @override
  _AudioPlayerAlbumPageState createState() => _AudioPlayerAlbumPageState();
}

class _AudioPlayerAlbumPageState extends State<AudioPlayerAlbumPage> {
  static const Color _transparent = Colors.transparent;
  static const Color _black = Colors.black;
  static const Color _deepOrange = Colors.deepOrange;
  static const Color _grey = Colors.grey;
  static const Color _orange = Colors.orange;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
    );
  }

  AppBar _getAppBar() => AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        title: Text("NOW PLAYING"),
      );

  BottomNavigationBar _showBottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: _deepOrange,
        unselectedItemColor: _black,
        currentIndex: 4,
        items: _bottomNavigationBarItems,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      );

  List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.repeat), label: "Repeat"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart), label: "Favourites"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.chevron_up), label: "All"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.chat_bubble), label: "Something"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.repeat), label: "Repeat"),
  ];
}
