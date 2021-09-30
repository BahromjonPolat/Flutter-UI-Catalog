import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/fashion/fashion_list.dart';
import 'package:flutter_ui/pages/fashion/fashion_model.dart';
import 'package:flutter_ui/pages/fashion/image_list.dart';
import 'package:flutter_ui/pages/fashion/info_page.dart';

class FashionPageMain extends StatefulWidget {
  @override
  _FashionPageMainState createState() => _FashionPageMainState();
}

class _FashionPageMainState extends State<FashionPageMain> {
  Size _size;
  Color _black = Colors.black;
  Color _white = Colors.white;
  Color _brown = Colors.brown;
  Color _grey = Colors.grey;
  Color _red = Colors.red;
  Color _lightOrange = Color(0xfffce3c8);
  Color _transparent = Colors.transparent;
  Color _greyWithOpacity  = Color(0x7DB3B1B1);

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _getCustomScrollViewBody(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  /// Body
  CustomScrollView _getCustomScrollViewBody() => CustomScrollView(slivers: [
        _getSliverAppBar(),
        _getHeader(),
        _getSliverList(),
      ]);

  /// SliverAppBar
  SliverAppBar _getSliverAppBar() => SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _transparent,
        elevation: 0.0,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: _transparent,
        ),
        title: _setSimpleTextBold("Discovery", _black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.camera,
              color: _grey,
            ),
          ),
        ],
      );

  /// SliverList. Postlarni chiqarish uchun
  SliverList _getSliverList() => SliverList(
        delegate: SliverChildListDelegate(
          List.generate(
            fashionList.length,
            (index) => _setFashionPost(
              fashionList[index],
            ),
          ),
        ),
      );

  SliverToBoxAdapter _getHeader() => SliverToBoxAdapter(
        child: SizedBox(
          height: _size.height * 0.17,
          child: ListView.builder(
              itemCount: 15,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _setHeaderImages(index);
              }),
        ),
      );

  Padding _setHeaderImages(int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(children: [
              CircleAvatar(
                radius: 32.0,
                backgroundImage: NetworkImage("$randomImage$index"),
              ),
              Positioned(
                  bottom: 0.0, right: 0.0, child: CircleAvatar(radius: 10.0)),
            ]),
            ElevatedButton(
              onPressed: () {},
              child: Text("Follow", style: TextStyle(fontSize: 12.0)),
              style: ElevatedButton.styleFrom(
                  primary: _brown,
                  elevation: 0.0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            ),
          ],
        ),
      );

  /// Fashion haqidagi ma'lumotlarni ko'rsatish uchun asosiy maket
  Padding _setFashionPost(Fashion fashion) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Material(
          borderRadius: BorderRadius.circular(16.0),
          color: _white,
          elevation: 5,
          child: SizedBox(
            height: _size.height * 0.59,
            child: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              highlightColor: _greyWithOpacity,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FashionInfoPage(fashion)));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _setAuthorInfo(fashion),
                    _setDescription(fashion.description),
                    _setHeight(16.0),
                    _setImageLayout(fashion.images),
                    _setHeight(16.0),
                    _setTags(fashion.tags),
                    _getDivider(),
                    _getIconPanel(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Divider _getDivider() {
    return Divider(
      height: 32.0,
      thickness: 1,
    );
  }

  /// Maketdagi Foydalanuvchining ismi va rasmini ko'rsatadigan qismi
  ListTile _setAuthorInfo(Fashion fashion) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 21.0,
          backgroundImage: NetworkImage(fashion.profileImage),
        ),
        title: _setSimpleTextBold(fashion.author, _black),
        subtitle: _setSimpleText("34 mins ago"),
        trailing: IconButton(
            onPressed: () {}, icon: _setIcon(Icons.more_vert, _grey)),
      );

  Text _setDescription(String description) => Text(
        description,
        maxLines: 3,
        style: TextStyle(color: _grey, fontSize: 13.0),
      );

  /// Post maketidagi Rasmlarni ko'rsatish uchun funksiya
  _setImageLayout(List<String> images) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setImage(images[0], _size.width * 0.55),
          SizedBox(
            height: _size.width * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _setImage(images[1], _size.width * 0.27),
                _setImage(images[2], _size.width * 0.27),
              ],
            ),
          ),
        ],
      );

  /// Rasmni ko`rsatish uchun funksiya
  Container _setImage(String imageUrl, double size) => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl)),
        ),
      );

  /// Post maketdagi teglarni ko`rsatish uchun funksiya
  Wrap _setTags(List<String> tags) => Wrap(
        spacing: 12.0,
        children: List.generate(
          tags.length,
          (index) => Chip(
            backgroundColor: _lightOrange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0)),
            label: _setSimpleTextBold(tags[index], _brown),
          ),
        ),
      );

  Row _getIconPanel() => Row(
        children: [
          _setIconWithText(
              CupertinoIcons.arrowshape_turn_up_right_fill, "1.7k"),
          SizedBox(
            width: 32.0,
          ),
          _setIconWithText(CupertinoIcons.chat_bubble_text_fill, "325"),
          Spacer(),
          _setIconWithText(CupertinoIcons.heart_fill, "2.3k"),
        ],
      );

  Row _setIconWithText(IconData iconData, String text) => Row(
        children: [
          _setIcon(iconData, (text == "2.3k") ? _red : _grey),
          SizedBox(width: 12.0),
          _setDescription(text),
        ],
      );

  /// Icon berish uchun funksiya
  Icon _setIcon(IconData iconData, Color color) => Icon(iconData, color: color);

  Text _setSimpleTextBold(String title, Color color) => Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      );

  Text _setSimpleText(String title) => Text(title);

  SizedBox _setHeight(double height) => SizedBox(height: height);

  BottomNavigationBar _getBottomNavigationBar() => BottomNavigationBar(
        items: _bottomNavigationBarItems,
        selectedItemColor: _black,
        unselectedItemColor: _grey,
        currentIndex: 2,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
      );
  List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.play_rectangle),
      label: "PLay",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.compass),
      label: "Discovery",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: "Profile",
    ),
  ];
}
