
class Room {
  String _title;
  String _hotelName;
  String _description;
  String _additional;
  String _imageUrl;
  double _price;
  double _rating;

  Room(this._title, this._hotelName, this._description, this._additional,
     this._imageUrl, this._price, this._rating);

  double get rating => _rating;

  double get price => _price;

  String get additional => _additional;

  String get description => _description;

  String get hotelName => _hotelName;

  String get title => _title;

  String get imageUrl => _imageUrl;
}