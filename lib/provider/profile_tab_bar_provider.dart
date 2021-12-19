import 'package:flutter/material.dart';

class ProfileTabProvider extends ChangeNotifier {
  int _index = 0;

  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
}