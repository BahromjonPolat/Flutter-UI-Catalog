import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/book_store/about_book_page.dart';
import 'package:flutter_ui/pages/book_store/data/book_list.dart';
import 'package:flutter_ui/pages/book_store/model/book.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookStoreMainPage extends StatefulWidget {
  @override
  _BookStoreMainPageState createState() => _BookStoreMainPageState();
}

class _BookStoreMainPageState extends State<BookStoreMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                backgroundImage: AssetImage("assets/images/logo.jpg"),
              ),
              onTap: () {
                Fluttertoast.showToast(
                  msg: "profile Image was clicked!",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
            ),
          ),
        ],
      ),

      // Body
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _setText("What book do you want to read?", 36.0),
                  _showSearchBox(),
                  _setText("BEST SELLERS", 32.0),
                  _showBestSellers(),
                  _showCategoryTitles(),
                ],
              ),
            ),
          ),

          // Kategoriyadagi kitoblarni ko'rsatadi.
          Expanded(
            flex: 3,
            child: _showCategoryBooks(),
          ),
          _setDivider(),
          _setBottomNavbar(),
        ],
      ),
    );
  }

  Widget _setDivider() => Divider(thickness: 2.0);

  // Matnlarni Yozish uchun funksiya
  Widget _setText(String text, double size) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size, fontFamily: "garamond", fontWeight: FontWeight.bold),
    );
  }

  // Matnlarni Belgilangan harf uzunligigacha yozadigan funksiya.
  Widget _setTextLight(String text, double size) {
    return Text(
      (text.length > 15) ? text.substring(0, 15) + "..." : text,
      style: TextStyle(
        fontSize: size,
        fontFamily: "garamond",
      ),
    );
  }

  Widget _showSearchBox() {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search entire store here",
          prefixIcon: Icon(CupertinoIcons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(width: 2.0),
          )),
    );
  }

  Widget _showBestSellers() {
    return Container(
      child: Image.network(
          "https://hilolnashr.uz/image/cache/catalog/banner/UP-theme/hilol-jurnali-obuna-hnuz-uchun-1140x380.jpg"),
    );
  }

  Widget _showCategoryTitles() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setText("NEW ARRIVALS", 18.0),
          _setTextLight("Best Buy", 18.0),
          _setTextLight("SALE", 18.0),
        ],
      ),
    );
  }

  Widget _showCategoryBooks() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getBooks().length,
        itemBuilder: (context, index) {
          Book book = getBooks()[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return AboutBookPage(index: index);
              }));
            },
            child: Container(
              height: 200.0,
              width: 120.0,
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 6.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: FadeInImage(
                        placeholder: AssetImage("assets/images/book_cover.jpg"),
                        image: (book.imageUrl != "default")
                            ? NetworkImage(book.imageUrl)
                            : AssetImage("assets/images/book_cover.jpg"),
                      ),
                    ),
                  ),
                  _setText(book.title, 14.0),
                  _setTextLight(book.author, 12.0),
                ],
              ),
            ),
          );
        });
  }

  Widget _setBottomNavbar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setIcon(CupertinoIcons.home, Colors.deepOrange),
          _setIcon(CupertinoIcons.book, Colors.grey),
          _setIcon(CupertinoIcons.bookmark, Colors.grey),
          _setIcon(CupertinoIcons.person, Colors.grey),
        ],
      ),
    );
  }

  Widget _setIcon(icon, color) {
    return Icon(
      icon,
      color: color,
    );
  }
}
