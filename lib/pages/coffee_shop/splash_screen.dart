import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/coffee_shop/main.dart';

class CoffeeShopSplashScreen extends StatefulWidget {
  @override
  _CoffeeShopSplashScreenState createState() => _CoffeeShopSplashScreenState();
}

class _CoffeeShopSplashScreenState extends State<CoffeeShopSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: _getBody(),
    );
  }

  Column _getBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.emoji_food_beverage_outlined,
                  size: 120,
                  color: Colors.brown[800],
                ),
                Text(
                  "COFFEE SHOP",
                  style: TextStyle(
                      color: Colors.brown[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      fontFamily: "garamond"),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment(0.0, 0.6),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 56.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                  child: Text(
                    "Get started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontFamily: "garamond"),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CoffeeShopMainPage()));
                  },
                ),
              ),
            ),
          ),
        ],
      );
}
