import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/pages/hotel/model/hotel_model.dart';
import 'package:flutter_ui/pages/hotel/components/room_list.dart';

class HotelRoomInfoPage extends StatefulWidget {
  Room room;

  HotelRoomInfoPage({this.room});

  @override
  _HotelRoomInfoPageState createState() => _HotelRoomInfoPageState();
}

class _HotelRoomInfoPageState extends State<HotelRoomInfoPage> {
  Room _room;
  Size _size;

  @override
  Widget build(BuildContext context) {
    _room = widget.room;
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _getBody(),
    );
  }

  /// Body
  _getBody() => Column(
        children: [
          _getTopPartOfBody(),
          _getBottomPartOfBody(),
        ],
      );

  _getTopPartOfBody() => Expanded(
          child: Container(
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24.0),
                bottomLeft: Radius.circular(24.0)),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(_room.imageUrl))),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 32.0,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    CupertinoIcons.bookmark,
                    color: Colors.white,
                    size: 32.0,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ));

  _getBottomPartOfBody() => Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: _size.height * 0.12,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _room.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Text(_room.hotelName),
                    _getRating(),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// FloatingActionButton
                  Transform.translate(
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.room),
                      backgroundColor: Colors.teal,
                    ),
                    offset: Offset(-6.0, -42),
                  ),
                  Text(
                    "365 reviews   ",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),

          /// Description
          _getDescription(),

          /// Price qismi
          _getPrice(),

          /// Book Now button
          _bookNow(),
        ],
      ));

  _getDescription() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          _room.description,
          maxLines: 6,
          overflow: TextOverflow.fade,
        ),
      );

  /// Rating Bar
  _getRating() => Row(
        children: [
          RatingBar.builder(

              updateOnDrag: false,
              itemSize: 18.0,
              allowHalfRating: true,
              initialRating: _room.rating,
              itemBuilder: (context, index) {
                return Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (rating) {}),
          Text(
            "${_room.rating}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      );

  _getPrice() => Row(
        children: [
          Container(
              width: _size.width * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Price per night",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            width: _size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  topLeft: Radius.circular(32.0)),
            ),
            child: Text(
              "\$${_room.price} +${_room.additional}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
            ),
          ),
        ],
      );

  _bookNow() => Container(
        margin: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        width: _size.width,
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Book Now"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              primary: Colors.teal,
              padding: EdgeInsets.symmetric(vertical: 20.0)),
        ),
      );


}
