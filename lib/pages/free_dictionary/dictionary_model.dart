class Dictionary {
  String _word;
  List<Phonetics> _phonetics;
  List<Meanings> _meanings;

  String get word => _word;

  List<Phonetics> get phonetics => _phonetics;

  List<Meanings> get meanings => _meanings;

  Dictionary.fromJson(Map<String, dynamic> json) {
    _word = json['word'];
    if (json['phonetics'] != null) {
      _phonetics = new List<Phonetics>();
      json['phonetics'].forEach((v) {
        _phonetics.add(new Phonetics.fromJson(v));
      });
    }
    if (json['meanings'] != null) {
      _meanings = new List<Meanings>();
      json['meanings'].forEach((v) {
        _meanings.add(new Meanings.fromJson(v));
      });
    }
  }
}

class Phonetics {
  String _text;
  String _audio;

  String get text => _text;

  String get audio => _audio;

  Phonetics.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _audio = json['audio'];
  }
}

class Meanings {
  String _partOfSpeech;
  List<Definitions> _definitions;

  String get partOfSpeech => _partOfSpeech;

  List<Definitions> get definitions => _definitions;

  Meanings.fromJson(Map<String, dynamic> json) {
    _partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      _definitions = new List<Definitions>();
      json['definitions'].forEach((v) {
        _definitions.add(new Definitions.fromJson(v));
      });
    }
  }
}

class Definitions {
  String _definition;
  String _example;
  List<String> _synonyms;

  Definitions({String definition, String example, List<String> synonyms}) {
    this._definition = definition;
    this._example = example;
    this._synonyms = synonyms;
  }

  String get definition => _definition;

  set definition(String definition) => _definition = definition;

  String get example => _example;

  set example(String example) => _example = example;

  List<String> get synonyms => _synonyms;

  set synonyms(List<String> synonyms) => _synonyms = synonyms;

  Definitions.fromJson(Map<String, dynamic> json) {
    _definition = json['definition'];
    _example = json['example'];
    _synonyms = json['synonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['definition'] = this._definition;
    data['example'] = this._example;
    data['synonyms'] = this._synonyms;
    return data;
  }
}
