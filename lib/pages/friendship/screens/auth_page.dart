import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/friendship/data/data.dart';
import 'package:flutter_ui/pages/friendship/models/user_model.dart';
import 'package:flutter_ui/pages/friendship/screens/home/home_page.dart';

/// REGISTER PAGE
class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Size _size;
  bool _isRegister = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _dateController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _setAppBar(title: _isRegister ? "Registration Page" : "Login"),
      backgroundColor: Colors.teal,
      body: _isRegister ? _getRegistrationBody() : _showLoginPage(),
    );
  }

  /// REGISTRATION PAGE
  _getRegistrationBody() => Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: _size.height * 0.5,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: _nameController,
                      style: _getInputTextStyle(),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: _setInputDecoration(
                          hintText: "Name", icon: Icons.person),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Maydon bo'sh bo'lishi mumkin emas!";
                        }
                        if (value.length < 3) {
                          return "3 tadan kam belgi bo'lishi mumkin emas!";
                        }
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      style: _getInputTextStyle(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _setInputDecoration(
                          hintText: "Email", icon: Icons.email),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Maydon bo'sh bo'lishi mumkin emas!";
                        }
                        if (value.length < 3) {
                          return "3 tadan kam belgi bo'lishi mumkin emas!";
                        }
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      style: _getInputTextStyle(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: _setInputDecoration(
                          hintText: "Phone", icon: Icons.phone),
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Maydon bo'sh bo'lishi mumkin emas!";
                        if (value.length < 3)
                          return "3 tadan kam belgi bo'lishi mumkin emas!";
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: _getInputTextStyle(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: _setInputDecoration(
                          hintText: "Password", icon: Icons.lock),
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Maydon bo'sh bo'lishi mumkin emas!";
                        if (value.length < 3)
                          return "3 tadan kam belgi bo'lishi mumkin emas!";
                      },
                    ),
                    ElevatedButton(
                        style: _setButtonStyle(_size),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              String name = _nameController.text;
                              String email = _emailController.text;
                              String phone = _phoneController.text;
                              String password = _passwordController.text;
                              User user =
                                  User(name, email, phone, password, "default");
                              userListInfo.add(user);
                              currentUser = user;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MainPage()));
                            }
                          });
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    _changePage()
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Row _changePage() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _isRegister ? "Have you an account?" : "Have no an account?",
            style: TextStyle(color: Colors.grey.shade300),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _isRegister = !_isRegister;
                });
              },
              child: Text(
                _isRegister ? "Sign In" : "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      );

  /// LOGIN PAGE
  _showLoginPage() => Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: _size.height * 0.32,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      style: _getInputTextStyle(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _setInputDecoration(
                          hintText: "Email", icon: Icons.email),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Maydon bo'sh bo'lishi mumkin emas!";
                        }
                        if (value.length < 3)
                          return "3 tadan kam belgi bo'lishi mumkin emas!";
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: _getInputTextStyle(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: _setInputDecoration(
                          hintText: "Password", icon: Icons.lock),
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Maydon bo'sh bo'lishi mumkin emas!";
                        if (value.length < 3)
                          return "3 tadan kam belgi bo'lishi mumkin emas!";
                      },
                    ),
                    ElevatedButton(
                        style: _setButtonStyle(_size),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String email =
                                _emailController.text.toLowerCase().trim();
                            String password =
                                _passwordController.text.toLowerCase().trim();
                            bool isValid = false;
                            for (User user in userListInfo) {
                              if (email == user.email &&
                                  password == user.password) {
                                currentUser = user;
                                isValid = true;
                                break;
                              }
                            }

                            if (isValid) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MainPage()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Container(
                                child: Text("Wrong Email or Password!"),
                              )));
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    _changePage(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  ButtonStyle _setButtonStyle(Size size) => ElevatedButton.styleFrom(
      primary: Colors.white, fixedSize: Size(size.width * 0.6, 48.0));

  TextStyle _getInputTextStyle() => TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      );

  InputDecoration _setInputDecoration({String? hintText, icon}) =>
      InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(
            icon,
            color: Colors.teal,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          hintStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)),
          border: OutlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)));

  AppBar _setAppBar({String? title}) => AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          title!,
          style: TextStyle(color: Colors.teal.shade100),
        ),
      );

}
