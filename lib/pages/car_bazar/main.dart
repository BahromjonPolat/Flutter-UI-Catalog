import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/car_bazar/car_info_page.dart';
import 'package:flutter_ui/pages/car_bazar/car_list.dart';
import 'package:flutter_ui/pages/car_bazar/drawer_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarBazarMainPage extends StatefulWidget {
  @override
  _CarBazarMainPageState createState() => _CarBazarMainPageState();
}

class _CarBazarMainPageState extends State<CarBazarMainPage> {
  Size _size;
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _setAppBar(),
      drawer: carShopDrawer,
      body: _getBody(),
    );
  }

  Column _getBody() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _carTitleList(),
          Spacer(),
          _setImage(),
          _getSmoothPageIndicator(),
          Spacer(),
          _discoveryTable(),
          _getCarList(),
          Spacer(),
        ],
      );

  AppBar _setAppBar() => AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CarInfoPage()));
              },
              icon: Icon(CupertinoIcons.search)),
        ],
      );

  SizedBox _carTitleList() => SizedBox(
        height: 102.0,
        width: _size.width,
        child: ListView.builder(
          itemExtent: _size.width * 0.38,
            itemCount: carTitles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
          String title = carTitles[index];
          return _showCategory(title, index);
        }),
      );

  _showCategory(String title, int index) => Column(
    mainAxisAlignment: MainAxisAlignment.end,
        children: [
          (_currentIndex == index)
              ? SizedBox(
                  height: 64.0,
                  width: 64.0,
                  child: Image.network(teslaLogo),
                )
              : SizedBox(),
          _setText(
            title,
            16.0,
            _currentIndex == index ? Colors.black : Colors.grey,
          )
        ],
      );

  _getSmoothPageIndicator() => AnimatedSmoothIndicator(
        effect: WormEffect(
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade300,
            dotHeight: 6.0,
            dotWidth: 6.0),
        activeIndex: 1,
        count: 4,
      );

  _discoveryTable() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            _setText("Discovery", 24.0, Colors.black),
            Spacer(),
            SizedBox(
              height: 4,
              width: 48,
              child: LinearProgressIndicator(
                color: Colors.black,
                backgroundColor: Colors.grey,
                value: 0.4,
                minHeight: 5,
              ),
            ),
            _setText("1/6", 14, Colors.grey)
          ],
        ),
      );

  SizedBox _getCarList() => SizedBox(
        height: _size.height * 0.28,
        width: _size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _setDiscoveryImages(title: "Interface", imageUrl: teslaInterface),
            _setDiscoveryImages(title: "Speed", imageUrl: teslaSpeed),
            _setDiscoveryImages(title: "View", imageUrl: teslaView),
            _setDiscoveryImages(title: "Main", imageUrl: teslaMain),
          ],
        ),
      );

  _setDiscoveryImages({String imageUrl, String title}) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: _size.width * 0.4,
              width: _size.width * 0.4,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageUrl)),
              ),
            ),
            _setText(title, 15.0, Colors.grey),
          ],
        ),
      );

  _setImage() => Image.network(
        teslaMain,
        height: _size.height * 0.25,
        width: _size.width,
        fit: BoxFit.fitWidth,
      );

  Text _setText(String text, double size, Color color) => Text(
        text,
        maxLines: 7,
        overflow: TextOverflow.fade,
        softWrap: true,
        style: TextStyle(
          color: color,
          height: 1.2,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      );
}
