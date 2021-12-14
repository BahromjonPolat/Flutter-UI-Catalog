class Currency {
  String? _title;
  String? _code;
  String? _cbPrice;
  String? _nbuBuyPrice;
  String? _nbuCellPrice;
  String? _date;

  String get title => _title!;
  String get code => _code!;
  String get cbPrice => _cbPrice!;
  String get nbuBuyPrice => _nbuBuyPrice!;
  String get nbuCellPrice => _nbuCellPrice!;
  String get date => _date!;

  Currency.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _code = json['code'];
    _cbPrice = json['cb_price'];
    _nbuBuyPrice = json['nbu_buy_price'];
    _nbuCellPrice = json['nbu_cell_price'];
    _date = json['date'];
  }
  
}
