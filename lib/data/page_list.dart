import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/model/page.dart';
import 'package:flutter_ui/pages/another_login_page/splash_screen_page.dart';
import 'package:flutter_ui/pages/authorization/splash_screen_page.dart';
import 'package:flutter_ui/pages/barber_shop/splash_screen.dart';
import 'package:flutter_ui/pages/book_store/screen/main.dart';
import 'package:flutter_ui/pages/booking_hotel/screens/splash_screen.dart';
import 'package:flutter_ui/pages/car_bazar/main.dart';
import 'package:flutter_ui/pages/coffee_bar/main.dart';
import 'package:flutter_ui/pages/coffee_shop/splash_screen.dart';
import 'package:flutter_ui/pages/counter_app/main.dart';
import 'package:flutter_ui/pages/fashion/main.dart';
import 'package:flutter_ui/pages/food_menu/main.dart';
import 'package:flutter_ui/pages/friendship/screens/splash_screen.dart';
import 'package:flutter_ui/pages/furniture_shop/main.dart';
import 'package:flutter_ui/pages/hotel/main.dart';
import 'package:flutter_ui/pages/instagram/ui/splash_screen.dart';
import 'package:flutter_ui/pages/courses/main.dart';
import 'package:flutter_ui/pages/messaging_app/screens/main.dart';
import 'package:flutter_ui/pages/order_food/splash_screen_page.dart';
import 'package:flutter_ui/pages/planets/splash_screen.dart';
import 'package:flutter_ui/pages/plus_messenger/main.dart';
import 'package:flutter_ui/pages/select_coffee/main.dart';
import 'package:flutter_ui/pages/sport/main.dart';
import 'package:flutter_ui/pages/students_mark/main.dart';
import 'package:flutter_ui/pages/super_mario/main.dart';
import 'package:flutter_ui/pages/water_shop/register_page.dart';

List<PageUI> pageList = [
  new PageUI(
    "Book Store",
    "Book store UI",
    "",
    "",
    Icon(CupertinoIcons.book),
    BookStoreMainPage(),
  ),
  new PageUI(
    "Sport",
    "Sport list",
    "",
    "",
    Icon(CupertinoIcons.sportscourt),
    SportMenPage(),
  ),
  new PageUI(
    "Instagram",
    "Instagram UI",
    "",
    "",
    Icon(CupertinoIcons.photo_camera),
    InstagramSplashScreen(),
  ),
  new PageUI(
    "Courses",
    "UI",
    "",
    "",
    Icon(Icons.list),
    CoursesMainPage(),
  ),
  new PageUI(
    "Foods",
    "25-08-2021",
    "",
    "25-08-2021",
    Icon(Icons.emoji_food_beverage),
    FoodListMainPage(),
  ),
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
  new PageUI(
    "Hotel UI",
    "Mexmonxona UI",
    "Mexmonxona",
    "31-08-2021",
    Icon(Icons.hotel),
    HotelMainPage(),
  ),
  new PageUI(
    'Space',
    "Space UI",
    "About Space",
    "04-09-2021",
    Icon(Icons.fiber_smart_record_sharp),
    PlanetsSplashScreen(),
  ),
  new PageUI(
    "Super Mario",
    "08-09-2021",
    "_description",
    "08-09-2021",
    Icon(Icons.gamepad_outlined),
    SuperMarioMainPage(),
  ),
  new PageUI(
    "Auth",
    "Login page",
    "---",
    "09-09-2021",
    Icon(Icons.login),
    AuthSplashScreenPage(),
  ),
  new PageUI(
    "Another Login Page",
    "_subtitle",
    "_description",
    "09-09-2021",
    Icon(Icons.login),
    AnotherLoginPageSplashScreenPage(),
  ),
  new PageUI(
    "Order Food",
    "_subtitle",
    "_description",
    "13-09-2021",
    Icon(Icons.fastfood_outlined),
    OrderFoodSplashScreenPage(),
  ),
  new PageUI(
    "Water Shop",
    "Sub",
    "Desc",
    "15-09-2021",
    Icon(Icons.water),
    WaterShopRegisterPage(),
  ),
  new PageUI(
    "Marks",
    "_subtitle",
    "_description",
    "17-09-2021",
    Icon(Icons.play_lesson_outlined),
    MarkListPage(),
  ),
  new PageUI(
    "Friendship",
    "Chat App",
    "Imtihonda berilgan vazifa",
    "20-09-2021",
    Icon(Icons.play_lesson_rounded),
    FriendshipSplashScreenPage(),
  ),
  new PageUI(
    "Car Bazar",
    "Cars",
    "_description",
    "21-09-2021",
    Icon(Icons.car_rental_outlined),
    CarBazarMainPage(),
  ),
  new PageUI(
    "Plus Messenger",
    "Telegram UI",
    "_description",
    "22-09-2021",
    Icon(Icons.add_circle_outline_rounded),
    PlusMessengerMainPage(),
  ),
  new PageUI(
    "Barber Shop",
    " Awesome barber shop",
    "",
    "23-09-2021",
    Icon(Icons.beach_access_rounded),
    BarberShopSplashScreen(),
  ),
  new PageUI(
    "Booking Hotel",
    "Hotel",
    "",
    "24-09-2021",
    Icon(Icons.local_hotel_outlined),
    BookingHotelSplashScreen(),
  ),
  new PageUI(
    "Messaging App",
    "Chat App",
    "",
    "27-09-2021",
    Icon(CupertinoIcons.chat_bubble),
    MessagingAppMainPage(),
  ),
  new PageUI(
    "Counter App",
    "",
    "",
    "28-09-2021",
    Icon(Icons.countertops_outlined),
    CounterAppMainPage(),
  ),
  new PageUI(
    "Fashion App",
    "Fashion",
    "",
    "29-09-2021",
    Icon(CupertinoIcons.money_dollar),
    FashionPageMain(),
  ),
  new PageUI(
    "Select Coffee",
    "_subtitle",
    "_description",
    "30-09-2021",
    Icon(Icons.coffee_maker),
    SelectCoffeeMainPage(),
  ),
  new PageUI(
    "Furniture App",
    "_subtitle",
    "_description",
    "01-10-2021",
    Icon(Icons.chair),
    FurnitureShopMainPage(),
  )
];
