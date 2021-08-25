import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/food_menu/horizontal.dart';

class FoodListMainPage extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _bodyWithCustomScrollView(size),
    );
  }

  _bodyWithCustomScrollView(Size size) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        _sliverAppBar(size),
        _showSliverListWithFoods(size),
      ],
    );
  }

  _sliverAppBar(Size size) => SliverAppBar(
        stretch: true,
        floating: true,
        stretchTriggerOffset: 150,
        onStretchTrigger: () {
          return;
        },
        expandedHeight: size.height * 0.5,
        backgroundColor: Colors.orange,
        flexibleSpace: FlexibleSpaceBar(
          // Title uchun alohida funksiya yozildi.
          title: _appBarTitle(),
          centerTitle: true,
          stretchModes: [
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
            StretchMode.zoomBackground
          ],
          background: Image.network(
            "https://source.unsplash.com/random/",
            fit: BoxFit.cover,
          ),
        ),
      );

  /// Flexible Space Title
  _appBarTitle() => Container(
        // AppBar Title ichidagi elementlarni ekranning burchagiga yopishib qolmasligi
        // uchun padding berildi.
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Taom nomi TextSpan yordamida qilindi
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "Tapioca Toast \n",
                style: TextStyle(fontSize: 16.0),
              ),
              TextSpan(
                  text: "Baker street 221b.",
                  style:
                      TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400)),
            ])),

            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    _context,
                    MaterialPageRoute(
                        builder: (_) => FoodHorizontalListPage()));
              },
              mini: true,
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
            )
          ],
        ),
      );

  /// Taomlarning ro`yxatini ko`rsatish uchun funksiya.
  _showSliverListWithFoods(Size size) => SliverList(
          delegate: SliverChildListDelegate(List.generate(
        15,
        (index) => _getFoodInfoTemplate(size),
      )));

  /// Taomning xususiyatlarini olish uchun item layout.
  _getFoodInfoTemplate(Size size) => Container(
        height: size.width * 0.32,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Row(
          children: [
            Container(
              height: size.width * 0.28,
              width: size.width * 0.28,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(6.0)),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Hamburger \n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: "Hamburger"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Buyurtma berish"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
