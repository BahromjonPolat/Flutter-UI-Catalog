import 'package:flutter/material.dart';
import 'package:flutter_ui/components/exporting_packages.dart';
import 'package:flutter_ui/screens/info/info_page.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({Key key}) : super(key: key);

   BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _setHeader(),
          _setTitle(Icons.info_outline, "Biz haqimizda", InfoPage()),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _setHeader() => const UserAccountsDrawerHeader(
        accountName: Text("Bahromjon Po'lat"),
        accountEmail: Text("bahromjon.ergashboyev@gmail.com"),
        currentAccountPicture: CircleAvatar(),
      );

  ListTile _setTitle(IconData iconData, String label, Widget page) => ListTile(
    leading: Icon(iconData),
    title: Text(label),
    onTap: (){
      Navigator.push(_context, MaterialPageRoute(builder: (_)=> page));
    },
  );
}
