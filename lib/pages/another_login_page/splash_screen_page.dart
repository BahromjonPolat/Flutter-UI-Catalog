import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/another_login_page/login_page.dart';

class AnotherLoginPageSplashScreenPage extends StatelessWidget {
  Size _size;
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() => Container(
        child: Column(
          children: [
            _getPhoto(),
            _getBottomSide(),
          ],
        ),
      );

  Container _getPhoto() => Container(
        height: _size.height * 0.6,
        child: Image.network(
          "https://source.unsplash.com/random",
          fit: BoxFit.cover,
        ),
      );

  Container _getBottomSide() => Container(
        margin: EdgeInsets.symmetric(horizontal: 32.0),
        height: _size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Get Started"),
            Text(
              "Millions of people use to turn their ideas into reality.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                }, child: Text("Skip Now")),

                ElevatedButton(onPressed: (){
                  Navigator.push(_context, MaterialPageRoute(builder: (ctx) => AnotherLoginPage()));
                }, child: Text("Next")),
              ],
            ),
          ],
        ),
      );
}
