import 'package:flutter/material.dart';

class OrderFoodFilterPage extends StatefulWidget {
  @override
  _OrderFoodFilterPageState createState() => _OrderFoodFilterPageState();
}

class _OrderFoodFilterPageState extends State<OrderFoodFilterPage> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () {}),
        title: Text(
          "Filter",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Reset all",
                style: TextStyle(color: Colors.deepOrange),
              ))
        ],
      );

  _getBody() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getSlider("Distance"),
            _getSlider("Price"),
            _setCategory("Cuisine"),
            _getCuisine(),
            _setCategory("Diet"),
            _getDietList(),
            _getApplyButton(),
          ],
        ),
      );

  _getSlider(String category) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _setCategory(category),
              Text(
                "10mi",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          ),
          Slider(
            value: 8,
            onChanged: (v) {},
            min: 5.0,
            max: 15.0,
            thumbColor: Colors.green,
            activeColor: Colors.green,
            inactiveColor: Colors.grey[300],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("5 mi"),
              Text("15 mi"),
            ],
          ),
        ],
      );

  _getCuisine() => Wrap(
    spacing: 12.0,
    children: [
      _getButton("English"),
      _getButton("Chines"),
      _getButton("Indian"),
      _getButton("Thai"),
    ],
  );

  _getDietList() => Wrap(
    spacing: 12.0,
    children: [
      _getButton("Paleo"),
      _getButton("Ketogenic"),
      _getButton("Jollof Rich"),
      _getButton("Banku"),
      _getButton("Tuna Sandwich"),
    ],
  );

  _getButton(String buttonText) => ElevatedButton(onPressed: (){}, child: Text(buttonText));

  _setCategory(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      );

  _getApplyButton() => SizedBox(
      width: _size.width,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Apply Filter"),
        style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            padding: EdgeInsets.symmetric(vertical: 16.0)),
      ));
}
