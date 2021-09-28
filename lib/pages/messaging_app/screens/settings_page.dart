import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MessagingAppSettingsPage extends StatefulWidget {
  @override
  _MessagingAppSettingsPageState createState() =>
      _MessagingAppSettingsPageState();
}

class _MessagingAppSettingsPageState extends State<MessagingAppSettingsPage> {
  Color _blue = Color.fromARGB(255, 47, 128, 237);
  Color _grey = Colors.grey;
  Color _white = Colors.white;
  Color _black = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _getUserAccountHeader(),
          Divider(),
          _setSetting(
            CupertinoIcons.moon_fill,
            "Dark mode",
            _getSwitch(),
          ),
          _setSetting(
            CupertinoIcons.person_crop_square_fill,
            "Account",
            _getIcon(),
          ),
          _setSetting(
            CupertinoIcons.bell_fill,
            "Notification",
            _getIcon(),
          ),
          _setSetting(
            CupertinoIcons.chat_bubble_fill,
            "Chat settings",
            _getIcon(),
          ),
          _setSetting(
            CupertinoIcons.chart_pie_fill,
            "Data and storage",
            _getIcon(),
          ),
          _setSetting(
            CupertinoIcons.lock_fill,
            "Privacy and security",
            _getIcon(),
          ),
          _setSetting(
            CupertinoIcons.info_circle_fill,
            "About",
            SizedBox(),
          ),
        ],
      ),
    );
  }

  Row _getUserAccountHeader() => Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: CircleAvatar(
              radius: 36.0,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Adina Nurrahma",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                "Trust your feelings , be a good\n human beings",
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ],
      );

  ListTile _setSetting(IconData iconData, String title, Widget trailing) =>
      ListTile(
        leading: Icon(
          iconData,
          color: _blue,
        ),
        title: Text(title, style: TextStyle(fontSize: 14.0),),
        trailing: trailing,
        onTap: () {},
      );

  Switch _getSwitch() => Switch(
      inactiveTrackColor: Colors.grey.shade300,
      inactiveThumbColor: _grey,
      value: false,
      onChanged: (value) {});

  Icon _getIcon() => Icon(Icons.arrow_forward_ios_outlined, size: 11.4);
}
