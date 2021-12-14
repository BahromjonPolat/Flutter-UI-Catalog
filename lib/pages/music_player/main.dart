import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioPlayerMainPage extends StatefulWidget {
  @override
  _AudioPlayerMainPageState createState() => _AudioPlayerMainPageState();
}

class _AudioPlayerMainPageState extends State<AudioPlayerMainPage> {
  late double _height;
  late double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold();
  }

  CustomScrollView _buildScrollBody() => CustomScrollView(
        slivers: [
          _getSliverAppBar(),
        ],
      );

  SliverAppBar _getSliverAppBar() => SliverAppBar(
        title: Text("MY MUSIC LIST"),
        expandedHeight: _height * 0.14,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            "https://images.unsplash.com/photo-1524275804141-5e9f2bc5a71d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHNlYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
            fit: BoxFit.cover,
          ),
        ),
      );
}
