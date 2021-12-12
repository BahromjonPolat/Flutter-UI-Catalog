import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/picsum/pic_model.dart';
import 'package:http/http.dart' as http;

class PicListMain extends StatelessWidget {
  static Color _yellow = Colors.yellow.shade600;
  static const Color _black = Colors.black;
  static const Color _white = Colors.white;
  static const Color _transparent = Colors.transparent;
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _yellow,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getBody() => FutureBuilder(
      future: _getPicList(),
      builder: (context, AsyncSnapshot<List<Picsum>> snap) {
        return (snap.hasData)
            ? ListView.builder(itemBuilder: (context, index) {
                Picsum picsum = snap.data[index];
                return Container(
                  height: _height * 0.15,
                  width: _width,
                  child: Stack(
                    children: [
                      Card(
                        margin: EdgeInsets.only(left: 32.0, right: 32.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          contentPadding: EdgeInsets.all(12.0),
                          tileColor: _white,
                          title: _setSimpleText(
                            picsum.author,
                            weight: FontWeight.bold,
                            color: _black,
                          ),
                          leading: SizedBox(),
                          subtitle: _setSimpleText(picsum.url,
                              weight: FontWeight.normal, color: _black),
                          trailing: _setIconButton(Icons.settings_outlined),
                        ),
                      ),
                      Positioned(
                          bottom: 12.0,
                          left: 12,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(picsum.downloadUrl),
                            radius: 32.0,
                          ))
                    ],
                  ),
                );
              })
            : Center(
                child: CupertinoActivityIndicator(
                  radius: 24.0,
                ),
              );
      });

  AppBar _getAppBar() => AppBar(
        title: _setSimpleText("PICTURE", weight: FontWeight.bold),
        backgroundColor: _yellow,
        elevation: 0.0,
        leading: _setIconButton(Icons.notes_rounded),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        actions: [_setIconButton(Icons.arrow_right_alt_outlined)],
      );

  Text _setSimpleText(
    String text, {
    double size,
    Color color,
    FontWeight weight,
  }) =>
      Text(
        text,
        style: TextStyle(
          fontSize: size ?? 14,
          color: color ?? Colors.white,
          fontWeight: weight ?? FontStyle.normal,
        ),
      );

  IconButton _setIconButton(IconData iconData) => IconButton(
        onPressed: () {},
        icon: Icon(iconData),
      );

  Future<List<Picsum>> _getPicList() async {
    Uri url = Uri.parse("https://picsum.photos/v2/list?page=2&limit=100");
    var picList = await http.get(url);
    return (jsonDecode(picList.body) as List)
        .map((e) => Picsum.fromJson(e))
        .toList();
  }
}
