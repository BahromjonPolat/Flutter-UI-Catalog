import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FoodHorizontalListPage extends StatelessWidget {
  // Ekranning o`lchamlarini klasning barcha metodlarida
  // ishlata olish uchun Size global qilib olindi.
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _showAppBar(),
      body: _bodyWithSingleScrollView(_size),
      drawer: Drawer(),
    );
  }

  _showAppBar() => AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(icon: Icon(CupertinoIcons.search), onPressed: () {})
        ],
      );

  _bodyWithSingleScrollView(Size size) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _setCategoryText("Top Foods", Colors.red),
          _setFoodList(),
          _setCategoryText("More Categories", Colors.black),
          _setFoodCategory(),
        ],
      ),
    );
  }

  _setCategoryText(String text, color) => Text(
        text,
        style: TextStyle(
            color: color, fontWeight: FontWeight.bold, fontSize: 24.0),
      );

  /// Food Info Item Layout
  _setFoodList() => Container(
        height: _size.width * 1.0,
        width: _size.width * 1.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              Size size = MediaQuery.of(context).size;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                width: _size.width * 0.9,
                height: _size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(6.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://source.unsplash.com/random"),
                  ),
                ),
                child: _setFoodInfo(),
              );
            }),
      );

  /// Food Info Item Layout`ning taomning nomini, manzilni va
  /// 'FloatingActionButton'ni ko`rsatish uchun alohida funksiya.
  _setFoodInfo() => Container(
        // ichidagi elementlarni ekranning burchagiga yopishib qolmasligi
        // uchun padding berildi.
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Taom nomi TextSpan yordamida qilindi
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "Tapioca Toast \n",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text: "Baker street 221b.",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ])),

            FloatingActionButton(
              onPressed: () {},
              mini: true,
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
            )
          ],
        ),
      );

  _setFoodCategory() => Container(
        height: _size.height * 0.32,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: 25,
            itemBuilder: (ctx, index) {
              return Container(
                width: _size.width * 0.4,
                height: _size.height * 0.3,
                alignment: Alignment(-0.85, 0.85),
                margin: EdgeInsets.symmetric(horizontal: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://source.unsplash.com/random"),
                  ),
                ),
                child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                      text: "Hamburger Big \n",
                    ),

                    TextSpan(
                      text: "\$3.45 USD"
                    ),
                  ]
                )),
              );
            }),
      );
}
