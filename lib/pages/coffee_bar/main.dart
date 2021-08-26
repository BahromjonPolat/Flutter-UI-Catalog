import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/coffee_bar/coffee_info_page.dart';

class CoffeeBarMainPage extends StatefulWidget {
  @override
  _CoffeeBarMainPageState createState() => _CoffeeBarMainPageState();
}

class _CoffeeBarMainPageState extends State<CoffeeBarMainPage> {
  Size _size;


  @override
  Widget build(BuildContext context) {

    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: _bodyWithCustomScrollView(),
      drawer: Drawer(),
    );
  }

  /// Body
  _bodyWithCustomScrollView() => CustomScrollView(
        slivers: [
          _sliverAppBar(),
          // _getCategoryList(),
          _grid(),
        ],
      );

  _bbb() => SingleChildScrollView(
    child: Column(
      children: [
        _sliverAppBar(),
        _getCategoryList(),
        _getCoffeeInfo(),
      ],
    ),
  );

  /// Sliver App Bar
  SliverAppBar _sliverAppBar() => SliverAppBar(
        backgroundColor: Colors.deepOrange,
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size(_size.width * 1.0, _size.height * 0.3),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Find the best \ncoffee for you",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60.0,
                ),
                GestureDetector(
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (_){
                      return CoffeeInfoPage();
                    }));
                  },
                  child: Container(
                    width: _size.width * 1.0,
                    height: _size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  SliverToBoxAdapter _getCategoryList() => SliverToBoxAdapter(
        child: Container(
          width: _size.width * 1.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Text("Hello  ");
              }),
        ),
      );

  SliverGrid _grid() => SliverGrid.count(
        childAspectRatio: 0.65,
        crossAxisCount: 2,
        children: [
          _getCoffeeInfo(),
          _getCoffeeInfo(),
        ],
      );

  Container _getCoffeeInfo() => Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              width: _size.width * 0.36,
              height: _size.width * 0.36,
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.orange,
              ),
              child: Container(
                alignment: Alignment.center,
                height: 26,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.0),
                        bottomLeft: Radius.circular(16.0))),
                child: Text("4.5"),
              ),
            ),
          ],
        ),
      );

  FlexibleSpaceBar _showFlexibleSpaceBar() => FlexibleSpaceBar(
          title: Container(
        height: _size.height * 0.13,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Find your best \ncoffee for you"),
            Container(
              height: 32,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      size: 16.0,
                    ),
                    hintText: "Find your coffee",
                    border: OutlineInputBorder(gapPadding: 12)),
              ),
            ),
          ],
        ),
      ));
}
