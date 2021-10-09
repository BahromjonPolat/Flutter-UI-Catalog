import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/ui/page_list_ui.dart';

main() {
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My UI Catalog",
      debugShowCheckedModeBanner: false,
      home: PageList(),
    );
  }
}
