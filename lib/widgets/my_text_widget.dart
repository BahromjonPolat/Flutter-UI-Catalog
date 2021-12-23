import 'package:flutter/material.dart';
import 'package:flutter_ui/components/exporting_packages.dart';

class MyTextWidget extends StatelessWidget {
  String data;
  Color color;
  double size;
  FontWeight weight;
  int lines;
  String family;
  TextAlign align;

  MyTextWidget(
    this.data, {
    Key? key,
    this.color = Colors.black,
    this.size = 14.0,
    this.weight = FontWeight.w500,
    this.lines = 1,
    this.family = 'SfPro',
    this.align = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      textAlign: align,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(size),
        fontWeight: weight,
        color: color,
        fontFamily: family,
      ),
    );
  }
}
