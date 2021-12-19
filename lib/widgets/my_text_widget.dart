import 'package:flutter/material.dart';
import 'package:flutter_ui/components/exporting_packages.dart';

class MyTextWidget extends StatelessWidget {
  String data;
  Color color;
  double size;
  FontWeight weight;

  MyTextWidget(
    this.data, {
    Key? key,
    this.color = Colors.black,
    this.size = 14.0,
    this.weight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(size),
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
