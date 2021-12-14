import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/authorization/provider/sign_up_provider.dart';
import 'package:flutter_ui/pages/authorization/screens/login_page.dart';
import 'package:flutter_ui/components/exporting_packages.dart';

class AuthSignUpPage extends StatefulWidget {
  @override
  _AuthSignUpPageState createState() => _AuthSignUpPageState();
}

class _AuthSignUpPageState extends State<AuthSignUpPage> {
  late Size _size;

  late SignUpProvider _context;

  @override
  Widget build(BuildContext context) {
     _context = context.watch<SignUpProvider>();

    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  /// AppBar
  _getAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.green),
      );

  /// Body
  Container _getBody() => Container(
        // alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getSignUpText(),
              _setVerticalSize(32.0),
              _getFormField(),
              _getElevatedButton(),
              _setSignUpButton(),
            ],
          ),
        ),
      );

  Form _getFormField() => Form(
    key: _context.globalKey,
        child: SingleChildScrollView(
          child: Container(
            height: _size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Foydalanuvchining ismini olish uchun TextFormField
                TextFormField(
                  controller: _context.nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: _setInputDecoration(
                      "NAME", Icon(Icons.person_outline_outlined)),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),

                /// Foydalanuvchining emailini olish uchun TextFormField
                TextFormField(
                  controller: _context.emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      _setInputDecoration("EMAIL", Icon(Icons.email_outlined)),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),

                /// Foydalanuvchining telefon raqamini olish uchun TextFormField
                TextFormField(
                  controller: _context.phoneController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: _setInputDecoration("PHONE", Icon(Icons.phone)),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),

                /// Foydalanuvchi parol kiritishi uchun TextFormField
                TextFormField(
                  controller: _context.passwordController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: _setInputDecoration(
                      "PASSWORD", Icon(Icons.lock_open_sharp)),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                  obscureText: true,
                ),

                /// Foydalanuvchi kiritgan parolini tasdiqlashi uchun TextFormField
                TextFormField(
                  controller: _context.confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: _setInputDecoration(
                      "CONFIRM PASSWORD", Icon(Icons.lock_outline)),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      );

  /// Input decoration
  _setInputDecoration(String label, Icon icon) => InputDecoration(
        prefixIcon: Icon(
          icon.icon,
          color: Colors.grey,
        ),
        labelText: label,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      );

  /// Registration button
  Container _getElevatedButton() => Container(
        margin: EdgeInsets.symmetric(vertical: 24.0),
        width: _size.width,
        child: ElevatedButton(
          onPressed: onButtonPressed,
          child: Text("REGISTRATION"),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 18.0),
          ),
        ),
      );

  void onButtonPressed() {
    _context.checkFields();
  }

  Text _getSignUpText() => Text(
        "Sign Up",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36.0,
        ),
      );

  /// Boshqa sahifaga o`tish uchun TextButton
  Container _goToOtherPage(String pageName, Widget page) => Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          },
          child: Text(
            pageName,
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      );

  Row _setSignUpButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _goToOtherPage("Login", AuthLoginPage())
        ],
      );

  SizedBox _setVerticalSize(double size) => SizedBox(
        height: size,
      );

}
