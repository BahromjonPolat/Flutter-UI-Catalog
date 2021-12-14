import 'package:flutter/material.dart';
import 'package:flutter_ui/data/page_list.dart';
import 'components/my_drawer.dart';
import 'package:flutter_ui/components/exporting_packages.dart';

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _getBodyWithCustomScrollView(),
      drawer: MyDrawer(),
    );
  }

  /// Sahifaning 'BODY' qismi
  _getBodyWithCustomScrollView() => CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          _getSliverAppBar(),
          _getSliverList(),
        ],
      );

  /// Sliver App Bar
  _getSliverAppBar() => SliverAppBar(
        floating: true,
        stretch: true,
        flexibleSpace: _getFlexibleSpaceBar(),
        expandedHeight: _size.height * 0.3,
        backgroundColor: Colors.black54,
      );

  _getFlexibleSpaceBar() => FlexibleSpaceBar(
        background: Image.network(
          "https://images.unsplash.com/photo-1541359927273-d76820fc43f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
          fit: BoxFit.cover,
        ),
        // stretchModes: [
        //   StretchMode.zoomBackground,
        // ],
      );

  /// Sliver List - Sahifalarning ro`yxati uchun
  _getSliverList() => SliverList(
          delegate:
              SliverChildListDelegate(List.generate(pageList.length, (index) {
        PageUI pageUI = pageList[index];
        return _setPageItemLayout(pageUI);
      })));

  /// Sahifaning ma'lumotlatini ko`rsatadigan Item Layout
  _setPageItemLayout(PageUI pageUI) => Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
        child: ListTile(
          leading: pageUI.icon,
          title: Text(pageUI.title),
          subtitle: Text(pageUI.date),
          trailing: _getPopUpMenu(pageUI),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => pageUI.page));
          },
        ),
      );

  _getPopUpMenu(PageUI pageUI) => PopupMenuButton(itemBuilder: (context) {
        return <PopupMenuItem>[
          _setPopUpMenuItem("Description", () {}),
          _setPopUpMenuItem("Go to code", () {
            _goToSource(pageUI.sourceCode);
          }),
        ];
      });

  _goToSource(String url) async {
    if (await canLaunch(url))
      await launch(url);
    else
      // can't launch url, there is some error
      throw "Could not launch $url";
  }

  PopupMenuItem _setPopUpMenuItem(String label, VoidCallback onPressed) =>
      PopupMenuItem(onTap: onPressed, child: Text(label));
}
