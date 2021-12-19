import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/hotel/components/hotel_images.dart';
import 'package:flutter_ui/components/exporting_packages.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration(),
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(50.0),
        left: getProportionateScreenWidth(20.0),
        right: getProportionateScreenWidth(20.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10.0),
        vertical: getProportionateScreenHeight(10.0),
      ),
      height: getProportionateScreenHeight(250.0),
      child: Row(
        children: [
          _setProfileImage(),
          SizedBox(width: getProportionateScreenWidth(10.0)),
          _setRightSideInfo(),
        ],
      ),
    );
  }

  Expanded _setRightSideInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(
            "Bahrom\nPo'lat",
            color: ConstColor.textColor,
            size: 41.0,
            lines: 2,
          ),
          SizedBox(height: getProportionateScreenHeight(14.0)),
          _setAccountInfo('Email', 'bahromjon.ergashboyev@gmail.com'),
          SizedBox(height: getProportionateScreenHeight(14.0)),
          _setAccountInfo('Date of birth', 'June, 18, 1994'),
          SizedBox(height: getProportionateScreenHeight(14.0)),
          _setAccountInfo('Address', 'Tashkent district, Tashkent'),
        ],
      ),
    );
  }

  ClipRRect _setProfileImage() => ClipRRect(
        borderRadius: _setBorderRadius(),
        child: Image.network(
          HotelImageUlr.room1,
          fit: BoxFit.cover,
          height: getProportionateScreenHeight(250.0),
          width: getProportionateScreenWidth(154.0),
        ),
      );

  _setAccountInfo(String title, String data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(title, color: ConstColor.lightGrey, size: 9.0),
          MyTextWidget(data, color: ConstColor.textColor),
        ],
      );

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: _setBorderRadius(),
      color: Colors.white,
    );
  }

  BorderRadius _setBorderRadius() => BorderRadius.circular(
        getProportionateScreenWidth(20.0),
      );
}
