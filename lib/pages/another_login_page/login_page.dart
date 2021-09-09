import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/another_login_page/profile_page.dart';

class AnotherLoginPage extends StatelessWidget {
  BuildContext _context;
  Size _size;

  @override
  Widget build(BuildContext context) {
    _context = context;
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      );

  Container _getBody() => Container(
        margin: EdgeInsets.only(top: 48.0, left: 24.0, right: 24.0),
        child: SingleChildScrollView(
          child: Container(
            height: _size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey, \nLogin Now.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                ),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(
                          text: "if you are new / ",
                          style: TextStyle(color: Colors.grey)),
                      TextSpan(text: "Create New")
                    ],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0))),
                _getForm(),
                _getButton(),
                _getSkipNowText(),
              ],
            ),
          ),
        ),
      );

  Container _getForm() => Container(
        height: _size.height * 0.2,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: _getInputDecoration("Login"),
                style: _getTextStyle(),
              ),
              TextFormField(
                style: _getTextStyle(),
                decoration: _getInputDecoration("Password"),
                obscureText: true,
              ),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: "Forgot passcode? / ",
                        style: TextStyle(color: Colors.grey)),
                    TextSpan(text: "Reset")
                  ],
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))),
            ],
          ),
        ),
      );

  InputDecoration _getInputDecoration(String hint) => InputDecoration(
        hintText: hint,
        fillColor: Colors.orange[300],
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none),
      );

  TextStyle _getTextStyle() => TextStyle(fontWeight: FontWeight.bold);

  Container _getButton() => Container(
        width: _size.width,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(_context,
                MaterialPageRoute(builder: (context) => AnotherProfilePage()));
          },
          child: Text("Login"),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              primary: Colors.red[800]),
        ),
      );

  Container _getSkipNowText() => Container(
        alignment: Alignment.center,
        child: Text("Skip Now"),
      );
}
