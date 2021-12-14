import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/coffee_delivery/sign_up_page.dart';

class CoffeeDeliverySignInPage extends StatelessWidget {
  static const Color _darkSlateGrey = Color(0xff324A59);
  static const Color _black = Colors.black;
  static const Color _grey = Colors.grey;
  static const Color _transparent = Colors.transparent;
  late BuildContext _context;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  late double _width;
  late double _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _context = context;
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
        backgroundColor: _transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: _darkSlateGrey),
      );

  Padding _getBody() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 41, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setText("Sign in", 22, _black),
            SizedBox(height: 24.0),
            _setText("welcome back", 14, _grey),
            SizedBox(height: 49.0),
            _setTextFormField(true),
            SizedBox(height: 24.0),
            _setTextFormField(false),
            SizedBox(height: 24.0),
            Center(child: _setText("Forgot Password?", 14.0, _black)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _getFloatingActionButton(),
              ],
            ),
            Spacer(),
            Row(
              children: [
                _setText("New member? ", 14.0, _grey),
                _setText("Sign up ", 14.0, _black),
              ],
            ),
          ],
        ),
      );

  FloatingActionButton _getFloatingActionButton() => FloatingActionButton(
      backgroundColor: _darkSlateGrey,
      elevation: 0.0,
      child: Icon(Icons.arrow_forward),
      onPressed: onButtonPressed);

  void onButtonPressed() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => CoffeeDeliverySignUpPage(),
      ),
    );
  }

  TextFormField _setTextFormField(bool isEmail) => TextFormField(
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        textInputAction: isEmail ? TextInputAction.next : TextInputAction.done,
        obscureText: isEmail ? false : true,
        decoration: InputDecoration(
          hintText: isEmail ? "Email address" : "Password",
          hintStyle: TextStyle(color: _grey),
          suffixIcon: isEmail ? SizedBox() : Icon(Icons.remove_red_eye_rounded),
          prefixIcon: SizedBox(
            width: 10.0,
            child: Row(
              children: [
                Icon(
                  isEmail ? CupertinoIcons.mail : CupertinoIcons.lock,
                  size: 16.13,
                ),
                SizedBox(height: 15.0, child: VerticalDivider(thickness: 1))
              ],
            ),
          ),
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
