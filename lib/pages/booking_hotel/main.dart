import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/pages/booking_hotel/city_list.dart';
import 'package:flutter_ui/pages/booking_hotel/city_model.dart';
import 'package:flutter_ui/pages/booking_hotel/filter_page.dart';
import 'package:flutter_ui/pages/booking_hotel/hotel_list.dart';
import 'package:flutter_ui/pages/booking_hotel/hotel_model.dart';

class BookingHotelMainPage extends StatefulWidget {
  @override
  _BookingHotelMainPageState createState() => _BookingHotelMainPageState();
}

class _BookingHotelMainPageState extends State<BookingHotelMainPage> {
  Size _size;
  Color _white = Colors.white;
  Color _black = Colors.black;
  Color _deepOrange = Colors.deepOrange;
  Color _grey = Colors.grey;
  Color _amber = Colors.amber;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      bottomNavigationBar: _getBottomNavigationBar(),
      body: _getHomePage(),
    );
  }

  /// HOMEPAGE APP BAR
  AppBar _getAppBar() => AppBar(
        iconTheme: IconThemeData(color: _black),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: _white,
        elevation: 12.0,
        leadingWidth: _size.width * 0.3,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Location",
              style: TextStyle(color: _grey),
            ),
            Text(
              "Your Location",
              style: TextStyle(color: _black, fontSize: 18.0),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BookingHotelFilterPage()));
              },
              icon: Icon(Icons.insights))
        ],
      );

  /// HOMEPAGE - BARCHA VIDJETLAR SHU YERGA JOYLANADI
  _getHomePage() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _showCities(),
          _setTitle("POPULAR DESTINATION"),
          _showPopulationHotelList(),
          _setHeight(24.0),
          _setTitle("NEW HOTEL"),
          _showNewHotels(),
          _setHeight(32.0),
        ],
      );

  /// SIZED BOX
  SizedBox _setHeight(double size) => SizedBox(
        height: size,
      );

  /// CITY LIST
  SizedBox _showCities() => SizedBox(
        height: _size.height * 0.15,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            scrollDirection: Axis.horizontal,
            itemCount: cityList.length,
            itemBuilder: (context, index) {
              City city = cityList[index];
              return _showCityImage(city);
            }),
      );

  /// CITY LAYOUT
  _showCityImage(City city) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
            ),
            child: ClipRRect(
              borderRadius: _getBorderRadius(),
              child: Image.network(
                city.imageUrl,
                fit: BoxFit.cover,
                height: _size.width * 0.18,
                width: _size.width * 0.23,
              ),
            ),
          ),
          Text(
            city.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      );

  /// POPULAR DESTINATION LIST
  SizedBox _showPopulationHotelList() => SizedBox(
        height: _size.height * 0.2,
        child: ListView.builder(
            itemCount: populationHotels.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            itemBuilder: (context, index) {
              HotelModel hotel = populationHotels[index];
              return _setPopularHotelInfo(hotel);
            }),
      );

  /// POPULAR DESTINATION LAYOUT
  Container _setPopularHotelInfo(HotelModel hotel) => Container(
        height: _size.height * 0.2,
        width: _size.width * 0.88,
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        padding: EdgeInsets.only(bottom: 8.0, top: 8.0, left: 12.0),
        decoration: _setBoxDecoration(hotel.imageUrl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _setPrice(hotel.price),
            _setHotelInfo(hotel),
          ],
        ),
      );

  /// NEW HOTEL LIST
  SizedBox _showNewHotels() => SizedBox(
        height: _size.width * 0.42,
        child: ListView.builder(
            itemCount: listNewHotel.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            itemBuilder: (context, index) {
              HotelModel hotel = listNewHotel[index];
              return _setNewHotel(hotel);
            }),
      );

  /// NEW HOTEL LAYOUT
  Container _setNewHotel(HotelModel hotel) => Container(
        width: _size.width * 0.36,
        height: _size.width * 0.4,
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: _setBoxDecoration(hotel.imageUrl),
        child: _setHotelInfo(hotel),
      );

  Container _setPrice(double price) => Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              bottomLeft: Radius.circular(32.0)),
          color: _deepOrange
        ),
    child: Text("\$$price\nPer Night", style: TextStyle(color: _white),),
      );

  /// Mehmonxonaning nomi va reytingini ko`rsatish uchun funksiya.
  Column _setHotelInfo(HotelModel hotel) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotel.name,
            style: TextStyle(
              color: _white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              RatingBar.builder(
                  itemSize: 12.0,
                  itemCount: 5,
                  ignoreGestures: true,
                  initialRating: hotel.rating,
                  allowHalfRating: true,
                  itemBuilder: (context, index) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (rating) {}),
              Text("(${hotel.rating})", style: TextStyle(color: _white),)
            ],
          ),


        ],
      );

  /// BOX DECORATION
  Decoration _setBoxDecoration(String imageUrl) => BoxDecoration(
      borderRadius: _getBorderRadius(),
      image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl)));

  /// BORDER RADIUS
  _getBorderRadius() => BorderRadius.circular(8.0);

  /// BOTTOM NAVIGATION BAR
  BottomNavigationBar _getBottomNavigationBar() => BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: _deepOrange,
        unselectedItemColor: _grey,
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBatItems,
      );

  /// BOTTOM NAVIGATION BAR ITEMS
  List<BottomNavigationBarItem> _bottomNavigationBatItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.briefcase_fill),
      label: "My Trip",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: "Notification",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Account",
    ),
  ];

  /// SARLAVHALARNI YOZISH UCHUN FUNKSIYA
  Padding _setTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      );
}
