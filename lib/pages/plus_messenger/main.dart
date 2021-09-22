import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/plus_messenger/drawer.dart';

class PlusMessengerMainPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey();
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      key: _keyScaffold,
      appBar: _setAppBar(),
      drawer: telegramDrawer,
      body: Container(),
    );
  }

  AppBar _setAppBar() => AppBar(
        backgroundColor: Colors.teal,
        title: Text("Plus Messenger"),
        actions: [
          _setIconButton(Icons.lock_open_outlined),
          _setIconButton(Icons.search),
          _setIconButton(Icons.folder_open_outlined),
        ],
      );

  IconButton _setIconButton(IconData icon) =>
      IconButton(onPressed: () {}, icon: Icon(icon));
}
