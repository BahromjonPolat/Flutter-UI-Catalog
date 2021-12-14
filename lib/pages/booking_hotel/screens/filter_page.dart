import 'package:flutter/material.dart';

class BookingHotelFilterPage extends StatefulWidget {
  @override
  _BookingHotelFilterPageState createState() => _BookingHotelFilterPageState();
}

class _BookingHotelFilterPageState extends State<BookingHotelFilterPage> {
  Color _white = Colors.white;
  Color _black = Colors.black;
  Color _green = Colors.green;
  Color _deepOrange = Colors.deepOrange;
  Color _grey = Colors.grey;

  late Size _size;
  RangeValues _rangeValues = RangeValues(1000.0, 2000.0);

  List<bool> _isChecked = [true, false, false];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _white,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
        backgroundColor: _white,
        elevation: 6.0,
        iconTheme: IconThemeData(color: _black),
        title: _setTitle("Filter"),
        actions: [TextButton(onPressed: () {}, child: _setTitle("CLEAR"))],
      );

  Column _getBody() => Column(
        children: [
          _selectPrice(),
          _setDivider(6.0),
          _setCheckBox("Free Breakfast", 0),
          _setDivider(1.0),
          _setCheckBox("Free WiFi", 1),
          _setDivider(6.0),
          _setCheckBox("Sunrise check-in", 2),
          _setDivider(6.0),
          _setUserRating(),
          _setDivider(6.0),
          _showOtherFacilities(),
          _setDivider(6.0),
          _applyChanges(),
        ],
      );

  CheckboxListTile _setCheckBox(String title, int index) => CheckboxListTile(
        value: _isChecked[index],
        checkColor: _green,
        activeColor: _white,
        title: _setTitle(title),
        onChanged: (value) {
          _isChecked[index] = !_isChecked[index];
          setState(() {});
        },
      );

  _setUserRating() => SizedBox(
        width: _size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _setTitle("USER RATING"),
              Wrap(
                spacing: 24.0,
                children: [
                  _chooseRaging("3", 0),
                  _chooseRaging("4", 1),
                  _chooseRaging("5", 2),
                ],
              )
            ],
          ),
        ),
      );

  OutlinedButton _chooseRaging(String title, int index) => OutlinedButton(
        onPressed: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: _setTitle("⭐️ $title"),
        style: ElevatedButton.styleFrom(
            primary: _currentIndex == index ? _deepOrange : _white),
      );

  _selectPrice() => SizedBox(
        height: _size.height * 0.18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: _setTitle("\$ Price"),
            ),
            RangeSlider(
                activeColor: _deepOrange,
                inactiveColor: _grey,
                min: 500.0,
                max: 3000.0,
                divisions: 20,
                values: _rangeValues,
                onChanged: (values) {
                  setState(() {
                    _rangeValues = values;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _setPrice(_rangeValues.start),
                _setPrice(_rangeValues.end),
              ],
            ),
          ],
        ),
      );

  Container _setPrice(double price) => Container(
        height: 32.0,
        width: _size.width * 0.4,
        color: _grey,
        alignment: Alignment.center,
        child: _setTitle("\$${price.toStringAsFixed(1)}"),
      );

  ListTile _showOtherFacilities() => ListTile(
        title: _setTitle("Other Facilities"),
        subtitle: _setTitle("Parking, Pool, Bar"),
        trailing: Icon(Icons.arrow_forward_ios),
      );

  Padding _applyChanges() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 32.0),
    child: ElevatedButton(
          onPressed: () {},
          child: Text("APPLY"),
          style: ElevatedButton.styleFrom(
            primary: _deepOrange,
            fixedSize: Size(_size.width * 0.48, 48.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),

          ),
        ),
  );

  Text _setTitle(String title) => Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: _black),
      );

  Divider _setDivider(double thickness) => Divider(thickness: thickness);
}
