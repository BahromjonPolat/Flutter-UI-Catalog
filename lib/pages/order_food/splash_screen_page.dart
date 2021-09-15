import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/order_food/game.dart';
import 'package:flutter_ui/pages/order_food/main.dart';

class OrderFoodSplashScreenPage extends StatelessWidget {
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getBody(),
    );
  }

  Container _getBody() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Column(
          children: [
            _getTopPart(),
            _getBottomPart(),
          ],
        ),
      );

  Expanded _getTopPart() => Expanded(
          child: Container(
        child: Image.asset("assets/images/order_food/food_initial.png"),
      ));

  Expanded _getBottomPart() => Expanded(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setText("Order your \nFavourite \nFood", 42.0),
            _setText(
                "Made by the finest Home Chefs, every dish raises the bar of Taste. Health, Hygiene and cleaniness",
                16.0),
            _getSkipButton(),
          ],
        ),
      ));

  Text _setText(String text, double size) => Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: (size > 20) ? FontWeight.bold : FontWeight.normal,
        ),
      );

  _getSkipButton() => GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Skip"),
            CircleAvatar(
              radius: 36.0,
              child: Icon(Icons.arrow_forward_ios_outlined),
              backgroundColor: Colors.deepOrange,
            ),
          ],
        ),
        onTap: () {
          Navigator.pushReplacement(_context,
              MaterialPageRoute(builder: (context) => GamePage()));
        },
      );
}
