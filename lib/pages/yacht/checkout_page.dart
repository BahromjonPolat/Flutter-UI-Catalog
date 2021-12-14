import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/yacht/image_links.dart';

class YachtCheckOutPage extends StatefulWidget {
  @override
  State<YachtCheckOutPage> createState() => _YachtCheckOutPageState();
}

class _YachtCheckOutPageState extends State<YachtCheckOutPage> {
  static const Color _blue = Color.fromARGB(255, 47, 128, 237);
  static const Color _white = Colors.white;
  static const Color _black = Colors.black;
  static const Color _orange = Colors.orange;
  static const Color _transparent = Colors.transparent;
  static const Color _grey = Colors.grey;
  static const Color _disabledColor = Color(0xffdddddd);
  late double _width;
  late double _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _appBar(),
      body: _getBody(),
      bottomNavigationBar: _getBottomAppBar(),
    );
  }

  AppBar _appBar() => AppBar(
        iconTheme: IconThemeData(color: _black),
        backgroundColor: _transparent,
        elevation: 0.0,
      );

  _getBody() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _setWidgetWithPadding(32.0, _setText("Checkout", 24.0, true, true)),

          _getPaymentRow(),

          _setWidgetWithPadding(
            32.0,
            _setText("Payment Cards", 18.0, true, true),
          ),

        ],
      );

  SizedBox _showPaymentCards() => SizedBox(
        height: _height * 0.36,
        child: Swiper.children(
          children: [],
        ),
      );

  _getPaymentRow() => SizedBox(
    height: _height * 0.1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _setText("Days", 14.0, true, true),
                Container(
                  decoration: _setDecoration(32.0, _blue),
                  child: Row(
                    children: [
                      _setButton(false),
                      _setText("2", 16, false, false),
                      _setButton(true),
                    ],
                  ),
                ),
              ],
            ),

            VerticalDivider(thickness: 1),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _setText("Total", 14.0, true, true),
                _setText("\$2000", 21.0, true, false),
              ],
            ),
          ],
        ),
  );

  Padding _setWidgetWithPadding(double padding, Widget widget) => Padding(
        padding: EdgeInsets.only(left: padding),
        child: widget,
      );

  Text _setText(String text, double size, bool isBlack, bool isBold) =>
      Text(text,
          style: TextStyle(
            fontSize: size,
            color: isBlack ? _black : _white,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ));

  Decoration _setDecoration(double radius, Color color) => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      );

  FloatingActionButton _setButton(isAdd) => FloatingActionButton(
        backgroundColor: isAdd ? _white : _blue,
        mini: true,
        elevation: 0.0,
        onPressed: () {},
        child: Text(
          isAdd ? '+' : '-',
          style: TextStyle(
            fontSize: 21.0,
            color: isAdd ? _blue : _white,
          ),
        ),
      );

  BottomAppBar _getBottomAppBar() => BottomAppBar(
    color: Colors.transparent,
    elevation: 0,
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: _black,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            height: 62,
            margin: const EdgeInsets.fromLTRB(32, 0, 8, 32),
            padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Pay Now",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: _black,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          height: 62,
          width: 62,
          margin: const EdgeInsets.fromLTRB(0, 0, 32, 32),
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Image.network(
            faceId,
            color: Colors.white,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
