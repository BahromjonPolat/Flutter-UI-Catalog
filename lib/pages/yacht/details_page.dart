import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_ui/pages/yacht/checkout_page.dart';
import 'package:flutter_ui/pages/yacht/image_links.dart';

class YachtDetailsPage extends StatelessWidget {
  static const Color _blue = Color.fromARGB(255, 47, 128, 237);
  static const Color _white = Colors.white;
  static const Color _black = Colors.black;
  static const Color _orange = Colors.orange;
  static const Color _transparent = Colors.transparent;
  static const Color _grey = Colors.grey;
  static const Color _disabledColor = Color(0xffdddddd);

  late double _width;
  late double _height;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _context = context;
    return Scaffold(
      backgroundColor: _blue,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
        backgroundColor: _blue,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart)),
        ],
      );

  _getBody() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _setText("Atlantida", 24.0, true),
                      _setText("Yacht", 21.0, false),
                      SizedBox(height: 32.0),

                      Row(
                        children: [
                          _setText("\$1000", 21.0, true),
                          _setText(" / day", 18.0, false),
                        ],
                      ),
                      SizedBox(height: 48.0),
                      _setYachtInfo(74, "Lengths"),
                      SizedBox(height: 20.0),
                      _setYachtInfo(25, "Height"),
                      SizedBox(height: 20.0),
                      _setYachtInfo(90, "Draft"),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Image.network(yachtFromTop, fit: BoxFit.cover)),
            ],
          ),
          _goToRentYacht(),
        ],
      );

  Stack _setYachtInfo(int size, String label) => Stack(children: [
        Container(
          width: _width * 0.36,
          height: _width * 0.28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: _white),
          ),
        ),
        Positioned(
          left: 24.0,
          top: 32,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _setText('$size', 24, false),
              _setText(" m", 12.0, false),
            ],
          ),
        ),
        Positioned(
          bottom: 24.0,
          left: 24.0,
          child: _setText(label, 16.0, false),
        ),
        Positioned(
            right: 16,
            top: 16.0,
            child: Icon(
              CupertinoIcons.arrow_down_right_arrow_up_left,
              size: 16.0,
              color: _white,
            )),
      ]);

  Container _goToRentYacht() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        margin: EdgeInsets.only(left: 24, right: 16.0, bottom: 16.0),
        height: 72.0,
        decoration: BoxDecoration(
          color: _black,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _setText("Rent now", 16.0, false),
            FloatingActionButton.extended(
              backgroundColor: _white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.00),
              ),
              extendedPadding: EdgeInsets.all(12.0),
              onPressed: onButtonPressed,
              label: Icon(
                Icons.arrow_forward,
                color: _black,
              ),
            ),
          ],
        ),
      );

  Text _setText(String text, double size, bool isBold) => Text(
        text,
        style: TextStyle(
          color: _white,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: size,
        ),
      );

  void onButtonPressed() {
    Navigator.push(
        _context, MaterialPageRoute(builder: (_) => YachtCheckOutPage()));
  }
}
