import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/praying_time/data/api_data.dart';
import 'package:flutter_ui/pages/praying_time/data/video_list.dart';
import 'package:flutter_ui/pages/praying_time/models/video_model.dart';
import 'package:flutter_ui/pages/praying_time/screens/anothher/tasbih_page.dart';
import 'package:flutter_ui/pages/praying_time/models/time_model.dart';
import 'package:flutter_ui/pages/praying_time/widgets/set_text.dart';


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
  static Color _deepGreen = Colors.green.shade800;
  static const Color _orange = Colors.orange;
  static const Color _blackWithOpacity = Colors.black38;

  LinearGradient _gradient = LinearGradient(colors: [
    Colors.green[600]!,
    Colors.green[500]!,
    Colors.green[400]!,
    Colors.green[300]!,
    Colors.green[400]!,
  ]);

  late double _height;
  late double _width;

  late List<PrayingTime> _times;

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
        _showQuranAyat(),
        _setCategoryName("Jonli Efir"),
        _showLiveVideoList(),
        _setCategoryName("Video"),
        _showVideoList(),
      ],
    );
  }

  SliverAppBar _showSliverAppBar(List<PrayingTime> timeList) => SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _teal,
        stretch: true,
        floating: true,
        shape: RoundedRectangleBorder(
          borderRadius: setBorderRadius(radius: 32.0),
        ),
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
                          PrayerTimeTasbihPage(),
                        ),
                        _setCategory(
                          CupertinoIcons.book,
                          "Qur'on",
                          PrayerTimeTasbihPage(),
                        ),
                        _setCategory(
                          CupertinoIcons.moon_stars,
                          "Masjid",
                          PrayerTimeTasbihPage(),
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
          setIconButton(iconData, color: _deepGreen, onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => page));
          }),
          setLightText(title, _black, 12.0),
        ],
      );

  SliverToBoxAdapter _showQuranAyat() => SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(top: 65.0, right: 24.0, left: 24.0),
          decoration: BoxDecoration(
              borderRadius: setBorderRadius(), gradient: _gradient),
          child: ListTile(
            leading: Text(
              "q",
              style: TextStyle(
                  fontSize: 48.0, color: _white, fontFamily: "islamic"),
            ),
            title: setBoldText("Baqara surasi 28-oyat", _white, 16.0),
            subtitle: setLightText("Tafsiri Hilol", _white, 12.0),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: _white,
              size: 16.0,
            ),
          ),
        ),
      );

  SliverPadding _setCategoryName(String title) => SliverPadding(
        padding: EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
        sliver: SliverToBoxAdapter(
          child: setBoldText(title, _black, 24.0),
        ),
      );

  SliverList _showLiveVideoList() => SliverList(
        delegate: SliverChildListDelegate(
          List.generate(
            getLiveVideoList.length,
            (index) => _setVideo(getLiveVideoList[index]),
          ),
        ),
      );

  SliverList _showVideoList() => SliverList(
        delegate: SliverChildListDelegate(
          List.generate(
            getVideoList.length,
            (index) => _setVideo(getVideoList[index]),
          ),
        ),
      );

  Column _setVideo(VideoModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
        height: _height * 0.23,
        decoration: BoxDecoration(
          borderRadius: setBorderRadius(radius: 8.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(model.thumbnailUrl),
          ),
        ),

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          margin: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: _blackWithOpacity,
            borderRadius: setBorderRadius(radius: 6.0),
          ),
          child: setLightText(model.duration, _white, 13.0),
        ),
      ),
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
        leading: CircleAvatar(
          backgroundImage: NetworkImage("https://yt3.ggpht.com/ytc/AKedOLS1Jm-mlVk6raNA2eo0ft5tUiDUdtbzF9SbJRX-Zw=s88-c-k-c0x00ffffff-no-rj"),
        ),
        title: setBoldText(model.title, _black, 16.0),
        subtitle: setLightText(model.subtitle, _grey, 14.0),
      ),
    ],
  );
}
