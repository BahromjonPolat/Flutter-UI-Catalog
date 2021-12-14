class PrayingTime {
  Timings? _timings;
  Date ?_date;
  Meta ?_meta;

  Timings get timings => _timings!;

  Date get date => _date!;

  Meta get meta => _meta!;

  PrayingTime.fromJson(Map<String, dynamic> json) {
    _timings =
        json['timings'] != null ? new Timings.fromJson(json['timings']) : null;
    _date = json['date'] != null ? new Date.fromJson(json['date']) : null;
    _meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }
}

class Timings {
  String ?_fajr;
  String ?_sunrise;
  String ?_dhuhr;
  String ?_asr;
  String ?_sunset;
  String ?_maghrib;
  String ?_isha;
  String ?_imsak;
  String ?_midnight;

  String get fajr => _fajr!;

  String get sunrise => _sunrise!;

  String get dhuhr => _dhuhr!;

  String get asr => _asr!;

  String get sunset => _sunset!;

  String get maghrib => _maghrib!;

  String get isha => _isha!;

  String get imsak => _imsak!;

  String get midnight => _midnight!;

  Timings.fromJson(Map<String, dynamic> json) {
    _fajr = json['Fajr'];
    _sunrise = json['Sunrise'];
    _dhuhr = json['Dhuhr'];
    _asr = json['Asr'];
    _sunset = json['Sunset'];
    _maghrib = json['Maghrib'];
    _isha = json['Isha'];
    _imsak = json['Imsak'];
    _midnight = json['Midnight'];
  }
}

class Date {
  String? _readable;
  String? _timestamp;
  Gregorian? _gregorian;
  Hijri? _hijri;

  Date({String? readable, String? timestamp, Gregorian ?gregorian, Hijri? hijri}) {
    this._readable = readable;
    this._timestamp = timestamp;
    this._gregorian = gregorian;
    this._hijri = hijri;
  }

  String get readable => _readable!;

  String get timestamp => _timestamp!;

  Gregorian get gregorian => _gregorian!;

  Hijri get hijri => _hijri!;

  Date.fromJson(Map<String, dynamic> json) {
    _readable = json['readable'];
    _timestamp = json['timestamp'];
    _gregorian = json['gregorian'] != null
        ? new Gregorian.fromJson(json['gregorian'])
        : null;
    _hijri = json['hijri'] != null ? new Hijri.fromJson(json['hijri']) : null;
  }
}

class Gregorian {
  String?_date;
  String ?_format;
  String? _day;
  Weekday ?_weekday;
  Month? _month;
  String ?_year;
  Designation? _designation;

  Gregorian({
    String? date,
    String ?format,
    String? day,
    Weekday? weekday,
    Month? month,
    String ?year,
    Designation? designation,
  }) {
    this._date = date;
    this._format = format;
    this._day = day;
    this._weekday = weekday;
    this._month = month;
    this._year = year;
    this._designation = designation;
  }

  String get date => _date!;

  String get format => _format!;

  String get day => _day!;

  Weekday get weekday => _weekday!;

  Month get month => _month!;

  String get year => _year!;

  Designation get designation => _designation!;

  Gregorian.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    _format = json['format'];
    _day = json['day'];
    _weekday =
        json['weekday'] != null ? new Weekday.fromJson(json['weekday']) : null;
    _month = json['month'] != null ? new Month.fromJson(json['month']) : null;
    _year = json['year'];
    _designation = json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null;
  }
}

class Designation {
  String? _abbreviated;
  String? _expanded;

  Designation({String? abbreviated, String? expanded}) {
    this._abbreviated = abbreviated;
    this._expanded = expanded;
  }

  String get abbreviated => _abbreviated!;

  String get expanded => _expanded!;

  Designation.fromJson(Map<String, dynamic> json) {
    _abbreviated = json['abbreviated'];
    _expanded = json['expanded'];
  }
}

class Hijri {
  String? _date;
  String? _format;
  String? _day;
  Weekday? _weekday;
  Month? _month;
  String? _year;
  Designation? _designation;
  List<Null>? _holidays;

  String get date => _date!;

  String get format => _format!;

  String get day => _day!;

  Weekday get weekday => _weekday!;

  Month get month => _month!;

  String get year => _year!;

  Designation get designation => _designation!;

