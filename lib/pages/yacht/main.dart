import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/yacht/circle_tab_indicator.dart';
import 'package:flutter_ui/pages/yacht/details_page.dart';
import 'package:flutter_ui/pages/yacht/image_links.dart';

class YachtMainPage extends StatefulWidget {
  @override
  State<YachtMainPage> createState() => _YachtMainPageState();
}

class _YachtMainPageState extends State<YachtMainPage>
    with TickerProviderStateMixin {
  static const Color _blue = Color.fromARGB(255, 47, 128, 237);
  static const Color _white = Colors.white;
  static const Color _black = Colors.black;
  static const Color _orange = Colors.orange;
  static const Color _transparent = Colors.transparent;
  static const Color _grey = Colors.grey;
  static const Color _disabledColor = Color(0xffdddddd);

  double _width;
  double _height;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _getBody(),
    );
  }

  /// ASOSIY BODY
  Stack _getBody() => Stack(
        children: [
          _getBackground(),
          _getScrollableBody(),
        ],
      );

  /// ILOVANING ORQA FON QISMI
  SizedBox _getBackground() => SizedBox(
        height: _height,
        width: _width,
        child: Row(
          children: [
            Spacer(),
            Material(
              color: _disabledColor,
              child: SizedBox(
                width: _width * 0.3,
                height: _height,
              ),
            )
          ],
        ),
      );

  /// MA'LUMATOLARNI KO'RSATADIGAN ASOSIY FUNKSIYA
  CustomScrollView _getScrollableBody() => CustomScrollView(
        slivers: [
          _getSliverAppBar(),
          _changeWidgetToSliver(
              _setTitle("Yacht", 24.0, FontWeight.bold, _black)),
          _changeWidgetToSliver(
              _setTitle("Charters", 24.0, FontWeight.w300, _black)),
          _changeWidgetToSliver(_showYachtRow()),
          _changeWidgetToSliver(
              _setTitle("Popular", 21.0, FontWeight.bold, _black)),
          _showPopularYachtList(),
        ],
      );

  /// SLIVER APP BAR
  SliverAppBar _getSliverAppBar() => SliverAppBar(
        elevation: 0.0,
        backgroundColor: _transparent,
        pinned: true,
        leading: _setIconButton(CupertinoIcons.back, _black),
        actions: [
          _setIconButton(CupertinoIcons.square_grid_2x2, _black),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      );

  Stack _showYachtRow() => Stack(
        children: [
          _showYachtList(),
          _getRotatedTabBar(),
        ],
      );

  RotatedBox _getRotatedTabBar() => RotatedBox(
        quarterTurns: 3,
        child: SizedBox(
          height: _width * 0.2,
          width: _height * 0.4,
          child: TabBar(
            labelColor: _black,
            unselectedLabelColor: _grey,
            controller: _tabController,
            isScrollable: true,
            indicator: CircleTabIndicator(color: _black, radius: 3.0),
            tabs: [
              _setTab("Motor-Sailing"),
              _setTab("Sailing"),
              _setTab("Motor"),
            ],
          ),
        ),
      );

  Tab _setTab(String tabLabel) => Tab(text: tabLabel);

  _showYachtList() => SizedBox(
        height: _height * 0.4,
        child: Swiper(
          itemCount: 5,
          autoplay: false,
          itemHeight: _height * 0.4,
          itemWidth: _width * 0.5,
          containerWidth: 45,
          layout: SwiperLayout.CUSTOM,
          loop: false,
          customLayoutOption: _getLayoutOption(),
          itemBuilder: (context, index) {
            return _setYachtInfo();
          },
          onTap: (index) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => YachtDetailsPage(),
              ),
            );
          },
        ),
      );

  CustomLayoutOption _getLayoutOption() =>
      CustomLayoutOption(startIndex: -1, stateCount: 4).addTranslate([
        Offset(-320.0, -20.0),
        Offset(16.0, 0.0),
        Offset(276.0, -20.0),
        Offset(460.0, -20.0)
      ]).addScale(
        [0.8, 0.9, 0.8, 0.7],
        Alignment.centerRight,
      ).addOpacity([0.0, 1, 0.6, 0.3]);

  Container _setYachtInfo() => Container(
        width: _width * 0.5,
        height: _height * 0.4,
        decoration: _setBoxDecoration(_blue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SizedBox(width: 16.0),
                _setTitle("#yachting", 14.0, FontWeight.normal, _white),
                Spacer(),
                _setIconButton(CupertinoIcons.heart, _white),
              ],
            ),
            Expanded(child: Image.network(yacht)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child:
                  _setTitle("Atlantida\nYacht", 16.0, FontWeight.bold, _white),
            ),
            SizedBox(height: 24.0),
            Row(
              children: [
                SizedBox(width: 24.0),
                _setTitle("\$1000", 16.0, FontWeight.bold, _white),
                _setTitle(" / day", 14.0, FontWeight.normal, _white),
              ],
            ),
            SizedBox(height: 24.0),
          ],
        ),
      );

  SliverList _showPopularYachtList() => SliverList(
        delegate: SliverChildListDelegate(
          List.generate(
            10,
            (index) => _setPopularYachtInfo(),
          ),
        ),
      );

  _setPopularYachtInfo() => ListTile(
        title: _setTitle("Oceana Yacht", 16.0, FontWeight.bold, _black),
        subtitle: _setTitle("⭐️4.6", 14.0, FontWeight.normal, _grey),
        leading: Material(
          borderRadius: BorderRadius.circular(12.0),
          color: _orange,
          child: Image.network(
            yacht,
            height: 56.0,
            width: 56.0,
          ),
        ),
      );

  Decoration _setBoxDecoration(Color color) => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      );

  /// ICON BUTTON QO'YISH UCHUN MAXSUS METOD
  IconButton _setIconButton(IconData iconData, Color color) => IconButton(
        onPressed: () {},
        icon: Icon(
          iconData,
          color: color,
        ),
      );

  ///TEXT UCHUN MAXSUS METOD
  Text _setTitle(
          String title, double size, FontWeight fontWeight, Color color) =>
      Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
      );

  /// VIDJETLARNI  SLIVERGA O'TKAZISH UCHUN ADAPTER METOD
  SliverToBoxAdapter _changeWidgetToSliver(Widget widget) => SliverToBoxAdapter(
        child: widget,
      );
}
