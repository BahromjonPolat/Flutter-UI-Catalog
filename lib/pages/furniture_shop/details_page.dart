import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/furniture_shop/bottom_navigation_bar.dart';

class FurnitureShopDetailsPage extends StatefulWidget {
  @override
  State<FurnitureShopDetailsPage> createState() =>
      _FurnitureShopDetailsPageState();
}

class _FurnitureShopDetailsPageState extends State<FurnitureShopDetailsPage>
    with TickerProviderStateMixin {
  static const Color _transparent = Colors.transparent;
  static const Color _grey = Colors.grey;
  static const Color _white = Colors.white;
  static const Color _orange = Colors.orange;
  Size _size;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _white,
      appBar: _getAppBar(),
      body: _getBody(),
      floatingActionButton: _buyFurnitureButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: furnitureBottomNavigationBar,
    );
  }

  AppBar _getAppBar() => AppBar(
        backgroundColor: _transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: _grey),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.star_border)),
        ],
      );

  _getBody() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _getImage(),
            _setBoldText("Blue Chair", 32.0),
            SizedBox(height: 12),
            _getLikedPanel(),
            SizedBox(height: 12),
            _setSimpleText(
                "Dimensions: H 33 x W 19 x D 21: Seating Height: Height-17.9, All dimensions are in INCH"),
            _setDivider(),
            _getTabBar(),
            SizedBox(height: 12.0),
            _setBoldText("Dimensions:", 18.0),
            _setSimpleText(
                "Dimensions: H 33 x W 19 x D 21: Seating Height: Height-17.9, All dimensions are in INCH"),
            SizedBox(height: 12.0),
            _setBoldText("Material:", 18.0),
            _setSimpleText(
                "PolyPurulent Fabric, High Quality Wood, High Quality Leather"),
          ],
        ),
      );

  Image _getImage() => Image.asset(
        "assets/images/furniture/blue_chair.jpg",
        fit: BoxFit.contain,
        height: _size.height * 0.4,
        width: _size.width,
      );

  TabBar _getTabBar() => TabBar(
        labelColor: _orange,
        unselectedLabelColor: _grey,
        isScrollable: true,
        indicatorColor: _orange,
        controller: _tabController,
        tabs: [
          _setTab("Specification"),
          _setTab("Care"),
          _setTab("FAQ's"),
          _setTab("Shipping"),
          _setTab("Terms"),
          _setTab("Warranty"),
        ],
      );

  Tab _setTab(String tabTitle) => Tab(text: tabTitle, height: 36.0);

  Text _setBoldText(String label, double size) => Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size,
            fontFamily: "garamond"),
      );

  Row _getLikedPanel() => Row(
        children: [
          Icon(Icons.favorite, color: _orange),
          _setSimpleText("4.9, | 239 Reviews"),
        ],
      );

  _setSimpleText(String title) => Text(
        title,
        style: TextStyle(color: _grey, fontFamily: "garamond", fontSize: 15.0),
      );

  Divider _setDivider() => Divider(thickness: 1.0);

  FloatingActionButton _buyFurnitureButton() => FloatingActionButton.extended(
        onPressed: () {},
        label: _setBoldText("Buy Now!", 12.0),
      );
}
