import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/sport.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _buildAppBar(),
      bottomNavigationBar: _showBottomNavigationBar(),
      body: Container(
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    // Yuqoridagi Sportlar ro`yxati ushbu funksiya orqali olinadi.
                    child: setSport(),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                    child: Text(
                      "Latest Activities",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Latest Activities bo`limidagi Brianning Rasm va boshqa
                    // ma'lumotlarini ko`rsatish uchun showMainInfo() funksiyasini chaqiriladi.
                    showMainInfo(),

                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 18.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        "Morning Run",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),

                    // Morning Run yozuvi tagidai Ma'lumotlarni ko`rsatadigan funksiya.
                    // Funksiya Row return qiladi.
                    getInfo(),
                    SizedBox(
                      height: 12.0,
                    ),

                    // Xarita rasmi. Internatdan keladi.
                    Expanded(
                      child: Image.network(
                          "https://devongeography.files.wordpress.com/2018/12/88346058_darth.jpg?w=640"),
                    ),

                    // View details bo`limini ko`rsatadigan funksiya.
                    viewDetails(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
      title: Text(
        "Statistics",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget showMainInfo() => ListTile(
        leading: CircleAvatar(
          radius: 28.0,
          backgroundImage: AssetImage("assets/images/logo.jpg"),
        ),
        title: Text(
          "Brian",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          "MAY 22, 2019 AT 1.39 PM",
        ),
        trailing: Icon(
          Icons.run_circle,
          color: Colors.orange,
          size: 36.0,
        ),
      );

  Widget viewDetails() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "View details >",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.grey,
                  ),
                  Text(
                    "10",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Icon(
                    CupertinoIcons.chat_bubble_text_fill,
                    color: Colors.grey,
                  ),
                  Text(
                    "2",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget setSport() => ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: getSport().length,
      itemBuilder: (context, index) {
        Sport sport = getSport()[index];
        return Column(
          children: [
            Card(
              elevation: 6.0,
              margin: EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 6.0,
              ),
              child: Container(
                height: 80,
                width: 110,
                child: Image.asset(sport.imageUrl),
              ),
              color: sport.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            Text(
              sport.title,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        );
      });

  Widget getInfo() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          setInfo("Distance", "31.00km"),
          setInfo("Elev Gain", "231m"),
          setInfo("Time", "2:23"),
          setInfo("Avg Pace", "4:27/km"),
        ],
      );

  Widget setInfo(String title, String info) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            info,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      );

  BottomNavigationBar _showBottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _bottomNavigationBarItems,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
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
