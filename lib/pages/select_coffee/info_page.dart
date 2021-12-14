import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/select_coffee/coffee_images.dart';
import 'package:flutter_ui/pages/select_coffee/coffee_model.dart';

class SelectCoffeeInfoPage extends StatelessWidget {
  CoffeeModel coffee;

  SelectCoffeeInfoPage(this.coffee);

  late Size _size;
  Color _black = Colors.black;
  Color _white = Colors.white;
  Color _grey = Colors.grey;
  Color _red = Colors.red;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() => Stack(
        children: [
          _showImage(),
          _showCoffeeInfo(),
          _getBackPressedIcon(),
          _getGlasses(),
        ],
      );

  _showImage() => Hero(
        tag: "1",
        child: Image.network(
          womanHoldingCoffee,
          height: _size.height,
          width: _size.width,
          fit: BoxFit.cover,
        ),
      );

  Positioned _showCoffeeInfo() => Positioned(
        bottom: 24.0,
        left: 16.0,
        right: 16.0,
        child: Container(
          height: _size.height * 0.12,
          width: _size.width,
          decoration: BoxDecoration(
              color: _black, borderRadius: BorderRadius.circular(100.0)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _setCoffeeInfo(coffee.name, "Coffee"),
                _setCoffeeInfo("Price", "\$${coffee.price.toInt()}"),
                _getAddButton(false),
              ],
            ),
          ),
        ),
      );

  Column _setCoffeeInfo(String topText, String bottomText) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topText,
            style: TextStyle(color: _grey, fontSize: 13.0),
          ),
          Text(
            bottomText,
            style: TextStyle(
                fontSize: 21.0, color: _white, fontWeight: FontWeight.bold),
          ),
        ],
      );

  Positioned _getBackPressedIcon() =>
      Positioned(top: 48.0, left: 16.0, child: _getAddButton(true));

  Positioned _getGlasses() => Positioned(
      top: _size.height * 0.42,
      left: 44.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: _white,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Oakley",
              style: TextStyle(
                color: _grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Glasses",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ));

  CircleAvatar _getAddButton(bool isTop) => CircleAvatar(
        backgroundColor: isTop ? _white : _red,
        radius: 24.0,
        child: Icon(
          isTop ? Icons.arrow_back : Icons.add,
          color: isTop ? _black : _white,
        ),
      );
}
