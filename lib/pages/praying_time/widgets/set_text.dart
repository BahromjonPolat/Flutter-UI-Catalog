import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color _teal = Colors.teal;
const Color _grey = Colors.grey;
const Color _black = Colors.black;
const Color _white = Colors.white;
const Color _orange = Colors.orange;

setBoldText(String text, Color color, double size) => Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );

setLightText(String text, Color color, double size) => Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );

IconButton setIconButton(IconData iconData, {Color color,VoidCallback onPressed}) => IconButton(
      onPressed: onPressed ?? (){},
      icon: Icon(
        iconData,
        color: color ?? _white,
      ),
    );

setTimeAndLocation(IconData iconData, String title, String data) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(iconData, color: _orange, size: 21.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setLightText(title, _grey, 13.0),
            setBoldText(data, _black, 16.0),
          ],
        ),
      ],
    );

BorderRadius setBorderRadius({double radius}) =>
    BorderRadius.circular(radius ?? 16.0);
