import 'package:flutter_ui/pages/praying_time/models/time_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<PrayingTime>> _getTime() async {
  Uri url = Uri.parse(
      "http://api.aladhan.com/v1/calendarByCity?city=Tashkent&country=Uzbekistan&method=2&month=10&year=2021");
  var response = await http.get(url);

  List<PrayingTime> times = (jsonDecode(response.body)['data'] as List)
      .map((e) => PrayingTime.fromJson(e))
      .toList();
  return times;
}

Future<List<PrayingTime>> get getPrayerTimes => _getTime();

int _today = DateTime.now().day - 1;
int get getToday => _today;