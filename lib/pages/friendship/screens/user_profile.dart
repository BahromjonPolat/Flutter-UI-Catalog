import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/friendship/data/data.dart';
import 'package:flutter_ui/pages/friendship/models/user_model.dart';
import 'package:flutter_ui/pages/friendship/screens/chat_page.dart';

class UserPage extends StatelessWidget {
  User user;
  Size _size;

  UserPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: _setAppBar(
        title: user.name,
      ),
      body: _getProfilePage(context),
    );
  }

  /// Profile Page
  _getProfilePage(BuildContext context) => Column(
        children: [
          SizedBox(
            height: _size.height * 0.3,
            width: _size.width,
            child: Image.network(
              user.imageUrl == "default" ? defaultImage : user.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Card(
            margin: EdgeInsets.only(
                top: 32.0, right: 16.0, left: 16.0, bottom: 6.0),
            child: ListTile(
              title: _setText("Send Message"),
              trailing: Icon(
                Icons.messenger_outline,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MockChat(
                              user: user,
                            )));
              },
            ),
          ),
          _showUserInfo(
            title: user.email,
            icon: Icons.email,
            subtitle: "Email Address",
          ),
          _showUserInfo(
            title: user.phone,
            icon: Icons.phone,
            subtitle: "Mobile phone",
          ),
        ],
      );

  ButtonStyle _setButtonStyle(Size size) => ElevatedButton.styleFrom(
      primary: Colors.white, fixedSize: Size(size.width * 0.6, 48.0));

  TextStyle _getInputTextStyle() => TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      );

  InputDecoration _setInputDecoration({String hintText, icon}) =>
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

  AppBar _setAppBar({String title}) => AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: Colors.teal.shade100),
        ),
      );

  Text _setText(String text) => Text(
        text,
        style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
      );

  _showUserInfo({String title, icon, String subtitle}) => Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: ListTile(
          title: _setText(title),
          subtitle: Text(subtitle),
          trailing: Icon(
            icon,
            color: Colors.teal,
          ),
          onTap: () {},
        ),
      );
}
