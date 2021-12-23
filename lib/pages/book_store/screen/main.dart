import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/book_store/screen/about_book_page.dart';
import 'package:flutter_ui/pages/book_store/data/book_list.dart';
import 'package:flutter_ui/pages/book_store/model/book.dart';
import 'package:flutter_ui/pages/book_store/ui/app_bar.dart';
import 'package:flutter_ui/pages/book_store/ui/bottom_nav_bar.dart';

class BookStoreMainPage extends StatefulWidget {
  @override
  _BookStoreMainPageState createState() => _BookStoreMainPageState();
}

class _BookStoreMainPageState extends State<BookStoreMainPage> {
  late Size _size;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: bookStoreAppBar,

      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _size.height * 0.6,
              width: _size.width * 1.0,
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

            // Kategoriyadagi kitoblarni ko'rsatadi.
            _showCategoryBooks(),
          ],
        ),
      ),
      bottomNavigationBar: _getBottomNavBar(),
    );
  }

  /// Matnlarni Yozish uchun funksiya
  Widget _setText(String text, double size) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: size,
            fontFamily: "garamond",
            fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Kitobning title qismi
  Widget _setBookTitle(String title) => Container(
        child: Text(
          title,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  /// Matnlarni Belgilangan harf uzunligigacha yozadigan funksiya.
  Widget _setTextLight(String text, double size) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        (text.length > 15) ? text.substring(0, 15) + "..." : text,
        style: TextStyle(
          fontSize: size,
          fontFamily: "garamond",
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// SearchBox
  Widget _showSearchBox() {
    return TextField(
      controller: _searchController,
      decoration: _setInputDecoration(),
      textInputAction: TextInputAction.search,
      cursorColor: Colors.black,
    );
  }

  InputDecoration _setInputDecoration() {
    return InputDecoration(
      hintText: "Search entire store here",
      border: _setOutlineInputBorder(),
      focusedBorder: _setOutlineInputBorder(),
      prefixIcon: Icon(CupertinoIcons.search, color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(width: 2.0),
      ),
    );
  }

  OutlineInputBorder _setOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 2.0),
      borderRadius: BorderRadius.circular(24.0),
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
      width: _size.width * 1.0,
      height: _size.height * 0.03,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _setText("NEW ARRIVALS", 18.0),
          _setText("Best Buy", 18.0),
          _setText("SALE", 18.0),
        ],
      ),
    );
  }

  /// Pastdagi gorizontal kitoblar ro`yxati
  Widget _showCategoryBooks() {
    return Container(
      width: _size.width * 1.0,
      height: _size.height * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: getBooks().length,
          itemBuilder: (context, index) {
            Book book = getBooks()[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return AboutBookPage(
                    book: book,
                  );
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
                          placeholder:
                              AssetImage("assets/images/book_cover.jpg"),
                          image: AssetImage("assets/images/book_cover.jpg"),
                        ),
                      ),
                    ),
                    _setBookTitle(book.title),
                    _setTextLight(book.author, 12.0),
                  ],
                ),
              ),
            );
          }),
    );
  }

  SizedBox _getBottomNavBar() => SizedBox(
        height: 64.0,
        child: BottomNavigationBar(
          items: getBottomNavigationBarItems,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
        ),
      );
}
