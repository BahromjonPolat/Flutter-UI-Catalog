import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderFoodMainPage extends StatefulWidget {
  @override
  _OrderFoodMainPageState createState() => _OrderFoodMainPageState();
}

class _OrderFoodMainPageState extends State<OrderFoodMainPage> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: _getBottomNavBar(),
    );
  }

  _getBody() => CustomScrollView(
        slivers: [
          _getSliverAppBar(),
          _getSliverList(),
        ],
      );

  _getSliverAppBar() => SliverAppBar(
        backgroundColor: Colors.deepOrange,
        bottom: PreferredSize(
          preferredSize: Size(_size.width, _size.height * 0.25),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "Hi, Burhan \n",
                            style: TextStyle(fontSize: 24.0)),
                        TextSpan(text: "Good Morning!"),
                      ]),
                      style: TextStyle(color: Colors.white),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white70),
                          child: Icon(
                            Icons.gps_fixed,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                _searchFood(),
                _saleTable(),
              ],
            ),
          ),
        ),
      );

  _searchFood() => TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          fillColor: Colors.white,
          filled: true,
          hintText: "Search",
          prefixIcon: Icon(CupertinoIcons.search),
          suffixIcon: Icon(Icons.insights),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      );

  _saleTable() => Transform.translate(
        offset: Offset(0.0, 45.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            height: _size.height * 0.15,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "30%",
                      style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Discount for All Foods",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Valid until November 16",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Expanded(
                    child:
                        Image.asset("assets/images/order_food/food_main.png")),
              ],
            ),
          ),
        ),
      );

  _getSliverList() =>
      SliverList(delegate: SliverChildListDelegate([_layout()]));

  _layout() => Card(
        child: Container(
          height: _size.height * 0.2,
          width: _size.width,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset("assets/images/order_food/food_main.png")
                    ),

                    Text("Chif Sam's..."),
                    Text("Chif Sam's..."),
                  ],
                ),
              ),Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset("assets/images/order_food/food_main.png")
                    ),

                    Text("Chif Sam's..."),
                    Text("Chif Sam's..."),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  _getBottomNavBar() => BottomNavigationBar(
        items: _items,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepOrange,
        type: BottomNavigationBarType.fixed,
      );

  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: "Search"),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.square_grid_2x2), label: "Category"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: "History"),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.archivebox), label: "Inbox"),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person), label: "Profile"),
  ];
}
