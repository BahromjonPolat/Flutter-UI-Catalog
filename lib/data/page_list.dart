import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/model/page.dart';
import 'package:flutter_ui/pages/book_store/main.dart';
import 'package:flutter_ui/pages/sport/main.dart';

List<PageUI> getPages() {
  List<PageUI> pages = [];

  pages.add(new PageUI("Book Store", "Book store UI", Icon(CupertinoIcons.book),
      BookStoreMainPage()));

  pages.add(new PageUI(
      "Sport", "Sport list", Icon(CupertinoIcons.sportscourt), SportMenPage()));

  return pages;
}
