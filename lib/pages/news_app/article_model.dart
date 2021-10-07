class Article {
  Source _source;
  String _author;
  String _title;
  String _description;
  String _url;
  String _urlToImage;
  String _publishedAt;
  String _content;

  Source get source => _source;

  String get author => _author;

  String get title => _title;

  String get description => _description;

  String get url => _url;

  String get urlToImage => _urlToImage;

  String get publishedAt => _publishedAt;

  String get content => _content;

  Article.fromJson(Map<String, dynamic> json) {
    _source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }
}

class Source {
  String _id;
  String _name;

  Source({String id, String name}) {
    this._id = id;
    this._name = name;
  }

  String get id => _id;

  String get name => _name;

  Source.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }
}
