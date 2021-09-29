import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/messaging_app/data/chat_list.dart';
import 'package:flutter_ui/pages/messaging_app/models/chat_model.dart';

class MessagingAppHomePage extends StatefulWidget {
  @override
  _MessagingAppHomePageState createState() => _MessagingAppHomePageState();
}

class _MessagingAppHomePageState extends State<MessagingAppHomePage>
    with TickerProviderStateMixin {
  Color _blue = Color.fromARGB(255, 47, 128, 237);
  Color _grey = Colors.grey;
  Color _grey200 = Colors.grey.shade200;
  Color _white = Colors.white;
  Color _black = Colors.black;
  int _currentIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTabBar(),
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
            radius: 24.0, backgroundImage: NetworkImage(chat.imageUrl)),
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
        trailing: Text(
          chat.date,
          style: TextStyle(fontSize: 12.0),
        ),
        children: [
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(chat.message),
            ),
          )
        ],
      );

  Padding _getCategories() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Wrap(
          spacing: 24.0,
          children: List.generate(
            4,
            (index) => _setButton(_buttonTitles[index], index),
          ),
        ),
      );

  TabBar _getTabBar() => TabBar(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        controller: _tabController,
        isScrollable: true,
        unselectedLabelColor: _grey,
        indicator: BoxDecoration(
          color: _blue,
          borderRadius: BorderRadius.circular(6.0),
        ),
        tabs: [
          _setTab("All chats"),
          _setTab("Personal"),
          _setTab("Work"),
          _setTab("Groups"),
        ],
      );

  Tab _setTab(String title) => Tab(
        height: 26.0,
        text: title,
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
              fontSize: 12.0, color: (_currentIndex == index) ? _white : _grey),
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            primary: (_currentIndex == index) ? _blue : _white),
      );

  List<String> _buttonTitles = ["All chats", "Personal", "Work", "Groups"];
}
