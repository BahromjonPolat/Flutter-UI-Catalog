import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/coffee_bar/coffee_list.dart';
import 'package:flutter_ui/pages/coffee_bar/coffee_model.dart';
import 'package:flutter_ui/pages/instagram/ui/bottom_nav_bar.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class CoffeeInfoPage extends StatefulWidget {
  @override
  _CoffeeInfoPageState createState() => _CoffeeInfoPageState();
}

class _CoffeeInfoPageState extends State<CoffeeInfoPage> {
  Size _size;
  Coffee _coffee = coffeeList[0];

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: _body(),
    );
  }

  Widget _body() => Column(
        children: [
          _getTopContainer(),
          _setInfo(),
        ],
      );

  Container _getTopContainer() => Container(
        alignment: Alignment.bottomCenter,
        height: _size.height * 0.6,
        width: _size.width * 1.0,
        decoration: BoxDecoration(
            color: Colors.deepOrange,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(_coffee.imageUrl),
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white54,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            _setCoffeeInfo(),
          ],
        ),
      );

  /// Coffee ha haqidagi ma'lumotni ko`rsatuvchi funksiya
  /// Rasm ustidagi glass effect ichidagi
  GlassContainer _setCoffeeInfo() => GlassContainer(
        height: _size.height * 0.2,
        width: _size.width * 1.0,
        borderRadius: BorderRadius.circular(24.0),
        opacity: 0.1,
        shadowStrength: 1.0,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 24.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _coffee.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _coffee.component,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Colors.orange,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(text: "${_coffee.rating}"),
                            TextSpan(text: "(6,986)"),
                          ]),
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ///
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 48.0,
                          width: 48.0,
                          padding: EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.emoji_food_beverage_outlined,
                                color: Colors.orange,
                              ),
                              Text(
                                "Coffee",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              )
                            ],
                          )),
                      Container(
                          height: 48.0,
                          width: 48.0,
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.edit_location,
                                color: Colors.orange,
                              ),
                              Text(
                                "Milk",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              )
                            ],
                          )),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Medium Roasted",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Container _setInfo() => Container(
        height: _size.height * 0.4,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _setDescription(),
            _setSizes(),
            _getBuyingSection(),
          ],
        ),
      );

  Widget _setDescription() => Text.rich(
        TextSpan(children: [
          TextSpan(text: "Description \n\n"),
          TextSpan(
              text:
                  "A cappuccino is a coffee-based drink made primarily from espresso and milk..."),
          TextSpan(text: "Read More", style: TextStyle(color: Colors.orange))
        ]),
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );

  Row _setSizes() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setSize("S", true),
          _setSize("M", false),
          _setSize("L", false),
        ],
      );

  Container _setSize(String size, bool isSelected) => Container(
        alignment: Alignment.center,
        width: _size.width * 0.25,
        height: _size.height * 0.045,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.white24,
          border: Border.all(color: (isSelected) ? Colors.orange : Colors.transparent)
        ),
        child: Text(
          size,
          style: TextStyle(
            color: (isSelected) ? Colors.orange : Colors.white,
          ),
        ),
      );

  Row _getBuyingSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(children: [
              TextSpan(text: "Price\n"),
              TextSpan(text: "\$", style: TextStyle(color: Colors.orange)),
              TextSpan(text: "${_coffee.price}")
            ]),
            style: TextStyle(color: Colors.white),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Buy Now",
              style: TextStyle(fontSize: 20.0),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                padding: EdgeInsets.symmetric(
                    horizontal: _size.width * 0.22, vertical: 16.0)),
          )
        ],
      );

}
