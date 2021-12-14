import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/pages/book_store/data/book_list.dart';
import 'package:flutter_ui/pages/book_store/model/book.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class AboutBookPage extends StatefulWidget {
  Book book;

  AboutBookPage({required this.book});

  @override
  _AboutBookPageState createState() => _AboutBookPageState();
}

class _AboutBookPageState extends State<AboutBookPage> {
  late Book _book;
  late Size _size;

  @override
  Widget build(BuildContext context) {
    _book = widget.book;
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 231, 208),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          _getAppBar(),
          _getSliverList(),
        ],
      ),
    );
  }

  /// SliverAppBar
  SliverAppBar _getAppBar() => SliverAppBar(
        expandedHeight: _size.height * 0.5,
        backgroundColor: Color.fromARGB(255, 241, 231, 208),
        flexibleSpace: _getFlexibleSpaceBar(),
      );

  /// FlexibleSpaceBar
  FlexibleSpaceBar _getFlexibleSpaceBar() => FlexibleSpaceBar(
          background: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/book_cover.jpg"))),
        child: GlassContainer(
          width: _size.width * 1.0,
          height: _size.height * 0.13,
          opacity: 0.5,
          blur: 0.2,
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                _book.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  fontFamily: "garamond",
                ),
              ),
              Text("By ${_book.author}"),
              _getRatingBar(),
            ],
          ),
        ),
      ));

  SliverList _getSliverList() => SliverList(
          delegate: SliverChildListDelegate([
        _setDesc(),
        _addToCartButton(),
        _buyNowButton(),
      ]));

  Container _setDesc() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.fade,
          style: TextStyle(
            height: 1.6,
              fontFamily: "garamond",
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
        ),
      );

  _addToCartButton() => Container(
        padding: EdgeInsets.symmetric(horizontal: 64.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(CupertinoIcons.cart_badge_plus),
          label: Text("Add To Cart"),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),
              primary: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 12.0)),
        ),
      );

  _buyNowButton() => Container(
        margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 64.0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Buy Now",
            style: TextStyle(color: Colors.red),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              padding: EdgeInsets.symmetric(vertical: 16.0),
              primary: Colors.white70,
              side: BorderSide(
                width: 2.0,
                color: Colors.red,
              )),
        ),
      );

  _getRatingBar() => Container(
    height: 32.0,
    width: _size.width,
    alignment: Alignment.center,
    child: RatingBar.builder(
        itemCount: 5,
        direction: Axis.horizontal,
        minRating: 1,
        allowHalfRating: true,
        itemSize: 24.0,

        itemBuilder: (context, index){

      return Icon(Icons.star, color: Colors.amber);
    }, onRatingUpdate: (rating){
      print("Current Ratingis: $rating");
    }),
  );
}