  List<Null> get holidays => _holidays!;

  Hijri.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    _format = json['format'];
    _day = json['day'];
    _weekday =
        json['weekday'] != null ? new Weekday.fromJson(json['weekday']) : null;
    _month = json['month'] != null ? new Month.fromJson(json['month']) : null;
    _year = json['year'];
    _designation = json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null;
  }
}

class Weekday {
  String? _en;
  String? _ar;

  String get en => _en!;

  String get ar => _ar!;

  Weekday.fromJson(Map<String, dynamic> json) {
    _en = json['en'];
    _ar = json['ar'];
  }
}

class Month {
  int? _number;
  String? _en;
  String? _ar;

  int get number => _number!;

  String get en => _en!;

  String get ar => _ar!;

  Month.fromJson(Map<String, dynamic> json) {
    _number = json['number'];
    _en = json['en'];
    _ar = json['ar'];
  }
}

class Meta {
  double? _latitude;
  double? _longitude;
  String? _timezone;
  Method? _method;
  String? _latitudeAdjustmentMethod;
  String? _midnightMode;
  String? _school;
  OffsetModel? _offset;

  Meta({
    double? latitude,
    double? longitude,
    String? timezone,
    Method? method,
    String? latitudeAdjustmentMethod,
    String? midnightMode,
    String? school,
    OffsetModel? offset,
  }) {
    this._latitude = latitude!;
    this._longitude = longitude!;
    this._timezone = timezone!;
    this._method = method!;
    this._latitudeAdjustmentMethod = latitudeAdjustmentMethod!;
    this._midnightMode = midnightMode!;
    this._school = school!;
    this._offset = offset!;
  }

  double get latitude => _latitude!;

  double get longitude => _longitude!;

  String get timezone => _timezone!;

  Method get method => _method!;

  String get latitudeAdjustmentMethod => _latitudeAdjustmentMethod!;

  String get midnightMode => _midnightMode!;

  String get school => _school!;

  OffsetModel get offset => _offset!;

  Meta.fromJson(Map<String, dynamic> json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _timezone = json['timezone'];
    _method =
        json['method'] != null ? new Method.fromJson(json['method']) : null;
    _latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    _midnightMode = json['midnightMode'];
    _school = json['school'];
    _offset = json['offset'] != null
        ? new OffsetModel.fromJson(json['offset'])
        : null;
  }
}

class Method {
  int? _id;
  String? _name;
  Params? _params;
  Location? _location;

  Method({int? id, String? name, Params? params, Location? location}) {
    this._id = id;
    this._name = name;
    this._params = params;
    this._location = location;
  }

  int get id => _id!;

  String get name => _name!;

  Params get params => _params!;

  Location get location => _location!;

  Method.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _params =
        json['params'] != null ? new Params.fromJson(json['params']) : null;
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }
}

class Params {
  int? _fajr;
  int? _isha;

  int get fajr => _fajr!;

  int get isha => _isha!;

  Params.fromJson(Map<String, dynamic> json) {
    _fajr = json['Fajr'];
    _isha = json['Isha'];
  }
}

class Location {
  double? _latitude;
  double? _longitude;

  double get latitude => _latitude!;

  double get longitude => _longitude!;

  Location.fromJson(Map<String, dynamic> json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
}

class OffsetModel {
  int? _imsak;
  int? _fajr;
  int? _sunrise;
  int? _dhuhr;
  int? _asr;
  int? _maghrib;
  int? _sunset;
  int? _isha;
  int? _midnight;

  int get imsak => _imsak!;

  int get fajr => _fajr!;

  int get sunrise => _sunrise!;

  int get dhuhr => _dhuhr!;

  int get asr => _asr!;

  int get maghrib => _maghrib!;

  int get sunset => _sunset!;

  int get isha => _isha!;

  int get midnight => _midnight!;

  OffsetModel.fromJson(Map<String, dynamic> json) {
    _imsak = json['Imsak'];
    _fajr = json['Fajr'];
    _sunrise = json['Sunrise'];
    _dhuhr = json['Dhuhr'];
    _asr = json['Asr'];
    _maghrib = json['Maghrib'];
    _sunset = json['Sunset'];
    _isha = json['Isha'];
    _midnight = json['Midnight'];
  }
}
