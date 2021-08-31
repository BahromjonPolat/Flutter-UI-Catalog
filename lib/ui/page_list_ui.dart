import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/model/page.dart';
import 'package:flutter_ui/data/page_list.dart';

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "My pages",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: showPageList(),
    );
  }

  Widget showPageList() {
    return ListView.builder(
        itemCount: pageList.length,
        itemBuilder: (context, index) {
          PageUI page = pageList[index];
          return Card(
            color: Colors.indigo,
            child: ListTile(
              leading: page.icon,
              title: Text(
                page.title,
              ),
              subtitle: Text(
                page.subtitle,
              ),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => page.page));
              },
            ),
          );
        });


  }
}
