class CoffeeModel {

  String _name;
  String _description;
  String _imageUrl;
  double _price;

  CoffeeModel(this._name,this._description, this._imageUrl, this._price);

  double get price => _price;

  String get imageUrl => _imageUrl;

  String get description => _description;

  String get name => _name;
}