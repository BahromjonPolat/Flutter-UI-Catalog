
class Chat {
  String _name;
  String _lastMessage;
  String _date;
  String _imageUrl;

  Chat(this._name, this._lastMessage, this._date, this._imageUrl);

  String get imageUrl => _imageUrl;

  String get date => _date;

  String get lastMessage => _lastMessage;

  String get name => _name;
}