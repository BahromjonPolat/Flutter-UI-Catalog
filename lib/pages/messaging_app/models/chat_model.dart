
class ChatModel {
  String _name;
  String _message;
  String _imageUrl;
  String _date;

  ChatModel(this._name, this._message, this._imageUrl, this._date);

  String get date => _date;

  String get imageUrl => _imageUrl;

  String get message => _message;

  String get name => _name;
}