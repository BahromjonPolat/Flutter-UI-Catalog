import 'package:flutter/material.dart';

BottomNavigationBar _getBottomNavigationBar() => BottomNavigationBar(
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.grey,
    items: _bottomNavigationBarItems);

BottomNavigationBar get furnitureBottomNavigationBar => _getBottomNavigationBar();

List<BottomNavigationBarItem> _bottomNavigationBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.star),
    label: "Favourites",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.shopping_basket),
    label: "Shop",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: "Profile",
  ),
];
