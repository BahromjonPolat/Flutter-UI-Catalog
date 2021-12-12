import 'package:flutter/material.dart';
import 'package:flutter_ui/components/exporting_packages.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _setHeader(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _setHeader() => const UserAccountsDrawerHeader(
        accountName: Text("Bahromjon Po'lat"),
        accountEmail: Text("bahromjon.ergashboyev@gmail.com"),
        currentAccountPicture: CircleAvatar(),
      );
}
