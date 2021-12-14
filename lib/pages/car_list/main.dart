import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/car_list/car_model.dart';
import 'package:flutter_ui/pages/car_list/details_page.dart';
import 'package:http/http.dart' as http;

class CarListMainPage extends StatelessWidget {
  static const Color _black = Colors.black;
  static const Color _white = Colors.white;
  static const Color _grey = Colors.grey;
  static Color _lightGrey = Colors.grey.shade300;
  late double _height;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _showAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _showAppBar() => AppBar(
        title: Text("AUDI"),
      );

  _buildBody() => FutureBuilder(
      future: _getCarData(),
      builder: (context, AsyncSnapshot<List<CarApiModel>> snap) {
        print(snap.hasData);
        return snap.hasData
            ? ListView.builder(itemBuilder: (context, index) {
                CarApiModel car = snap.data![index];
                return Hero(
                  tag: "dash",
                  child: InkWell(
                    onTap: ()
                    {

                      Navigator.push(context, MaterialPageRoute(builder: (_)=> CarListDetailsPage(car)));
                    },
                    child: Container(
                      height: _height * 0.22,
                      color: (index % 2 == 0) ? _white : _lightGrey,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(car.model),
                                Text(car.make),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Image.network(car.imgUrl,

                            fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
            : Center(
                child: CupertinoActivityIndicator(radius: 24.0),
              );
      });

  Future<List<CarApiModel>> _getCarData() async {
    Uri url = Uri.parse(
        "https://private-anon-4ef747164d-carsapi1.apiary-mock.com/cars");
    var carList = await http.get(url);
    print(carList.body);
    return (jsonDecode(carList.body) as List)
        .map((e) => CarApiModel.fromJson(e))
        .toList();
  }
}
