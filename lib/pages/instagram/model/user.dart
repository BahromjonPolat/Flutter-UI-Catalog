
class User {
  int _id;
  String _username;
  String _email;
  String _password;
  String _name;
  String _imageUrl;

  User(this._id, this._username, this._name, this._imageUrl, this._email,this._password);

  String get imageUrl => _imageUrl;

  String get name => _name;

  String get password => _password;

  String get email => _email;

  String get username => _username;

  int get id => _id;
}