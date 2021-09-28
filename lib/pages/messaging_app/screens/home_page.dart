import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/messaging_app/data/chat_list.dart';
import 'package:flutter_ui/pages/messaging_app/models/chat_model.dart';

class MessagingAppHomePage extends StatefulWidget {
  @override
  _MessagingAppHomePageState createState() => _MessagingAppHomePageState();
}

class _MessagingAppHomePageState extends State<MessagingAppHomePage> {
  Color _blue = Color.fromARGB(255, 47, 128, 237);
  Color _grey = Colors.grey;
  Color _white = Colors.white;
  Color _black = Colors.black;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _getCategories(),
          _showChats(),
        ],
      ),
    );
  }

  Expanded _showChats() => Expanded(
      child: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            return _setChat(chatList[index]);
          }));

  ExpansionTile _setChat(ChatModel chat) => ExpansionTile(
        backgroundColor: Color.fromARGB(77, 47, 128, 237),
        textColor: _black,
        collapsedTextColor: _black,
        leading: CircleAvatar(
            radius: 24.0,
            backgroundImage: NetworkImage(chat.imageUrl)),
        title: Text(chat.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            )),
        subtitle: Text(
          chat.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12.0),
        ),
        trailing: Text(chat.date, style: TextStyle(fontSize: 12.0),),
    children: [
      SizedBox(child:
        Text(chat.message),)
    ],
      );

  Wrap _getCategories() => Wrap(
        spacing: 24.0,
        children: List.generate(
          4,
          (index) => _setButton(_buttonTitles[index], index),
        ),
      );

  ElevatedButton _setButton(String title, int index) => ElevatedButton(
        onPressed: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: 12.0,
              color: (_currentIndex == index) ? _white : _grey),
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            primary: (_currentIndex == index) ? _blue : _white),
      );

  List<String> _buttonTitles = ["All chats", "Personal", "Work", "Groups"];
}
