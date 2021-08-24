class Post {
  int _id;
  int _userId;
  String _imageUrl;
  String _body;

  Post(this._id,this._userId, this._imageUrl, this._body);

  String get body => _body;

  String get imageUrl => _imageUrl;

  int get userId => _userId;

  int get id => _id;
}