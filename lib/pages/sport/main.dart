import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/sport/statistics_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'model/sport.dart';

class SportMenPage extends StatefulWidget {
  @override
  _SportMenPageState createState() => _SportMenPageState();
}

class _SportMenPageState extends State<SportMenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _showBottomNavigationBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey Brian,",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "poppins",
                                fontSize: 32.0),
                          ),
                          Text(
                            "What are you \nup to today?",
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 32.0,
                        backgroundColor: Colors.indigo,
                        backgroundImage: AssetImage("assets/images/logo.jpg"),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                // Sport ro`yxatini ko`rsatish uchun shu bo`limdan foydalaniladi.
                // Ekranning bo`sh qolgan 7 dan 5 qismi ro`yxat uchun ajratildi.

                flex: 5,
                child: _setSportsmen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _setSportsmen() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: 1.2,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      children: getSport()
          .map(
            (sport) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              color: sport.color,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 16.0, left: 12.0),
                    child: Text(
                      sport.title,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.bottomRight,
                    child: Image.asset(sport.imageUrl),
                    height: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0)),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  _onTap() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => StatisticsPage()));

  BottomNavigationBar _showBottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _bottomNavigationBarItems,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 4) {
            _onTap();
          }
        },
      );
  List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.chart_bar),
      label: "Chart",
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.chat_bubble_text),
      label: "Messages",
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person_2),
      label: "Groups",
    ),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        backgroundImage: AssetImage(
          "assets/images/logo.jpg",
        ),
      ),
      label: "Profile",
    ),
  ];
}
