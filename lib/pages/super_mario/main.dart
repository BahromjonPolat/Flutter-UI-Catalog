import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/super_mario/play_game_page.dart';

class SuperMarioMainPage extends StatefulWidget {
  @override
  _SuperMarioMainPageState createState() => _SuperMarioMainPageState();
}

class _SuperMarioMainPageState extends State<SuperMarioMainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("Play"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => SuperMarioPlayGamePage()));
        },
      ),
    );
  }
}
