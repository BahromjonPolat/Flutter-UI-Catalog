import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/model/page.dart';
import 'package:flutter_ui/pages/book_store/main.dart';
import 'package:flutter_ui/pages/coffee_bar/main.dart';
import 'package:flutter_ui/pages/coffee_shop/main.dart';
import 'package:flutter_ui/pages/coffee_shop/splash_screen.dart';
import 'package:flutter_ui/pages/food_menu/main.dart';
import 'package:flutter_ui/pages/instagram/ui/splash_screen.dart';
import 'package:flutter_ui/pages/courses/main.dart';
import 'package:flutter_ui/pages/sport/main.dart';

List<PageUI> pageList = [
  new PageUI("Book Store", "Book store UI", "", "", Icon(CupertinoIcons.book),
      BookStoreMainPage()),
  new PageUI("Sport", "Sport list", "", "", Icon(CupertinoIcons.sportscourt),
      SportMenPage()),
  new PageUI("Instagram", "Instagram UI", "", "",
      Icon(CupertinoIcons.photo_camera), InstagramSplashScreen()),
  new PageUI("Courses", "UI", "", "", Icon(Icons.list), CoursesMainPage()),
  new PageUI("Foods", "25-08-2021", "", "25-08-2021",
      Icon(Icons.emoji_food_beverage), FoodListMainPage()),
  new PageUI(
      "Coffee Bar",
      "26-08-2021",
      "Foydalanilgan Vidjetlar SliverAppBar, SliverList, SliverGrid",
      "26-08-2021",
      Icon(Icons.emoji_food_beverage_rounded),
      CoffeeBarMainPage()),
  new PageUI(
      "Coffee Shop",
      "28-08-2021",
      "Coffee Shop. Foydalanilgan",
      "28-08-2021",
      Icon(Icons.emoji_food_beverage_outlined),
      CoffeeShopSplashScreen()),
];
