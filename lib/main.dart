import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/screens/home/home_page.dart';

main() {
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter UI Catalog",
      debugShowCheckedModeBanner: false,
      home: PageList(),
    );
  }
}
