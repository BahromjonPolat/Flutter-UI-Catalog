import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/model/page.dart';
import 'package:flutter_ui/pages/book_store/main.dart';
import 'package:flutter_ui/pages/instagram/ui/splash_screen.dart';
import 'package:flutter_ui/pages/courses/main.dart';
import 'package:flutter_ui/pages/sport/main.dart';

List<PageUI> getPages() {
  List<PageUI> pages = [];

  pages.add(new PageUI("Book Store", "Book store UI", Icon(CupertinoIcons.book),
      BookStoreMainPage()));

  pages.add(new PageUI(
      "Sport", "Sport list", Icon(CupertinoIcons.sportscourt), SportMenPage()));

  pages.add(new PageUI("Instagram", "Instagram UI",
      Icon(CupertinoIcons.photo_camera), InstagramSplashScreen()));

  pages.add(new PageUI("Scroll", "UI", Icon(CupertinoIcons.scope), CoursesMainPage()));

  return pages;
}
