import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/model/page.dart';
import 'package:flutter_ui/pages/book_store/main.dart';
import 'package:flutter_ui/pages/coffee_bar/main.dart';
import 'package:flutter_ui/pages/food_menu/main.dart';
import 'package:flutter_ui/pages/instagram/ui/splash_screen.dart';
import 'package:flutter_ui/pages/courses/main.dart';
import 'package:flutter_ui/pages/sport/main.dart';

List<PageUI> pageList() {
  List<PageUI> pages = [];

  pages.add(new PageUI("Book Store", "Book store UI", Icon(CupertinoIcons.book),
      BookStoreMainPage()));

  pages.add(new PageUI(
      "Sport", "Sport list", Icon(CupertinoIcons.sportscourt), SportMenPage()));

  pages.add(new PageUI("Instagram", "Instagram UI",
      Icon(CupertinoIcons.photo_camera), InstagramSplashScreen()));

  pages.add(new PageUI("Courses", "UI", Icon(Icons.list), CoursesMainPage()));

  pages.add(new PageUI("Foods", "25-08-2021", Icon(Icons.emoji_food_beverage),
      FoodListMainPage()));

  pages.add(new PageUI("Coffee Bar", "26-08-2021",
      Icon(Icons.hourglass_bottom_outlined), CoffeeBarMainPage()));

  return pages;
}
