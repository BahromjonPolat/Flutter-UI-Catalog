class HotelModel {

  String _name;
  String _imageUrl;
  double _price;
  double _rating;

  HotelModel(this._name, this._imageUrl, this._price, this._rating);

  double get rating => _rating;

  double get price => _price;

  String get imageUrl => _imageUrl;

  String get name => _name;
}