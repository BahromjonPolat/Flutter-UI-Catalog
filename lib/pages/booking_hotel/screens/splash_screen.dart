import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/booking_hotel/screens/main.dart';
import 'package:flutter_ui/pages/hotel/screens/room_info.dart';

class BookingHotelSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => BookingHotelMainPage()));
    });

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      );

  Center _getBody() => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_hotel_outlined,
              color: Colors.white,
              size: 64.0,
            ),
            Text(
              "OTEL",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
