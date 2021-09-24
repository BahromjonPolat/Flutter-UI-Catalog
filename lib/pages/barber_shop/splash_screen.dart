import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/pages/barber_shop/main.dart';

class BarberShopSplashScreen extends StatelessWidget {
  Size _size;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _context = context;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 52, 67),
      body: _getBody(),
    );
  }

  _getBody() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/barber/barber_logo.png",
              height: _size.height * 0.18,
              width: _size.width,
            ),
            SvgPicture.asset(
              "assets/images/barber/barber_main.svg",
              height: _size.height * 0.3,
            ),
            _getButton(),
            _setText(),
          ],
        ),
      );

  ElevatedButton _getButton() => ElevatedButton(
        onPressed: () {
          Navigator.push(
              _context, MaterialPageRoute(builder: (_) => BarberShopMainPage()));
        },
        child: Text("Get a serious haircut"),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          fixedSize: Size(_size.width * 0.7, 48.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      );

  Text _setText() => Text(
        "No, take me back to mommy",
        style: TextStyle(color: Colors.white),
      );
}
