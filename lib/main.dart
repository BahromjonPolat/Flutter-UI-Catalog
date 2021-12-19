import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/authorization/provider/sign_up_provider.dart';
import 'package:flutter_ui/provider/profile_tab_bar_provider.dart';
import 'package:flutter_ui/screens/home/home_page.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_)=> ProfileTabProvider()),
      ],
      child: MyApp(),
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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
