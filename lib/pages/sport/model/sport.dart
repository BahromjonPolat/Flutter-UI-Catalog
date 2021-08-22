
import 'package:flutter/material.dart';

class Sport {
  String title;
  String imageUrl;
  MaterialColor color;

  Sport(this.title, this.color, this.imageUrl);
}

List<Sport> getSport() {
  List<Sport> sports = [];
  sports.add(new Sport("Swimming", Colors.indigo, "assets/images/sport/swimming.png"));
  sports.add(new Sport("Running", Colors.orange, "assets/images/sport/running.png"));
  sports.add(new Sport("Football", Colors.red, "assets/images/sport/football.png"));
  sports.add(new Sport("Basketball", Colors.blue, "assets/images/sport/basketball.png"));
  sports.add(new Sport("Cycling", Colors.blueGrey, "assets/images/sport/cycling.png"));
  sports.add(new Sport("Baseball", Colors.deepOrange, "assets/images/sport/baseball.png"));
  sports.add(new Sport("Tennis", Colors.green, "assets/images/sport/tennis.png"));
  sports.add(new Sport("Taekwondo", Colors.grey, "assets/images/sport/karate2.png"));
  sports.add(new Sport("Karate", Colors.pink, "assets/images/sport/karate.png"));
  sports.add(new Sport("Boxing", Colors.deepOrange, "assets/images/sport/boxer.png"));

  return sports;
}