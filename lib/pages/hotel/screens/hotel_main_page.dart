import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/pages/hotel/model/hotel_model.dart';
import 'package:flutter_ui/pages/hotel/screens/room_info.dart';
import 'package:flutter_ui/pages/hotel/components/room_list.dart';

class HotelMainPage extends StatefulWidget {
  @override
  _HotelMainPageState createState() => _HotelMainPageState();
}

class _HotelMainPageState extends State<HotelMainPage> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bodyWithCustomScrollView(),
    );
  }

  CustomScrollView _bodyWithCustomScrollView() => CustomScrollView(
        slivers: [
          _getSliverAppBar(),
          _getSliverList(),
        ],
      );

  SliverAppBar _getSliverAppBar() => SliverAppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
        toolbarHeight: _size.height * 0.12,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "Find your hotel \nin ",
            ),
            TextSpan(text: "Paris", style: TextStyle(color: Colors.teal))
          ]),
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              icon: Icon(
                Icons.person_outline_outlined,
                size: 32,
              ),
              onPressed: () {}),
        ],
      );

  SliverList _getSliverList() => SliverList(
          delegate: SliverChildListDelegate([
        _searchItems(),
        _showCategories(),
        _showRoomList(width: _size.width, height: _size.height * 0.37, type: 0),
        _showRoomList(width: _size.width, height: _size.height * 0.25, type: 1),
      ]));

  /// Search Box
  Padding _searchItems() => Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: TextField(
          autofocus: false,
          textInputAction: TextInputAction.search,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            focusColor: Colors.black,

            hintText: "Search",
            prefixIcon: Icon(Icons.search, color: Colors.black),
            fillColor: Color(0xffe3e3e3),
            filled: true,
            border: _setOutlineInputBorder(),
            focusedBorder: _setOutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          ),
        ),
      );

  OutlineInputBorder _setOutlineInputBorder() {
    return const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                bottomLeft: Radius.circular(32.0)),
            borderSide: BorderSide.none,
          );
  }

  /// Category List
  List<String> categories = [
    "All",
    "Popular",
    "Top Rated",
    "Featured",
    "Luxury"
  ];

  int _currentIndex = 0;

  /// Category
  _showCategories() => Container(
        height: 36.0,
        margin: EdgeInsets.symmetric(vertical: 32.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              String item = categories[index];
              return Container(
                margin: EdgeInsets.only(right: 16.0, left: 8.0),
                child: GestureDetector(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: (_currentIndex == index)
                          ? Colors.teal
                          : Colors.black87,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              );
            }),
      );

  _showRoomList({double height, double width, int type}) => Container(
        height: height,
        width: width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: roomList.length,
            itemBuilder: (context, index) {
              Room room = roomList[index];
              return _showRoomInfo(
                  room,
                  (type == 0) ? _size.width * 0.57 : _size.width * 0.37,
                  (type == 0) ? 0 : 1);
            }),
      );

  /// Xonalarning ma'lumotini ko`rsatish uchun layout
  /// Asosiy Vidjet GestureDetector. Agar bosilsa HotelRoomInfoPage sahifasiga
  /// o`tadi.
  _showRoomInfo(Room room, double width, int type) => GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(

            elevation: 6.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(room.imageUrl))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// Xonaning narxini ko`rsatish uchun container
                  (type == 0) ? _showRoomPrice(room) : _showRoomRating(room),

                  /// Xonaning ma'lumotlarini ko`rsatadigan Container
                  _setAllRoomData(room, type),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return HotelRoomInfoPage(
              room: room,
            );
          }));
        },
      );

  ///
  _setAllRoomData(Room room, int type) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: _size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0), color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(room.hotelName)
                    ],
                  ),
                ),
                (type == 0)
                    ? IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                          color: Colors.teal,
                          size: 32.0,
                        ),
                        onPressed: () {})
                    : Container(),
              ],
            ),

            /// Bu yerga
            (type == 0) ? _showRatingBar(room) : SizedBox(),
          ],
        ),
      );

  _showRatingBar(Room room) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBar.builder(
              itemSize: 16.0,
              initialRating: room.rating,
              allowHalfRating: true,
              ignoreGestures: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (rating) {}),
          Text(
            "365 reviews",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          )
        ],
      );

  /// Room Price
  _showRoomPrice(Room room) => Container(
        alignment: Alignment.center,
        height: 64.0,
        width: 96.0,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0)),
        ),
        child: Text(
          "\$${room.price}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );

  _showRoomRating(Room room) => Container(
        alignment: Alignment.center,
        height: 32.0,
        width: 48.0,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0)),
        ),
        child: Text(
          "#${room.rating}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
}
