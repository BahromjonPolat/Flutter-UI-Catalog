import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/instagram/data/posts.dart';
import 'package:flutter_ui/pages/instagram/model/post.dart';

class InstagramHomePage extends StatefulWidget {

  @override
  _InstagramHomePageState createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.separated(itemBuilder: (context, index) {
      Post post = posts[index];
      return Container(
        width: size.width * 1.0,
        height: size.height * 0.3,
        color: Colors.red,
      );
    }, separatorBuilder: (context, index) {
      return Divider();
    }, itemCount: posts.length);
  }
}
