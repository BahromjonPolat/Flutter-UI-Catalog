class Coffee {

  String _name;
  String _component;
  String _description;
  String _imageUrl;
  double _price;
  double _rating;

  Coffee(this._name, this._component, this._description, this._imageUrl, this._price, this._rating);

  double get price => _price;

  String get imageUrl => _imageUrl;

  String get description => _description;

  String get name => _name;

  double get rating => _rating;

  String get component => _component;
}