import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/furniture_shop/bottom_navigation_bar.dart';
import 'package:flutter_ui/pages/furniture_shop/details_page.dart';

class FurnitureShopMainPage extends StatelessWidget {
  static const Color _orange = Colors.orange;
  static const Color _grey = Colors.grey;
  static const Color _black = Colors.black;
  static const Color _white = Colors.white;
  late Size _size;

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      drawer: Drawer(),
      bottomNavigationBar: furnitureBottomNavigationBar,
    );
  }

  /// APPBAR
  AppBar _getAppBar() => AppBar(
        backgroundColor: _orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(_size.width, _size.height * 0.17),
          child: Transform.translate(
            offset: Offset(0.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getAppBarTitle(),
                _getTextField(),
              ],
            ),
          ),
        ),
      );

  /// APPBAR TITLE QISMI
  Padding _getAppBarTitle() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Furniture that fits\nyour Style",
          style: TextStyle(
              color: _white, fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
      );

  /// APPBAR'DAGI SEARCH TEXT FIELD
  Padding _getTextField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: _white,
              prefixIcon: Icon(Icons.search, color: _orange),
              hintText: "Search Furniture",
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none)),
        ),
      );

  /// ASOASIY BODY QISM
  Padding _getBody() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          children: [
            _setTitleCategory("Shop for"),
            _showShopCategory(),
            _setDivider(),
            _setTitleCategory("Today's Deals"),
            _showList(),
          ],
        ),
      );

  /// DIVIDER
  Divider _setDivider() => Divider(thickness: 1.0);

  /// CATEGORY NOMINI KO'RSATISH UCHUN METOD
  Row _setTitleCategory(String title) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setTitle(title, 18.0, true),
          TextButton(
            onPressed: () {},
            child: _setTitle("See All", 14.0, false),
          ),
        ],
      );

  /// FURNITURANING KATEGORIYALARINI KO'RSATISH UCHUN MAXSUS METOD
  Row _showShopCategory() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setShopForCategory('assets/images/furniture/chair.png', "Chair"),
          _setShopForCategory('assets/images/furniture/bed.png', "Chair"),
          _setShopForCategory('assets/images/furniture/sofa.png', "Chair"),
          _setShopForCategory('assets/images/furniture/table.png', "Chair"),
        ],
      );

  /// KATEGORIYANING RASMINI VA NOMINI BERISH UCHUN METOD
  _setShopForCategory(String imagePath, String title) => Column(
        children: [
          Image.asset(
            imagePath,
            height: 64.0,
            width: 48.0,
          ),
          _setTitle(title, 14.0, false),
        ],
      );

  /// MATNLARNNI BERISH UCHUN METOD
  Text _setTitle(String title, double size, bool isBold) => Text(
        title,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontFamily: "garamond",
          fontSize: size,
        ),
      );

  SizedBox _showList() => SizedBox(
        height: _size.height * 0.2,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            itemBuilder: (context, index) {
              return _setFurnitureInfo();
            }),
      );

  InkWell _setFurnitureInfo() => InkWell(
        child: Card(
          child: Stack(
            children: [
              SizedBox(
                width: _size.width * 0.6,
                height: _size.height * 0.2,
              ),
              _showImage(),
              Positioned(
                top: 16.0,
                left: 16.0,
                child: _setTitle("Chairs Starting from\n\$39.99", 16.0, true),
              ),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                child: _setTitle("Ends in 02:00:25", 14.0, false),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(_context,
              MaterialPageRoute(builder: (_) => FurnitureShopDetailsPage()));
        },
      );

  Positioned _showImage() => Positioned(
        bottom: 0.0,
        right: 6.0,
        child: Image.asset(
          "assets/images/furniture/chair.png",
          fit: BoxFit.cover,
          height: _size.height * 0.14,
          width: _size.height * 0.13,
        ),
      );
}
