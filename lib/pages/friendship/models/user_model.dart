class User {
  final String _name;
  final String _email;
  final String _phone;
  final String _password;
  final String _imageUrl;

  User(this._name, this._email, this._phone, this._password, this._imageUrl);

  String get password => _password;

  String get phone => _phone;

  String get email => _email;

  String get name => _name;

  String get imageUrl => _imageUrl;
}
