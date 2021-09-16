
class Water {
  String _name;
  double _price;
  double _litre;
  String _imageUrl;

  Water(this._name, this._price, this._litre ,this._imageUrl);

  double get litre => _litre;

  double get price => _price;

  String get name => _name;

  String get imageUrl => _imageUrl;
}