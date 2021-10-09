import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/praying_time/data.dart';
import 'package:flutter_ui/pages/praying_time/screens/anothher/tasbih_page.dart';
import 'package:flutter_ui/pages/praying_time/time_model.dart';
import 'package:flutter_ui/pages/praying_time/widgets/set_text.dart';
import 'package:flutter_ui/pages/praying_time/widgets/show_indicator.dart';

class PrayerHomePage extends StatefulWidget {
  List<PrayingTime> times;

  PrayerHomePage(this.times);

  @override
  _PrayerHomePageState createState() => _PrayerHomePageState();
}

class _PrayerHomePageState extends State<PrayerHomePage> {
  static const Color _teal = Colors.teal;
  static const Color _grey = Colors.grey;
  static const Color _black = Colors.black;
  static const Color _white = Colors.white;
  static const Color _orange = Colors.orange;

  LinearGradient _gradient = LinearGradient(colors: [
    Colors.teal[200],
    Colors.teal[300],
    Colors.teal[400],
    Colors.teal[500],
    Colors.teal[600],
  ]);

  double _height;
  double _width;

  List<PrayingTime> _times;

  @override
  void initState() {
    super.initState();
    _times = widget.times;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        _showSliverAppBar(_times),
      ],
    );
  }

  SliverAppBar _showSliverAppBar(List<PrayingTime> timeList) => SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _teal,
        stretch: true,
        shape:
            RoundedRectangleBorder(borderRadius: setBorderRadius(radius: 32.0)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setLightText("Assalomu alaykum,", _white, 12.0),
            setLightText("Bahromjon Po'lat!", _white, 16.0),
          ],
        ),
        actions: [
          setIconButton(CupertinoIcons.search),
          setIconButton(CupertinoIcons.bell),
          setIconButton(CupertinoIcons.person_circle),
        ],
        bottom: PreferredSize(
          preferredSize: Size(_width, _height * 0.25),
          child: Transform.translate(
            offset: Offset(0.0, 48.0),
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(borderRadius: setBorderRadius()),
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 18.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: setTimeAndLocation(
                          CupertinoIcons.time,
                          timeList[getToday].date.gregorian.date,
                          timeList[getToday].timings.fajr,
                        )),
                        Expanded(
                            child: setTimeAndLocation(CupertinoIcons.location,
                                "Joy", timeList[getToday].meta.timezone)),
                      ],
                    ),
                    Divider(thickness: 1.0, height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _setCategory(
                          CupertinoIcons.compass,
                          "Qibla",
                          null,
                        ),
                        _setCategory(
                          CupertinoIcons.book,
                          "AlQur'an",
                          null,
                        ),
                        _setCategory(
                          CupertinoIcons.moon_stars,
                          "Ramadan",
                          null,
                        ),
                        _setCategory(
                          CupertinoIcons.circle_grid_hex,
                          "Tasbeh",
                          PrayerTimeTasbihPage(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
              bottomRight: Radius.circular(32.0),
            ),
            child: Image.network(
              "https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=764&q=80",
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  _setCategory(IconData iconData, String title, Widget page) => Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => page));
              },
              icon: Icon(iconData)),
          setLightText(title, _black, 12.0),
        ],
      );
}
