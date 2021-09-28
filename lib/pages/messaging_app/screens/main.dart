import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/messaging_app/screens/home_page.dart';
import 'package:flutter_ui/pages/messaging_app/screens/settings_page.dart';

class MessagingAppMainPage extends StatefulWidget {
  @override
  _MessagingAppMainPageState createState() => _MessagingAppMainPageState();
}

class _MessagingAppMainPageState extends State<MessagingAppMainPage> {
  Color _blue = Color.fromARGB(255, 47, 128, 237);
  Color _grey = Colors.grey;
  Color _transparent = Colors.transparent;
  Color _white = Colors.white;
  Color _black = Colors.black;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _setAppBar(),
      bottomNavigationBar: _getBottomNavigationBar(),
      body: MessagingAppHomePage(),
      floatingActionButton: _getFloatingActionButton(),
    );
  }

  AppBar _setAppBar() => AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _transparent,
        elevation: 0.0,
        title: _setTitle("Recent Chats"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search, color: _black),
          )
        ],
      );

  BottomNavigationBar _getBottomNavigationBar() => BottomNavigationBar(
        items: _bottomNavBarItems,
        unselectedItemColor: _grey,
        selectedItemColor: _blue,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      );
  List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.chat_bubble_fill),
      label: "Chat",
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.clock_fill),
      label: "Recent",
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.phone_fill),
      label: "Calls",
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person_circle_fill),
      label: "Settings",
    ),
  ];

  FloatingActionButton _getFloatingActionButton() => FloatingActionButton(
    backgroundColor: _blue,
        onPressed: () {},
        child: Icon(CupertinoIcons.chat_bubble_text_fill),
      );

  Text _setTitle(String title) => Text(
        title,
        style: TextStyle(
          color: _black,
        ),
      );
}
