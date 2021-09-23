import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/plus_messenger/chat_list.dart';
import 'package:flutter_ui/pages/plus_messenger/chat_model.dart';
import 'package:flutter_ui/pages/plus_messenger/chat_page.dart';
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
      body: _getBody(),
    );
  }

  _getBody() => ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        Chat chat = chatList[index];
        return ListTile(
          title: Text(chat.name),
          subtitle: Text(chat.lastMessage),
          leading: CircleAvatar(
            backgroundImage: NetworkImage("${chat.imageUrl}$index"),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => TelegramChatPage(chat)));
          },
        );
      });

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
