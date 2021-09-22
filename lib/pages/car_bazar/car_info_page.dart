import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/car_bazar/car_list.dart';

class CarInfoPage extends StatelessWidget {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _setAppBar(context),
      body: _getBody(),
    );
  }

  AppBar _setAppBar(BuildContext context) => AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.network(
          teslaLogo,
          height: 64,
          width: 64,
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(CupertinoIcons.square_grid_2x2)),
        ],
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );

  _getBody() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setImage(),
            _getFinger(),
            _setText("Tesla S model future", 24.0),
            _setText(_desc, 15.0),
            _getCarPriceInfo(),
            _reserveButton(),
          ],
        ),
      );

  _setImage() => Image.network(
        teslaMain,
        height: _size.height * 0.25,
        width: _size.width,
        fit: BoxFit.fitWidth,
      );

  Row _getFinger() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _setText("360", 16.0),
          SizedBox(width: 16.0),
          Icon(Icons.thumb_up)
        ],
      );

  Text _setText(String text, double size) => Text(
        text,
        maxLines: 7,
        overflow: TextOverflow.fade,
        softWrap: true,
        style: TextStyle(
          color: Colors.black,
          height: 1.2,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      );

  Text _setTextLight(String text) => Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          height: 1.2,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );

  Column _setInfo(String info, String title) => Column(
        children: [
          _setText(info, 18.0),
          _setTextLight(title),
        ],
      );

  Row _getCarPriceInfo() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setInfo("<5 sec", "Time"),
          _setDivider(),
          _setInfo("+250 mt", "Speed"),
          _setDivider(),
          _setInfo("\$100,000", "Price"),
        ],
      );

  _setDivider() => SizedBox(
        height: 24.0,
        child: VerticalDivider(
          color: Colors.black,
        ),
      );

  _reserveButton() => Padding(
        padding: EdgeInsets.symmetric(horizontal: _size.width * 0.17),
        child: OutlinedButton(
          onPressed: () {},
          child: _setText("Reserve now", 21.0),
          style: OutlinedButton.styleFrom(
            fixedSize: Size(_size.width * 0.6, 48.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            side: BorderSide(width: 2.0),
          ),
        ),
      );

  String _desc =
      "Without it we wouldn't have the growing selection of electric vehicles we have today, yet the 2022 Tesla Model S remains one of the most compelling and desirable options in that growing market segment. With up to 412-miles of estimated driving range—depending upon model—the S can easily be used for long drives, and the 1020-hp Plaid version can deliver supercar acceleration while seating four adults. The Model S is also practical, with a large rear cargo area and a secondary front-trunk for extra space. New entrants in the luxury EV sedan category includes the Porsche Taycan and the Audi e-tron GT, both of which challenge the Model S in terms of performance and comfort, but its superior range and available semi-autonomous driving technology continue to draw consumers to this Tesla.";
}
