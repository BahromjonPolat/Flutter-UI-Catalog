import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/car_list/car_model.dart';

class CarListDetailsPage extends StatelessWidget {
  CarApiModel car;

  CarListDetailsPage(this.car);

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
        title: Text(car.make),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today))
        ],
      );

  Column _buildBody() => Column(
        children: [
          Hero(
            tag: "dash",
            child: Image.network(
              car.imgUrl,
              height: _height * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height:  _height * 0.2,
            child: Row(
              children: [
                _setCarInfo("PRICE", car.price.toString()),
                VerticalDivider(),
                _setCarInfo("HORSE POWER", car.horsepower.toString()),
              ],
            ),
          ),
          Divider(),
        ],
      );

  _setCarInfo(String title, String data) => Column(
    children: [
      Text(title),
      Text(data, style: TextStyle(
        fontSize: 32.0,

      ),),
    ],
  );
}
