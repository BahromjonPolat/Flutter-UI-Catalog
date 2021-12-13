import 'package:flutter/material.dart';
import 'package:flutter_ui/components/colors.dart';
import 'package:flutter_ui/components/size_config.dart';
import 'package:flutter_ui/pages/hotel/components/hotel_images.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration(),
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(50.0),
        left: getProportionateScreenWidth(20.0),
        right: getProportionateScreenWidth(20.0),
      ),
      height: getProportionateScreenHeight(250.0),
      child: Row(
        children: [
          _setProfileImage(),
          Column(
            children: [
              Text(
                "Bahromjon\nPo'lat",
                style: TextStyle(
                  color: ConstColor.textColor,
                  fontSize: getProportionateScreenWidth(32.0),
                  fontFamily: "SfPro"
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: _setBorderRadius(),
      color: Colors.white,
    );
  }

  Padding _setProfileImage() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10.0),
          vertical: getProportionateScreenHeight(10.0),
        ),
        child: ClipRRect(
          borderRadius: _setBorderRadius(),
          child: Image.network(
            HotelImageUlr.room1,
            fit: BoxFit.cover,
            height: getProportionateScreenHeight(250.0),
            width: getProportionateScreenWidth(154.0),
          ),
        ),
      );

  BorderRadius _setBorderRadius() => BorderRadius.circular(
        getProportionateScreenWidth(20.0),
      );
}
