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
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: _getBodyWithCustomScrollView(),
      drawer: Drawer(),
    );
  }

  _getBodyWithCustomScrollView() =>
      CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          _getSliverAppBar(),
          _getSliverList(),
        ],
      );

  _getSliverAppBar() =>
      SliverAppBar(
        floating: true,
        stretch: true,
        flexibleSpace: _getFlexibleSpaceBar(),
        expandedHeight: _size.height * 0.3,
      );

  _getFlexibleSpaceBar() =>
      FlexibleSpaceBar(
        background: Image.network(
          "https://images.unsplash.com/photo-1541359927273-d76820fc43f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
          fit: BoxFit.cover,
        ),
        stretchModes: [
          StretchMode.zoomBackground,
        ],
      );

  /// Sliver List - Sahifalarning ro`yxati uchun
  _getSliverList() =>
      SliverList(
          delegate:
          SliverChildListDelegate(List.generate(pageList.length, (index) {
            PageUI pageUI = pageList[index];
            return _setPageItemLayout(pageUI);
          })));

  /// Sahifaning ma'lumotlatini ko`rsatadigan Item Layout
  _setPageItemLayout(PageUI pageUI) =>
      Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
        child: ListTile(
          leading: pageUI.icon,
          title: Text(pageUI.title),
          subtitle: Text(pageUI.date),
          trailing:_getPopUpMenu(),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => pageUI.page));
          },
        ),
      );

  _getPopUpMenu() =>
      PopupMenuButton(itemBuilder: (context) {
        return List.generate(3, (index) => PopupMenuItem(child: Text("Menu")));
      });
}
