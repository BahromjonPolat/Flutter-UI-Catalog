import 'package:flutter/material.dart';
import 'package:flutter_ui/components/colors.dart';
import 'package:flutter_ui/components/size_config.dart';
import 'package:flutter_ui/screens/info/components/header_info.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ConstColor.primary,
      body: Column(
        children: [
          HeaderInfo()
        ],
      ),
    );
  }

}
