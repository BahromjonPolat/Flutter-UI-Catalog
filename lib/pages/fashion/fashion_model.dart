
class Fashion {
  String _author;
  String _description;
  String _profileImage;
  List<String> _tags;
  List<String> _images;

  Fashion(this._author, this._description, this._profileImage, this._tags,
      this._images);

  List<String> get images => _images;

  List<String> get tags => _tags;

  String get profileImage => _profileImage;

  String get description => _description;

  String get author => _author;
}