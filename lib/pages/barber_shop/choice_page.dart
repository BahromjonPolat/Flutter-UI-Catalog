import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarberShopChoicePage extends StatefulWidget {
  @override
  _BarberShopChoicePageState createState() => _BarberShopChoicePageState();
}

class _BarberShopChoicePageState extends State<BarberShopChoicePage> {
  Color _mainColor = Color.fromARGB(255, 56, 52, 67);
  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _mainColor,
      body: _getBody(),
    );
  }

  CustomScrollView _getBody() => CustomScrollView(
        slivers: [
          _sliverAppBar(),
          _getSliverBody(),
          _sliverGrid(),
        ],
      );

  SliverAppBar _sliverAppBar() => SliverAppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      );

  SliverList _getSliverBody() => SliverList(
          delegate: SliverChildListDelegate([
        _setTitle("Let the journey begin"),
        _showNewsLayout(),
        _setSmallText(),
        _setTitle("Your choice"),
        _showCategories(),
      ]));

  Container _showNewsLayout() => Container(
        height: _size.height * 0.17,
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 114, 83, 136),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
            bottomLeft: Radius.circular(24.0),
          ),
        ),
        child: Row(
          children: [
            VerticalDivider(color: Colors.white),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _setSimpleText("What happens in the", 16.0),
                _getBarberShopText(),
                _setSimpleText("Stay in the", 16.0),
                _getBarberShopText(),
              ],
            ),
            Expanded(
                child: SvgPicture.asset("assets/images/barber/barber_main.svg"))
          ],
        ),
      );

  Padding _showCategories() => Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _categoryList
              .map((title) => _setSimpleText(title, 16.0))
              .toList(),
        ),
      );

  /// Sliver Grid
  SliverPadding _sliverGrid() => SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        sliver: SliverGrid.count(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children:
              List.generate(_styleList.length, (index) => _styleLayout(index)),
        ),
      );

  Container _styleLayout(int index) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Image.asset("assets/images/barber/beard_$index.png")),
            _setSimpleText(_styleList[index], 14.0)
          ],
        ),
      );

  Padding _setTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Text(
          title,
          style: TextStyle(
              color: Color.fromARGB(255, 207, 193, 244),
              fontWeight: FontWeight.bold,
              fontFamily: "poppins",
              fontSize: 32.0),
        ),
      );

  Padding _setSmallText() => Padding(
        padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 6.0, bottom: 16.0),
        child: _setSimpleText(
            "Unless you posted it all to social networks*", 10.5),
      );

  Text _setSimpleText(String text, double size) => Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: size),
      );

  Text _getBarberShopText() => Text(
        "Barber Shop",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "dancing_script",
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );

  List<String> _categoryList = ["All", "Haircut", "Beard", "Trimming"];

  List<String> _styleList = [
    "Classic",
    "Barber's dream",
    "Handsom",
    "Shiny",
    "Old way",
    "Romantic",
    "Gibson",
    "Harsh",
    "Focused"
  ];
}
