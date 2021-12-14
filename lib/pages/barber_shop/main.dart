import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/barber_shop/drawer.dart';

class BarberShopMainPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey();
  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      key: _keyScaffold,
      backgroundColor: Color.fromARGB(255, 56, 52, 67),
      appBar: _getAppBar(),
      body: _getBody(),
      drawer: barberDrawer(context),
    );
  }

  AppBar _getAppBar() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light),
        leading: Icon(CupertinoIcons.search),
        actions: [
          IconButton(
              onPressed: () {
                _keyScaffold.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.notes,
                color: Colors.orange,
              )),
        ],
      );

  _getBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _setText(
                  "Hey,",
                  36.0,
                  Colors.white,
                  false,
                ),
                _setText(
                    "Derek", 48.0, Color.fromARGB(255, 207, 193, 244), true),
                _setDivider(),

                Padding(
                  padding: const EdgeInsets.only(top: 64.0, bottom: 12.0),
                  child: _setText("Services", 32.0, Color.fromARGB(255, 207, 193, 244), true),
                ),

              ],
            ),
          ),
          _showServices(),
          Spacer(),
        ],
      );

  Text _setText(
    String text,
    double size,
    Color color,
    bool isBold,
  ) =>
      Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      );

  Divider _setDivider() => Divider(
        color: Color.fromARGB(255, 207, 193, 244),
      );

  SizedBox _showServices() => SizedBox(
    height: _size.height * 0.6,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
          itemCount: _serviceList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24.0,
            crossAxisSpacing: 24.0,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            return _setCategoryLayout(index);
          }));

  Container _setCategoryLayout(int index) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(1.0, -1.0),
              end: Alignment(-1.0, 1.0),
              colors: [
                Colors.grey[700]!,
                Colors.grey[300]!,
              ]),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0),
            topLeft: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: _size.width * 0.6,
              child: Image.asset(
                "assets/images/barber/scissors_$index.png",
                height: 120,
                width: 120.0,
                alignment: Alignment.topRight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: _setText(_serviceList[index], 18.0, Colors.white, false),
            )
          ],
        ),
      );

  List<String> _serviceList = [
    "Hair washing",
    "Classic shaving",
    "Hair care",
    "Beard trimming"
  ];
}
