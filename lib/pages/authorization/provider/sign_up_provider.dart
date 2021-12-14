
import 'package:flutter/material.dart';
import 'package:flutter_ui/components/exporting_packages.dart';
import 'package:flutter_ui/pages/authorization/data/user_list.dart';
import 'package:flutter_ui/pages/authorization/models/user_model.dart';
import 'package:flutter_ui/pages/authorization/screens/login_page.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  void checkFields() {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();

      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String phone = _phoneController.text.trim();
      String password = _passwordController.text.trim();
      String confirmPassword = _confirmPasswordController.text.trim();

      if (name.isEmpty ||
          email.isEmpty ||
          phone.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty) {
        Fluttertoast.showToast(msg: "Please Fill All Fields");
        return;
      }

      if (!_isValidEmail()) {
        Fluttertoast.showToast(msg: "Please enter a valid email");
      }

      if (password != confirmPassword) {
        Fluttertoast.showToast(msg: "Please enter the same password");
        return;
      }

      UserModel user = new UserModel(1, name, email, phone, password);
      userList.add(user);
    }
  }


  bool _isValidEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(_emailController.text);

  GlobalKey<FormState> get globalKey => _globalKey;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get emailController => _emailController;

  TextEditingController get nameController => _nameController;
}