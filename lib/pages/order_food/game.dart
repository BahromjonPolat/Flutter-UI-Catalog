import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _randomNum = 1 + Random().nextInt(9);
  late Size _size;
  int _chance = 3;
  bool _isRestart = false;
  List<bool> _disabled = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  int _initialTime = DateTime.now().millisecondsSinceEpoch;
  late  int _endTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      body: _getScreen(),
    );
  }

  _getAppBar() => AppBar(
    title: Text(
      "Use Your Intuition",
      style: TextStyle(
        color: Colors.purple[900],
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.purple[900],
    ),
    backgroundColor: Colors.purple[100],
  );
  _getScreen() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _getGridView(),
      _getRestart(),
    ],
  );
  _getRestart() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: _isRestart
            ? () {
          _onRestart();
          _isRestart = false;
        }
            : null,
        icon: Icon(
          Icons.restart_alt_rounded,
          color: Colors.red[900],
        ),
        label: Text(
          "Restart",
          style: TextStyle(
            color: Colors.red[900],
          ),
        ),
      ),
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: () {},
        icon: Icon(
          Icons.logout,
          color: Colors.red[900],
        ),
        label: Text(
          "Quit",
          style: TextStyle(
            color: Colors.red[900],
          ),
        ),
      ),
    ],
  );
  _getGridView() => Container(
    padding: EdgeInsets.all(12.0),
    height: _size.height * 0.6,
    // color: Colors.grey,
    child: GridView.count(
      // childAspectRatio: 0.1,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      crossAxisCount: 3,
      children: List.generate(9, (index) => _getElevatedButton(index + 1)),
    ),
  );

  ElevatedButton _getElevatedButton(int index) => ElevatedButton(
    child: Text(
      "$index",
      style: TextStyle(
        color: Colors.pink[900],
      ),
    ),
    style: _getDesign(),
    onPressed: _disabled[index - 1]
        ? () {
      int i = index - 1;
      if (_randomNum == index) {
        _endTime = DateTime.now().millisecondsSinceEpoch;

        Fluttertoast.showToast(msg: "Genius ${(_endTime - _initialTime) / 1000}");
        _isRestart = true;

        _onRestart();
      } else if (_randomNum > index) {
        Fluttertoast.showToast(msg: "Maybe bigger?");
      } else if (_randomNum < index) {
        Fluttertoast.showToast(msg: "A little smaller");
      }
      _disabled[i] = false;
      _chance--;
      if (_chance <= 0) {
        Fluttertoast.showToast(msg: "No worries, next time");
        _isRestart = true;
        _endTime = DateTime.now().millisecondsSinceEpoch;
        // _onRestart();
      }

      setState(() {});
    }
        : null,
  );

  void _onRestart() {
    _chance = 3;
    for (var i = 0; i < _disabled.length; i++) {
      _disabled[i] = true;
    }
    setState(() {});
  }

  ButtonStyle _getDesign() => ElevatedButton.styleFrom(
    primary: Colors.pink[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
    ),
  );

  List<ElevatedButton> _numberButtons = List.generate(
    9,
        (index) => ElevatedButton(
      child: Text("${index + 1}"),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      onPressed: () {
        //   _onPressed();
      },
    ),
  );

//   void _onPressed() {
//     if (_randomNum == 8)
//   }
}