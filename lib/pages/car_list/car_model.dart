class CarApiModel {
  int _year;
  int _id;
  int _horsepower;
  String _make;
  String _model;
  int _price;
  String _imgUrl;

  int get year => _year;

  int get id => _id;

  int get horsepower => _horsepower;

  String get make => _make;

  String get model => _model;

  int get price => _price;

  String get imgUrl => _imgUrl;

  CarApiModel.fromJson(Map<String, dynamic> json) {
    _year = json['year'];
    _id = json['id'];
    _horsepower = json['horsepower'];
    _make = json['make'];
    _model = json['model'];
    _price = json['price'];
    _imgUrl = json['img_url'];
  }
}
