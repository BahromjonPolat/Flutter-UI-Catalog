class UserModel {
  int _id;
  String _name;
  String _email;
  String _password;

  UserModel(this._id, this._name, this._email, this._password);

  String get password => _password;

  String get email => _email;

  String get name => _name;

  int get id => _id;
}