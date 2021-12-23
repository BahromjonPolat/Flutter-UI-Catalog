class AppUser {
  late String _id;
  late String _name;
  late String _email;
  late String _password;
  late String _imageUrl;
  late String _role;
  late String _status;
  late DateTime _firstReg;
  late DateTime _lastAction;

  AppUser(
    this._id,
    this._name,
    this._email,
    this._password,
    this._imageUrl,
    this._role,
    this._status,
    this._firstReg,
    this._lastAction,
  );

  AppUser.fromJson(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _password = map['password'];
    _email = map['email'];
    _imageUrl = map['imageUrl'];
    _firstReg = map['firstReg'].toDate();
    _lastAction = map['lastAction'].toDate();
    _status = map['status'];
    _role = map['role'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'email': _email,
        'password': _password,
        'firstReg': _firstReg,
        'lastAction': _lastAction,
        'status': _status,
        'imageUrl': _imageUrl,
        'role': _role,
      };

  DateTime get lastAction => _lastAction;

  DateTime get firstReg => _firstReg;

  String get status => _status;

  String get role => _role;

  String get imageUrl => _imageUrl;

  String get password => _password;

  String get email => _email;

  String get name => _name;

  String get id => _id;
}
