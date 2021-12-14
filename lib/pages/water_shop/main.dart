import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/water_shop/basket_page.dart';

class WaterShopMainPage extends StatefulWidget {
  @override
  _WaterShopMainPageState createState() => _WaterShopMainPageState();
}

class _WaterShopMainPageState extends State<WaterShopMainPage> {
  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      // drawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset: false,
      appBar: _getAppBar(),
      body: _getBody(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  AppBar _getAppBar() => AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => WaterShopBasketPage()));
              },
              icon: Badge(
                  child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              )))
        ],
      );

  Column _getBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _setTitleText(),
          _getSearchBox(),
          _getMainImage(),
          _setTitleText(),
          _getCatalogList(),
        ],
      );

  Container _setTitleText() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "Water Shop",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Container _getSearchBox() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          decoration: InputDecoration(
              // contentPadding: EdgeInsets.zero,
              hintText: "Search",
              fillColor: Colors.grey[300],
              filled: true,
              prefixIcon: Icon(CupertinoIcons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide.none,
              )),
        ),
      );

  Container _getMainImage() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        width: _size.width,
        height: _size.height * 0.32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.blue,
          image: DecorationImage(
            fit: BoxFit.cover,
              image: AssetImage("assets/images/water_main.jpg"))
        ),
      );

  Container _getCatalogList() => Container(
        height: _size.width * 0.36,
        child: ListView.builder(
            itemCount: 24,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _getCatalogLayout();
            }),
      );

  _getCatalogRow() =>Row(
    children: [

    ],
  );

  Container _getCatalogLayout() => Container(
        width: _size.width * 0.36,
        height: _size.width * 0.36,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: _getBoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bottles",
              style: TextStyle(
                color: Colors.white,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Show all",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            ),
          ],
        ),
      );

  /// BoxDecoration
  Decoration _getBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(16.0), color: Colors.blue);

  /// BottomNavigationBar
  BottomNavigationBar _getBottomNavigationBar() => BottomNavigationBar(
        items: _getBottomNavigationBarItems,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        currentIndex: 1,
      );

  /// BottomNavigationBarItemList
  List<BottomNavigationBarItem> _getBottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.credit_card_outlined),
      label: "Main",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.grid_view_sharp),
      label: "Explore",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: "Favourite",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_outlined),
      label: "Profile",
    ),
  ];


}
