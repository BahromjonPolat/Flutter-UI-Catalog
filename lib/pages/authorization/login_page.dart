import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/pages/authorization/sign_up_page.dart';
import 'package:flutter_ui/pages/authorization/user_list.dart';
import 'package:flutter_ui/pages/authorization/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthLoginPage extends StatefulWidget {
  @override
  _AuthLoginPageState createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  Size _size;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  UserModel _currentUser;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getIcon(),
              _welcomeBackText(),
              _getSingToContinueText(),
              _setVerticalSize(36.0),
              _setEmailTextField(),
              _setVerticalSize(24.0),
              _setPasswordTextField(),
              _setVerticalSize(24.0),
              _goToOtherPage("Forgot Password?", AuthLoginPage()),
              _button(),
              _setSignUpButton(),
            ],
          ),
        ),
      );

  /// Sahifaning yuqori qismidagi Icon
  Icon _getIcon() => Icon(
        Icons.account_circle_rounded,
        color: Colors.grey,
        size: 128.0,
      );

  Text _welcomeBackText() => Text(
        "Welcome Back",
        style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      );

  Text _getSingToContinueText() => Text(
        "Sign to continue",
        style: TextStyle(color: Colors.grey, fontSize: 18.0),
      );

  /// Emailni kiritish uchun TextFormField
  TextFormField _setEmailTextField() => TextFormField(
        controller: _emailController,
        decoration: _setInputDecoration("EMAIL", Icon(Icons.email)),
        keyboardType: TextInputType.emailAddress,
        autofocus: true,
        textInputAction: TextInputAction.next,
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      );

  /// Parolni kiritish uchun TextFormField
  TextFormField _setPasswordTextField() => TextFormField(
        controller: _passwordController,
        decoration:
            _setInputDecoration("PASSWORD", Icon(Icons.lock_outline_sharp)),
        keyboardType: TextInputType.visiblePassword,
        autofocus: true,
        obscureText: true,
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      );

  _setInputDecoration(String label, Icon icon) => InputDecoration(
        prefixIcon: Icon(
          icon.icon,
          color: (_focusNodes[0].hasFocus ? Colors.grey : Colors.grey),
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

  /// Login Button
  Container _button() => Container(
        width: _size.width,
        margin: EdgeInsets.symmetric(vertical: 24.0),
        child: ElevatedButton(
          onPressed: _onButtonPressed,
          child: Text("LOGIN"),
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 18.0)),
        ),
      );

  /// Button bosilganida ishga tushadigan funksiya
  void _onButtonPressed() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields!");
      return;
    }

    _showDialog().show();
  }

  AwesomeDialog _showDialog() => AwesomeDialog(
        context: context,
        title: _isEmailAndPasswordTrue() ? "Welcome!" : "Wrong!",
        dialogType:
            _isEmailAndPasswordTrue() ? DialogType.SUCCES : DialogType.ERROR,
        btnOk: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("ok"),
        ),
        body: Column(

        ),
      );

  bool _isEmailAndPasswordTrue() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    for (UserModel user in userList) {
      if (email == user.email && password == user.password) {
        return true;
      }
    }
    return false;
  }

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
            "Don't have an account?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _goToOtherPage("Sign Up", AuthSignUpPage())
        ],
      );

  /// Focus Node
  List<FocusNode> _focusNodes = [FocusNode(), FocusNode()];

  SizedBox _setVerticalSize(double size) => SizedBox(
        height: size,
      );
}
