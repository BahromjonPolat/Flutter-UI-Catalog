import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeInfoPage extends StatefulWidget {
  @override
  _CoffeeInfoPageState createState() => _CoffeeInfoPageState();
}

class _CoffeeInfoPageState extends State<CoffeeInfoPage> {
  Size _size;

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
        ],
      );

  Container _getTopContainer() => Container(
        alignment: Alignment.bottomCenter,
        height: _size.height * 0.6,
        width: _size.width * 1.0,
        decoration: BoxDecoration(
            color: Colors.deepOrange,
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
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(CupertinoIcons.back),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(CupertinoIcons.back),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: _size.height * 0.2,
              width: _size.width * 1.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: Colors.black26,
              ),
            ),
          ],
        ),
      );
}
