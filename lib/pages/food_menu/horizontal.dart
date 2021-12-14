import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/food_menu/food_list.dart';
import 'package:flutter_ui/pages/food_menu/food_model.dart';

class FoodHorizontalListPage extends StatelessWidget {
  // Ekranning o`lchamlarini klasning barcha metodlarida
  // ishlata olish uchun Size global qilib olindi.
  late Size _size;

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

  _setCategoryText(String text, color) => Container(
    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
    child: Text(
          text,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
  );

  /// Food Info Item Layout
  _setFoodList() => Container(
        height: _size.width * 1.0,
        width: _size.width * 1.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              Food food = foodList[index];
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
                    image: NetworkImage("${food.imageUrl}"),
                  ),
                ),
                child: _setFoodInfo(food),
              );
            }),
      );

  /// Food Info Item Layout`ning taomning nomini, manzilni va
  /// 'FloatingActionButton'ni ko`rsatish uchun alohida funksiya.
  _setFoodInfo(Food food) => Container(
        // ichidagi elementlarni ekranning burchagiga yopishib qolmasligi
        // uchun padding berildi.
        padding: EdgeInsets.only(right: 16.0, bottom: 32.0),
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Taom nomi TextSpan yordamida qilindi
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                color: Colors.black54,
              ),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "${food.name} \n",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: "${food.subtitle}",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ])),
            ),

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
        height: _size.height * 0.3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodList.length,
            itemBuilder: (ctx, index) {
              Food food = foodList[index];
              return Container(
                width: _size.width * 0.4,
                height: _size.height * 0.3,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(horizontal: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(food.imageUrl),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                  ),

                  width: _size.width * 1.0,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${food.name} \n",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        TextSpan(
                          text: "${food.price} UZS",
                          style: TextStyle(
                            color: Colors.white,
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
}
