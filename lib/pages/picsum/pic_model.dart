class Picsum {
  String? _id;
  String? _author;
  int? _width;
  int ?_height;
  String ?_url;
  String ?_downloadUrl;

  String get id => _id!;

  String get author => _author!;

  int get width => _width!;

  int get height => _height!;

  String get url => _url!;

  String get downloadUrl => _downloadUrl!;

  Picsum.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _author = json['author'];
    _width = json['width'];
    _height = json['height'];
    _url = json['url'];
    _downloadUrl = json['download_url'];
  }
}
