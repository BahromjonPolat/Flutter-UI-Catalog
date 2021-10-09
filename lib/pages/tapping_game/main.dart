import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TappingGame extends StatefulWidget {
  @override
  _TappingGameState createState() => _TappingGameState();
}

class _TappingGameState extends State<TappingGame> {
  double _height;
  double _greenHeight;
  double _redHeight;
  bool _isAssigned = false;


  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    if (!_isAssigned) {
      _redHeight = MediaQuery.of(context).size.height / 2;
      _greenHeight = MediaQuery.of(context).size.height / 2;
      _isAssigned = true;
      String _winner = '';
    }
    return Scaffold(
      body: _getBody(),
    );
  }

  SingleChildScrollView _getBody() => SingleChildScrollView(
    child: Column(
          children: [
            SizedBox(
              height: _greenHeight,
              child: Material(
                color: Colors.green,
                child: InkWell(
                  splashColor: Color(0x50123456),
                  onTap: () {
                    setState(() {
                      _greenHeight += _height * 0.01;
                      _redHeight -= _height * 0.01;
                      if (_greenHeight >= _height - 10) {
                        _showWinner("Green");
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: _redHeight,
              child: Material(
                color: Colors.red,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _redHeight += _height * 0.01;
                      _greenHeight -= _height * 0.01;
                      if (_redHeight >= _height - 10) {
                        _showWinner("Red");
                        Fluttertoast.showToast(msg: "Red won!");
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
  );

  _showWinner(String winner) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Tapping Game"),
              content: SizedBox(
                  height: 120.0,
                  child: Column(
                    children: [
                      Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: Colors.green,
                      )
                    ],
                  )),
            ));
  }
}
