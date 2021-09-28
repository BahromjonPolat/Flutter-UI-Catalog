import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/instagram/data/posts.dart';
import 'package:flutter_ui/pages/instagram/model/post.dart';

class InstagramHomePage extends StatefulWidget {
  @override
  _InstagramHomePageState createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {

  var _homePageBucket = PageStorageBucket();
  var _homePageKey = PageStorageKey("home_page_key");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageStorage(
      key: _homePageKey,
      bucket: _homePageBucket,
      child: ListView.separated(
        itemCount: 24,
        itemBuilder: (context, index) {
          // Post post = posts[index];
          return Container(
            alignment: Alignment.center,
            width: size.width * 1.0,
            height: size.height * 0.3,
            color: Colors.red,
            child: Text("$index" ,style: TextStyle(fontSize: 24.0),),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },

      ),
    );
  }
}
