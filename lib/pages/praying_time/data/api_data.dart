import 'package:flutter_ui/pages/praying_time/models/time_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<PrayingTime>> _getTime() async {
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  final apiLink =
      "http://api.aladhan.com/v1/calendarByCity?city=Tashkent&country=Uzbekistan&method=2&month=$month&year=$year";
  Uri url = Uri.parse(apiLink);
  var response = await http.get(url);

  List<PrayingTime> times = (jsonDecode(response.body)['data'] as List)
      .map((e) => PrayingTime.fromJson(e))
      .toList();
  return times;
}

Future<List<PrayingTime>> get getPrayerTimes => _getTime();

int _today = DateTime.now().day - 1;

int get getToday => _today;
