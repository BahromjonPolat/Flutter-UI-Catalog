class Food {
  String _name;
  String _subtitle;
  String _imageUrl;
  double _price;

  Food(this._name, this._subtitle, this._imageUrl, this._price);

  double get price => _price;

  String get imageUrl => _imageUrl;

  String get subtitle => _subtitle;

  String get name => _name;
}