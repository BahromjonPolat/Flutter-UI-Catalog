import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HotelMainPage extends StatefulWidget {
  @override
  _HotelMainPageState createState() => _HotelMainPageState();
}

class _HotelMainPageState extends State<HotelMainPage> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _bodyWithCustomScrollView(),
    );
  }

  CustomScrollView _bodyWithCustomScrollView() => CustomScrollView(
        slivers: [
          _getSliverAppBar(),
          _getSliverList(),
        ],
      );

  SliverAppBar _getSliverAppBar() => SliverAppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white
    ),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "Find your hotel \nin ",
            ),
            TextSpan(text: "Paris", style: TextStyle(color: Colors.teal))
          ]),
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        expandedHeight: _size.height * 0.2,
        actions: [
          IconButton(
              icon: Icon(
                Icons.person_outline_outlined,
                size: 32,
              ),
              onPressed: () {}),
        ],
      );

  SliverList _getSliverList() => SliverList(
          delegate: SliverChildListDelegate([
        _searchItems(),
        _showCategories(),
      ]));

  _searchItems() => Container(
        margin: EdgeInsets.only(left: 16.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  bottomLeft: Radius.circular(32.0)),
              borderSide: BorderSide(width: 0.0, color: Colors.transparent),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          ),
        ),
      );

  List<String> categories = [
    "All",
    "Popular",
    "Top Rated",
    "Featured",
    "Luxury"
  ];

  int _currentIndex = 0;

  _showCategories() => Container(
        height: 36.0,
        margin: EdgeInsets.symmetric(vertical: 32.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              String item = categories[index];
              return Container(
                margin: EdgeInsets.only(right: 16.0, left: 8.0),
                child: GestureDetector(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color:
                          (_currentIndex == index) ? Colors.teal : Colors.black87,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              );
            }),
      );

  _showRoomInfo() => Card(
    child: Container(
      decoration: BoxDecoration(

      ),

    ),
  );
}
