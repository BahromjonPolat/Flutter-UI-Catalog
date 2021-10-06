import 'package:flutter/material.dart';

class CoffeeDeliverySignUpPage extends StatelessWidget {
  static const Color _darkSlateGrey = Color(0xff324A59);
  static const Color _black = Colors.black;
  static const Color _grey = Colors.grey;
  static const Color _transparent = Colors.transparent;
  BuildContext _context;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  double _width;
  double _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _context = context;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: _transparent,
        iconTheme: IconThemeData(color: _black),
      );

  Padding _getBody() => Padding(
        padding: EdgeInsets.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setText("Sign up", 22, _black),
            _setText("Create an account here", 14.0, _grey),
          ],
        ),
      );



  Text _setText(String text, double size, Color color) => Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
    ),
  );
}
