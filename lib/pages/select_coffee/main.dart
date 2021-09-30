import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/select_coffee/coffee_images.dart';
import 'package:flutter_ui/pages/select_coffee/coffee_list.dart';
import 'package:flutter_ui/pages/select_coffee/coffee_model.dart';
import 'package:flutter_ui/pages/select_coffee/info_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectCoffeeMainPage extends StatefulWidget {
  @override
  _SelectCoffeeMainPageState createState() => _SelectCoffeeMainPageState();
}

class _SelectCoffeeMainPageState extends State<SelectCoffeeMainPage> {
  Color _backgroundColor = Color(0xfff3e7d0);
  Color _black = Colors.black;
  Color _brown = Colors.brown;
  Color _white = Colors.white;
  Color _grey = Colors.grey;
  Size _size;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: _getBody(),
    );
  }

  _getBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _setHeight(64.0),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: _setText("Select", _black, 32.0, false),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: _setText("Coffee", _black, 42.0, true),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: _getSmoothPageIndicator(),
          ),
          Spacer(),
          _showCoffeeList(),
          _getFooter(),
          Spacer(),
        ],
      );

  AnimatedSmoothIndicator _getSmoothPageIndicator() => AnimatedSmoothIndicator(
        effect: WormEffect(
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade300,
            dotHeight: 6.0,
            dotWidth: 16.0),
        activeIndex: 0,
        count: 4,
      );

  _showCoffeeList() => SizedBox(
        height: _size.height * 0.51,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 48.0),
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: selectCoffeeList.length,
            itemBuilder: (context, index) {
              CoffeeModel coffee = selectCoffeeList[index];
              return _setCoffeeInfo(coffee);
            }),
      );

  _setCoffeeInfo(CoffeeModel coffee) => Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SelectCoffeeInfoPage(coffee)));
            },
            child: Container(
              margin: EdgeInsets.only(right: 32.0, bottom: 16.0),
              height: _size.height * 0.5,
              width: _size.width * 0.7,
              decoration: BoxDecoration(
                  color: _white,
                  image: DecorationImage(
                      alignment: Alignment.topRight,
                      fit: BoxFit.cover,
                      image: NetworkImage(coffee1)),
                  borderRadius: BorderRadius.circular(32.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, bottom: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _setText(coffee.name, _brown, 18.0, false),
                    _setText(coffee.description, _black, 32.0, true),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 6.0,
              right: 6.0,
              child: Container(
                alignment: Alignment.center,
                height: 48.0,
                width: 64,
                decoration: BoxDecoration(
                    color: _black, borderRadius: BorderRadius.circular(32.0)),
                child: _setText("\$${coffee.price.toInt()}", _white, 24, true),
              ))
        ],
      );

  _getFooter() => SizedBox(
        height: _size.height * 0.1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 48.0, right: 24.0),
              child: CircleAvatar(
                child: Icon(Icons.arrow_back),
                backgroundColor: _white,
              ),
            ),
            SizedBox(
              height: 24.0,
              width: _size.width * 0.7,
              child: ListView.separated(
                itemCount: selectCoffeeList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  CoffeeModel coffee = selectCoffeeList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _setText(
                        coffee.name, index == 0 ? _black : _grey, 16.0, true),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 24.0,
                    child: _setText("•", _grey, 18.0, true),
                  );
                },
              ),
            )
          ],
        ),
      );

  SizedBox _setHeight(double size) => SizedBox(height: size);

  Text _setText(String text, Color color, double size, bool isBold) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: "garamond",
            fontSize: size,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color),
      );
}
