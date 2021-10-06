import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/coffee_delivery/sign_in_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  double _width;
  double _height;
  static const Color _darkSlateGrey = Color(0xff324A59);
  static const Color _black = Colors.black;
  static const Color _grey = Colors.grey;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _context = context;
    return Scaffold(
      body: _getBody(),
      floatingActionButton: _getFloatingActionButton(),
    );
  }

  Column _getBody() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getImage(),
          _setText("Making your days with our coffee.", _black, 22),
          _setText(
              "The best grain, the finest roast, the most powerful flavor.",
              _grey,
              14),
          _showSmoothIndicator(),
        ],
      );

  Padding _setText(String text, Color color, double size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 16.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontFamily: "poppins",
          ),
        ),
      );

  Image _getImage() => Image.asset(
        "assets/images/coffee_delivery/on_boarding_logo.png",
        height: _height * 0.3,
        width: _width,
      );

  FloatingActionButton _getFloatingActionButton() => FloatingActionButton(
      backgroundColor: _darkSlateGrey,
      elevation: 0.0,
      child: Icon(Icons.arrow_forward),
      onPressed: onButtonPressed);

  void onButtonPressed() {
    Navigator.push(_context,
        MaterialPageRoute(builder: (_) => CoffeeDeliverySignInPage()));
  }

  SmoothIndicator _showSmoothIndicator() => SmoothIndicator(
        offset: 0.0,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: _darkSlateGrey,
          dotHeight: 8.0,
          dotWidth: 8.0,
        ),
      );
}
