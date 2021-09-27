import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Color _white = Colors.white;
Color _deepOrange = Colors.deepOrange;
BuildContext _context;
Size _size;

Column checkRoomPage(BuildContext context) {
  _context = context;
  _size = MediaQuery.of(context).size;
  return Column(
    children: [
      _searchCity(),
      _getTable(),
      _getButton(),
    ],
  );
}

Padding _searchCity() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: _setBorderRadius(32.0),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            hintText: "Where are you travelling?",
            suffixIcon: Icon(CupertinoIcons.search),
            border: _setBorder(),
            enabledBorder: _setBorder(),
            focusedBorder: _setBorder(),
          ),
        ),
      ),
    );

Wrap _getTable() => Wrap(
      children: [
        _setInfo(title: "check-in", number: 1, date: "JUN 2018", day: "Friday"),
        _setVerticalDivider(),
        _setInfo(title: "check-in", number: 4, day: "Friday", date: "JUN 2018"),
        _setDivider(),
        _setInfo(title: "rooms", number: 1),
        _setVerticalDivider(),
        _setInfo(title: "guests", number: 2),
      ],
    );

Divider _setDivider() => Divider(height: 1.0);

VerticalDivider _setVerticalDivider() => VerticalDivider(
      width: 1.5,
    );

Container _setInfo({
  String title,
  num number,
  String date,
  String day,
}) =>
    Container(
      width: _size.width * 0.49,
      color: _white,
      alignment: Alignment.center,
      height: _size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title.toUpperCase()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number.toString().padLeft(2, '0'),
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              (date != null)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(day),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );

Padding _getButton() => Padding(
  padding: const EdgeInsets.all(48.0),
  child:   ElevatedButton(
        onPressed: () {},
        child: Text("SEARCH"),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(100.0, 100.0),
          primary: _deepOrange,
          shape: RoundedRectangleBorder(borderRadius: _setBorderRadius(50.0)),
        ),
      ),
);

InputBorder _setBorder() => OutlineInputBorder(
      borderRadius: _setBorderRadius(32.0),
      borderSide: BorderSide(style: BorderStyle.none),
    );

BorderRadius _setBorderRadius(double radius) => BorderRadius.circular(radius);
