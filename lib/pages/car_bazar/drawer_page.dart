import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/car_bazar/car_list.dart';

Drawer _carShopDrawer() => Drawer(
      child: Column(
        children: [
          _setCarInfo(),
          _setCategory(title: "My cars", icon: Icons.directions_car_outlined),
          _setCategory(title: "Go Shop", icon: Icons.shopping_cart_outlined),
          _setCategory(title: "Favourites", icon: Icons.favorite_border),
          Divider(),
          _setCategory(
              title: "Settings", icon: Icons.settings_suggest_outlined),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              alignment: Alignment.bottomCenter,
              child: _setText("By Bahromjon. 22-09-2021")
            ),
          ),
        ],
      ),
    );

Drawer get carShopDrawer => _carShopDrawer();

UserAccountsDrawerHeader _setCarInfo() => UserAccountsDrawerHeader(
      accountName: _setText("Bahromjon"),
      accountEmail: _setText("Tesla S Model"),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(teslaView))),
    );

ListTile _setCategory({String? title, IconData? icon}) => ListTile(
      title: _setText(title!),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      onTap: () {},
    );

Text _setText(String text) => Text(
      text,
    );
