import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/praying_time/widgets/set_text.dart';

class PrayerTimeTasbihPage extends StatefulWidget {

  @override
  _PrayerTimeTasbihPageState createState() => _PrayerTimeTasbihPageState();
}

class _PrayerTimeTasbihPageState extends State<PrayerTimeTasbihPage> {
  int _zikr = 0;
  bool _isMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FloatingActionButton(onPressed: _onButtonPressed,
      backgroundColor: Colors.teal,
        isExtended: true,
        child: setBoldText("$_zikr", Colors.white, 18.0),
      )
    ],
  );

  void _onButtonPressed() {
    setState(() {
      _zikr++;
      if (_isMore) {
        if (_zikr > 99) {
          _zikr = 1;
        }
      } else {
        if (_zikr > 33) {
          _zikr = 1;
        }
      }

    });
  }
}
