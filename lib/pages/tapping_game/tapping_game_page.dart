import 'package:flutter/material.dart';
import 'package:flutter_ui/components/exporting_packages.dart';

class TappingGame extends StatefulWidget {
  @override
  _TappingGameState createState() => _TappingGameState();
}

class _TappingGameState extends State<TappingGame> {
  int _greenHeight = 20;
  int _redHeight = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() => Column(
        children: [
          Expanded(
            flex: _greenHeight,
            child: Material(
              color: Colors.green,
              child: InkWell(
                splashColor: Color(0x50123456),
                child: _showScore(_greenHeight),
                onTap: () {
                  setState(() {
                    _greenHeight += 1;
                    _redHeight -= 1;
                    if (_redHeight == 1) {
                      _restart();
                      _showWinner("Green");

                    }
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: _redHeight,
            child: Material(
              color: Colors.red,
              child: InkWell(
                child: _showScore(_redHeight),
                onTap: () {
                  setState(() {
                    _redHeight += 1;
                    _greenHeight -= 1;
                    if (_greenHeight == 1) {
                      _showWinner("Red");
                      _restart();
                    }
                  });
                },
              ),
            ),
          ),
        ],
      );

  Center _showScore(int score) => Center(
          child: Text(
        '$score',
        style: TextStyle(
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Garamond',
            color: Colors.yellow),
      ));

  void _showWinner(String winner) {
    _vibrate();
    Dialogs.materialDialog(
      context: context,
      title: "Congratulations",
      msg: "$winner won",
      lottieBuilder: LottieBuilder.asset('assets/json/congratulations.json'),
      barrierDismissible: false,
    );
  }

  void _restart() {
    _greenHeight = 20;
    _redHeight = 20;
  }

  void _vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 100);
    } else {
      Vibration.vibrate();
      await Future.delayed(Duration(milliseconds: 100));
      Vibration.vibrate();
    }
  }
}
