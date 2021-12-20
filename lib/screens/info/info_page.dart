import 'package:flutter/material.dart';
import 'package:flutter_ui/components/colors.dart';
import 'package:flutter_ui/components/size_config.dart';
import 'package:flutter_ui/screens/info/components/footer.dart';
import 'package:flutter_ui/screens/info/components/header_info.dart';
import 'package:flutter_ui/screens/info/components/tab_bar.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ConstColor.primary,
      body: Padding(
        padding: EdgeInsets.only(
          top: getProportionateScreenHeight(50.0),
          left: getProportionateScreenWidth(20.0),
          right: getProportionateScreenWidth(20.0)

        ),
        child: Column(
          children: [
            HeaderInfo(),
            SizedBox(height: getProportionateScreenHeight(20.0)),
            ProfilePageTabBar(),
            InfoPageFooter(),
          ],
        ),
      ),
    );
  }
}
