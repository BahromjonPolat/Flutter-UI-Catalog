import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/components/exporting_packages.dart';
import 'package:flutter_ui/provider/profile_tab_bar_provider.dart';

class InfoPageFooter extends StatelessWidget {
  InfoPageFooter({Key? key}) : super(key: key);

  late ProfileTabProvider _tabProvider;

  @override
  Widget build(BuildContext context) {
    _tabProvider = context.watch();
    return _tabProvider.index == 0 ? _showAbout() : _showWorks();
  }

  Column _showAbout() => Column(
        children: [
          _setBio(),
          _showOnTheWeb(),
          _showContactInfo(),
        ],
      );

  Padding _showWorks() => Padding(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(21.0)),
        child: Wrap(
          spacing: getProportionateScreenWidth(19.0),
          runSpacing: getProportionateScreenHeight(19.0),
          children: [
            _setWorkInfo('Projects\nDone', '5'),
            _setWorkInfo('Success rate', '92%'),
            _setWorkInfo('Teams', '3'),
            _setWorkInfo('Client\nreports', '45'),
          ],
        ),
      );

  Container _setBio() => Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(19.0),
        ),
        padding: _setContentPadding(),
        decoration: _boxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setTitle('BIO'),
            SizedBox(height: getProportionateScreenHeight(10.0)),
            MyTextWidget(
              _lorem,
              weight: FontWeight.w500,
              lines: 10,
              color: ConstColor.lightGrey,
            ),
          ],
        ),
      );

  MyTextWidget _setTitle(String title) {
    return MyTextWidget(
      title,
      color: ConstColor.textColor,
      weight: FontWeight.w600,
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(14.0)));
  }

  Container _showOnTheWeb() => Container(
        decoration: _boxDecoration(),
        height: getProportionateScreenHeight(91.0),
        width: double.infinity,
        padding: _setContentPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setTitle('ON THE WEB'),
            SizedBox(height: getProportionateScreenHeight(10.0)),
            Wrap(
              spacing: getProportionateScreenWidth(19.0),
              children: [
                _setIcon(AssetIcon.linkedIn),
                _setIcon(AssetIcon.facebook),
                _setIcon(AssetIcon.twitter),
                _setIcon(AssetIcon.instagram),
              ],
            ),
          ],
        ),
      );

  Container _showContactInfo() => Container(
        padding: _setContentPadding(),
        decoration: _boxDecoration(),
        margin: EdgeInsets.only(top: getProportionateScreenHeight(19.0)),
        child: Column(
          children: [
            _setData('WEBSITE', 'itjunior.uz'),
            SizedBox(height: getProportionateScreenHeight(22.0)),
            _setData('PHONE', '+998 93 188 13 33'),
          ],
        ),
      );

  Row _setData(String title, String data) => Row(
        children: [
          Expanded(child: _setTitle(title)),
          Expanded(
            child: MyTextWidget(
              data,
              color: ConstColor.textColor,
              weight: FontWeight.w500,
              size: 17.0,
            ),
          ),
        ],
      );

  SvgPicture _setIcon(assetIcon) => SvgPicture.asset(assetIcon);

  EdgeInsets _setContentPadding() {
    return EdgeInsets.symmetric(
      vertical: getProportionateScreenHeight(15.0),
      horizontal: getProportionateScreenWidth(16.0),
    );
  }

  Container _setWorkInfo(String title, String data) => Container(
        width: getProportionateScreenWidth(158.0),
        height: getProportionateScreenHeight(183.0),
        decoration: _boxDecoration(),
        padding: _setContentPadding(),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextWidget(
              data,
              color: ConstColor.textColor,
              size: 58.0,
              weight: FontWeight.w500,
            ),
            MyTextWidget(
              title,
              size: 18.0,
              weight: FontWeight.w500,
              color: ConstColor.textColor,
              lines: 2,
              align: TextAlign.center,
            ),
          ],
        ),
      );

  final String _lorem =
      "Lorem ipsum dolor sit amet, consectetur adipi scing elit. Tortor turpis sodales nulla velit. Nunc cum vitae, rhoncus leo id. Volutpat  Duis tinunt pretium luctus pulvinar pretium.";
}
