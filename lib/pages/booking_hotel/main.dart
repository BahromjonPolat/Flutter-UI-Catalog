import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/booking_hotel/filter_page.dart';

class BookingHotelMainPage extends StatefulWidget {
  @override
  _BookingHotelMainPageState createState() => _BookingHotelMainPageState();
}

class _BookingHotelMainPageState extends State<BookingHotelMainPage> {
  Size _size;
  Color _white = Colors.white;
  Color _black = Colors.black;
  Color _deepOrange = Colors.deepOrange;
  Color _grey = Colors.grey;
  Color _transparent = Colors.transparent;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  AppBar _getAppBar() => AppBar(
        iconTheme: IconThemeData(color: _black),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: _white,
        elevation: 12.0,
        leadingWidth: _size.width * 0.3,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Location",
              style: TextStyle(color: _grey),
            ),
            Text(
              "Your Location",
              style: TextStyle(color: _black, fontSize: 18.0),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BookingHotelFilterPage()));
              },
              icon: Icon(Icons.insights))
        ],
      );

  BottomNavigationBar _getBottomNavigationBar() => BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: _deepOrange,
        unselectedItemColor: _grey,
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBatItems,
      );

  List<BottomNavigationBarItem> _bottomNavigationBatItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.briefcase_fill), label: "My Trip"),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications), label: "Notification"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
  ];
}
