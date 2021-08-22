class Book {
  String _title;
  String _author;
  String _imageUrl;
  Book(this._title, this._author, this._imageUrl);

  String get imageUrl => _imageUrl;

  String get author => _author;

  String get title => _title;
}