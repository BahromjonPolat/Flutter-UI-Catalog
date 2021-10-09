import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/pages/praying_time/data.dart';
import 'package:flutter_ui/pages/praying_time/time_model.dart';
import 'package:flutter_ui/pages/praying_time/widgets/set_text.dart';
import 'package:flutter_ui/pages/praying_time/widgets/show_indicator.dart';

class PrayerAlarmPage extends StatefulWidget {
  List<PrayingTime> times;

  PrayerAlarmPage(this.times);

  @override
  State<PrayerAlarmPage> createState() => _PrayerAlarmPageState();
}

class _PrayerAlarmPageState extends State<PrayerAlarmPage> {
  static const Color _teal = Colors.teal;
  static const Color _grey = Colors.grey;
  static const Color _black = Colors.black;
  static const Color _white = Colors.white;
  static const Color _orange = Colors.orange;
  static const Color _transparent = Colors.transparent;

  LinearGradient _gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.teal[600],
        Colors.teal[500],
        Colors.teal[400],
        Colors.teal[300],
        Colors.teal[200],
      ]);

  double _width;
  double _height;

  int _currentDay = DateTime.now().weekday;

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
    return _showPrayerTimes();
  }

  _showPrayerTimes() => CustomScrollView(
        slivers: [
          _showSliverAppBar(),
          _showWeeklyInfo(),
          _showMoreInfo(),
          _showPrayerTimesOfToday(),
        ],
      );

  SliverAppBar _showSliverAppBar() => SliverAppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: _transparent,
        title: setTimeAndLocation(
          CupertinoIcons.location,
          "Joy",
          _times[getToday].meta.timezone,
        ),
        actions: [
          setIconButton(Icons.settings_outlined, color: _grey),
        ],
      );

  SliverToBoxAdapter _showWeeklyInfo() => SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            7,
            (index) => _setWeekDay(_weekDays[index], getToday + 1 + index),
          ),
        ),
      );

  _setWeekDay(String day, int dayNumber) => Column(
        children: [
          setLightText(day, _grey, 14.0),
          SizedBox(height: 12.0),

          setBoldText(dayNumber.toString(), _black, 18.0),
        ],
      );

  SliverToBoxAdapter _showMoreInfo() => SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.all(18.0),
          height: _height * 0.28,
          decoration: BoxDecoration(
            gradient: _gradient,
            borderRadius: setBorderRadius(),
          ),
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/svg/istanbul_mosque.svg",
                color: Color(0x48ffffff),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      );

  SliverList _showPrayerTimesOfToday() {
    Timings time = _times[getToday].timings;
    return SliverList(
        delegate: SliverChildListDelegate([
      _setTime("Bomdod", time.fajr),
      _setTime("Quyosh", time.sunrise),
      _setTime("Peshin", time.dhuhr),
      _setTime("Asr", time.asr),
      _setTime("Shom", time.maghrib),
      _setTime("Xufton", time.isha),
    ]));
  }

  Padding _setTime(String title, String time) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
          shape: RoundedRectangleBorder(
              borderRadius: setBorderRadius(radius: 8.0),
              side: BorderSide(color: _grey, width: 0.5)),
          title: setBoldText(title, _black, 16.0),
          trailing: SizedBox(
            width: _width * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                setBoldText(time.substring(0, 6), _grey, 16.0),
                setIconButton(CupertinoIcons.speaker_3_fill, color: _teal),
              ],
            ),
          ),
          onTap: () {},
        ),
      );

  List<String> _weekDays = [
    "DUSH",
    "SESH",
    "CHOR",
    "PAY",
    "JUM",
    "SHAN",
    "YAK"
  ];
}
