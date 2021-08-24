import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/instagram/ui/main_pages/activities_page.dart';
import 'package:flutter_ui/pages/instagram/ui/main_pages/home_page.dart';
import 'package:flutter_ui/pages/instagram/ui/main_pages/new_post.dart';
import 'package:flutter_ui/pages/instagram/ui/main_pages/profile_page.dart';
import 'package:flutter_ui/pages/instagram/ui/main_pages/search_page.dart';

List<Widget> pageList =[
  new InstagramHomePage(),
  new InstagramSearchPage(),
  new InstagramNewPost(),
  new InstagramActivityPage(),
  new InstagramProfilePage(),
];