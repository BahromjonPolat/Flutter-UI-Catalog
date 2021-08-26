import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/food_menu/food_list.dart';
import 'package:flutter_ui/pages/food_menu/food_model.dart';
import 'package:flutter_ui/pages/food_menu/horizontal.dart';

class FoodListMainPage extends StatelessWidget {
  BuildContext _context;
  Size _size;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _bodyWithCustomScrollView(_size),
    );
  }

  _bodyWithCustomScrollView(Size size) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        _sliverAppBar(),
        _showSliverListWithFoods(),
      ],
    );
  }
  /// SliverAppBar
  _sliverAppBar() => SliverAppBar(
        stretch: true,
        floating: true,
        onStretchTrigger: () {
          return;
        },
        expandedHeight: _size.height * 0.5,
        backgroundColor: Colors.orange,
        flexibleSpace: FlexibleSpaceBar(
          // Title uchun alohida funksiya yozildi.
          title: _appBarTitle(),
          centerTitle: true,

          // AppBar cho`zilganida Stretch shu mode`larda ko`rinadi.
          stretchModes: [
            // effekt yordamida fon xiralashadi.
            StretchMode.blurBackground,

            // Foydalanuvch AppBAr`ni tortganida sarlavha yo'qoladi.
            StretchMode.fadeTitle,

            // Qo'shimcha joyni to'ldirish uchun fon vidjeti kengayadi.
            StretchMode.zoomBackground
          ],
          background: Image.network(
            "https://flavorthemoments.com/wp-content/uploads/2019/07/grilled-bbq-chicken-3-600x863.jpg",
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
            // Taom nomi TextSpan yordamida qilindi. Ekranga sig`may qolishini
            // oldini
            Expanded(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Grilled BBQ Chicken \n",
                  style: TextStyle(fontSize: 16.0, color: Colors.white, shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1.2, 1.2),
                    )
                  ]),
                ),
                TextSpan(
                  text: "It isn’t summer without barbecued chicken.",
                  style: TextStyle(
                    fontSize: 9.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ])),
            ),

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
  _showSliverListWithFoods() => SliverList(
          delegate: SliverChildListDelegate(
        foodList.map((food) => _getFoodInfoTemplate(food)).toList(),
      ));

  /// Taomning xususiyatlarini olish uchun item layout.
  Widget _getFoodInfoTemplate(Food food) => Container(
        height: _size.width * 0.32,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),

        // Taom haqidagi ma'lumotlar satr ko`rinishida chiqqani uchun
        // Vidjetlar Row vidjetining ichiuga olindi.
        child: Row(
          children: [

            // Taomning rasmini ko`rsatish uchun Container. Burchaklari bir oz aylana shaklida bo`ladi.
            Container(
              height: _size.width * 0.28,
              width: _size.width * 0.28,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(food.imageUrl),
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6.0)),
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
                            text: "${food.name} \n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: "${food.subtitle}"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _getOrder(food);
                    },
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

  _getOrder(Food food) {
    showDialog(
        context: _context,
        builder: (_context) {
          return AlertDialog(
            title: Text(food.name),
            content: Container(
              child: Text.rich(TextSpan(children: [
                TextSpan(text: "${food.subtitle} \n"),
                TextSpan(text: "${food.price} USZ \n\n"),
                TextSpan(text: "Do you want to order"),
              ])),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: Text("No"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Yes"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
          );
        });
  }
}
