import 'package:flutter/material.dart';
import 'package:flutter_ui/components/exporting_packages.dart';

AppBar _appBar() => AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      iconTheme: IconThemeData(color: Colors.black87),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(CupertinoIcons.line_horizontal_3_decrease_circle),
        onPressed: () {},
      ),
      elevation: 0.0,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              backgroundImage: AssetImage("assets/images/logo.jpg"),
            ),
            onTap: () {
              Fluttertoast.showToast(
                msg: "profile Image was clicked!",
                toastLength: Toast.LENGTH_SHORT,
              );
            },
          ),
        ),
      ],
    );

AppBar get bookStoreAppBar => _appBar();
