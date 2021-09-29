
class Expense {
  String _name;
  double _money;
  String _imageUrl;
  String _date;

  Expense(this._name, this._money, this._imageUrl, this._date);

  String get date => _date;

  String get imageUrl => _imageUrl;

  double get money => _money;

  String get name => _name;
}