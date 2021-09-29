import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/plus_messenger/chat_list.dart';
import 'package:flutter_ui/pages/plus_messenger/chat_model.dart';
import 'package:flutter_ui/pages/plus_messenger/chat_page.dart';
import 'package:flutter_ui/pages/plus_messenger/drawer.dart';

class PlusMessengerMainPage extends StatefulWidget {
  @override
  State<PlusMessengerMainPage> createState() => _PlusMessengerMainPageState();
}

class _PlusMessengerMainPageState extends State<PlusMessengerMainPage> with TickerProviderStateMixin{
  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey();
  Size _size;
  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      key: _keyScaffold,
      appBar: _setAppBar(),
      drawer: telegramDrawer,
      body: _getMainBody(),
    );
  }

  Column _getMainBody() => Column(
        children: [
          _getTabBar(),
        ],
      );

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
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => TelegramChatPage(chat)));
          },
        );
      });

  AppBar _setAppBar() => AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: Text("Plus Messenger"),
        actions: [
          _setIconButton(Icons.lock_open_outlined),
          _setIconButton(Icons.search),
          _setIconButton(Icons.folder_open_outlined),
        ],
      );

  IconButton _setIconButton(IconData icon) =>
      IconButton(onPressed: () {}, icon: Icon(icon));

  Container _getTabBar() => Container(
    color: Colors.teal,
    child: TabBar(
      controller: _tabController,
        labelColor: Colors.white,
        indicatorColor: Colors.white,
        indicatorWeight: 6.0,
        tabs: [
          _setTab(CupertinoIcons.square_grid_2x2),
          _setTab(CupertinoIcons.person),
          _setTab(CupertinoIcons.person_2),
          _setTab(CupertinoIcons.person_3),
          _setTab(CupertinoIcons.speaker_2),
          _setTab(CupertinoIcons.circle_bottomthird_split),
          _setTab(CupertinoIcons.star),
          _setTab(CupertinoIcons.person_add),
        ]),
  );

  Tab _setTab(IconData iconData) => Tab(
        icon: Icon(iconData),
      );

  void _setState() {
    setState(() {

    });
  }
}
