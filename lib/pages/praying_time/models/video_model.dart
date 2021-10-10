class VideoModel {
  String _title;
  String _subtitle;
  String _thumbnailUrl;
  String _duration;

  VideoModel(this._title, this._subtitle, this._thumbnailUrl, this._duration);

  String get duration => _duration;

  String get thumbnailUrl => _thumbnailUrl;

  String get subtitle => _subtitle;

  String get title => _title;
}