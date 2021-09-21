import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/friendship/data/data.dart';
import 'package:flutter_ui/pages/friendship/models/user_model.dart';
import 'package:flutter_ui/pages/friendship/screens/user_profile.dart';

/// MAIN PAGE
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  User _currentUser = currentUser;
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _setAppBar(title: _titles[_currentIndex]),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _bodyPages()[_currentIndex],
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: _bottomNavBarItems,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      );

  List<String> _titles = ["Home", "Explore", "Likes", "Profile"];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "Explore",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: "Likes",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  _mainPage() => SingleChildScrollView(
        child: Column(
          children: [],
        ),
      );

  _showLikePage() => SingleChildScrollView(
        child: Column(
          children: [],
        ),
      );

  /// Profile Page
  _getProfilePage() => Column(
        children: [
          SizedBox(
            height: _size.height * 0.3,
            width: _size.width,
            child: Image.network(
              _currentUser.imageUrl == "default"
                  ? defaultImage
                  : _currentUser.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          _showUserInfo(
            title: _currentUser.email,
            icon: Icons.email,
            subtitle: "Email Address",
          ),
          _showUserInfo(
            title: _currentUser.phone,
            icon: Icons.phone,
            subtitle: "Mobile phone",
          ),
          // _showUserInfo(
          //   title: _currentUser.email,
          //   icon: Icons.email,
          //   subtitle: "Email Address",
          // ),
          // _showUserInfo(
          //   title: _currentUser.email,
          //   icon: Icons.email,
          //   subtitle: "Email Address",
          // ),
        ],
      );

  _getExplorePage() => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TextField(
              textInputAction: TextInputAction.search,
              style: _getInputTextStyle(),
              decoration: _setInputDecoration(
                hintText: "Search",
                icon: Icons.search,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                  List.generate(userList().length, (index) {
            return _showUser(userList()[index]);
          }))),
        ],
      );

  _showUser(User user) => Card(
        child: ListTile(
          title: _setText(user.name),
          subtitle: Text(user.email),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.teal,
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              user.imageUrl == "default" ? defaultImage : user.imageUrl,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => UserPage(
                          user: user,
                        )));
          },
        ),
      );

  List<User> userList() {
    List<User> users = [];
    for (User user in userListInfo) {
      if (user != _currentUser) {
        users.add(user);
      }
    }
    return users;
  }

  List<dynamic> _bodyPages() {
    List<dynamic> bodies = [];
    bodies.add(_mainPage());
    bodies.add(_getExplorePage());
    bodies.add(_showLikePage());
    bodies.add(_getProfilePage());

    return bodies;
  }
}

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

ButtonStyle _setButtonStyle(Size size) => ElevatedButton.styleFrom(
    primary: Colors.white, fixedSize: Size(size.width * 0.6, 48.0));

TextStyle _getInputTextStyle() => TextStyle(
      color: Colors.teal,
      fontWeight: FontWeight.bold,
    );

InputDecoration _setInputDecoration({String hintText, icon}) => InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    prefixIcon: Icon(
      icon,
      color: Colors.teal,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
    hintStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
    border: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
    ),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)));

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
