import 'package:flutter/material.dart';
import 'package:flutter_ui/components/exporting_packages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {



  Future<bool> _isLight() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isLight') ?? false;
  }
}
