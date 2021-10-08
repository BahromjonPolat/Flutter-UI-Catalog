import 'dart:convert';
import 'package:card_swiper/card_swiper.dart';
import 'package:flag/flag.dart' as flag;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_ui/pages/currency/currency_model.dart';
import 'package:http/http.dart' as http;

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  static const String _bg =
      "https://images.unsplash.com/photo-1624996379697-f01d168b1a52?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80";
  double _width;
  double _height;

  static const Color _colorWhite = Colors.white;
  static const Color _colorWhiteWithOpacity = Color(0x0fffffff);
  static const Color _colorDarkSlateGrey = Color(0xFF394460);
  static const Color _colorBlue = Color(0xFF62C5ED);
  static const Color _colorYellow = Color(0xFFF3E18F);
  static const Color _colorBackground = Color(0xff11111d);

  List<Currency> _selectedList = [];

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _colorBackground,
      body: _buildBody(),
    );
  }

  _buildBody() => FutureBuilder(
      future: _getCurrencyList(),
      builder: (context, AsyncSnapshot<List<Currency>> snap) {
        _setSelectedList(snap.data);
        return snap.hasData
            ? CustomScrollView(
                slivers: [
                  _getSliverAppBar(),
                  _showSelectedItems(),
                  _setCurrencyList(snap.data),
                ],
              )
            : _showLoading();
      });

  SliverAppBar _getSliverAppBar() => SliverAppBar(
        floating: true,
        backgroundColor: _colorBackground,
        elevation: 0.0,
        title: Text("Rate Exchange"),
      );

  SliverToBoxAdapter _showSelectedItems() => SliverToBoxAdapter(
        child: _selectedList != null
            ? SizedBox(
                height: _height * 0.55,
                child: Swiper(
                  itemCount: _selectedList.length,
                  autoplay: true,
                  duration: 500,
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  loop: true,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      space: 6.0,
                      activeColor: _colorWhite,
                      color: _colorWhiteWithOpacity,
                      size: 8.0,
                      activeSize: 12.0,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    Currency currency = _selectedList[index];
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: _colorWhiteWithOpacity
                          // image: DecorationImage(
                          //   fit: BoxFit.cover,
                          //   image: NetworkImage(_bg),
                          // )
                          ),
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 32.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 48.0,
                                  width: 64.0,
                                  child: flag.Flag.fromString(
                                      "${currency.code[0]}${currency.code[1]}"),
                                ),
                                SizedBox(width: 12.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _setBoldText(currency.code),
                                    _setLightText(currency.title),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    _setBoldText("Markaziy bank narxi"),
                                    _setLightText(currency.cbPrice),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 24.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _setLightText("NBU Sotib olish"),
                                    _setBoldText(currency.nbuBuyPrice),
                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _setLightText("NBU Sotish"),
                                    _setBoldText(currency.nbuCellPrice),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : _showLoading(),
      );

  Text _setBoldText(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 17.0,
        fontFamily: "garamond",
      ),
    );
  }

  Text _setLightText(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontFamily: "garamond",
      ),
    );
  }

  SliverList _setCurrencyList(List<Currency> currencyList) => SliverList(
        delegate: SliverChildListDelegate(currencyList
            .map(
              (c) => Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  side: BorderSide(
                    color: _colorWhiteWithOpacity,
                    width: 1.0,
                  ),
                ),
                color: _colorWhiteWithOpacity,
                child: ListTile(
                  leading: SizedBox(
                    height: 48.0,
                    width: 64.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: flag.Flag.fromString(
                        c.code.substring(0, 2),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    c.title,
                    style: TextStyle(
                      color: _colorWhite,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "garamond",
                    ),
                  ),
                  subtitle: Text(
                    c.date,
                    style: TextStyle(color: _colorDarkSlateGrey),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        c.code,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _colorBlue,
                        ),
                      ),
                      Text(
                        c.cbPrice,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _colorYellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList()),
      );

  Center _showLoading() => Center(
        child: CupertinoActivityIndicator(radius: 24.0),
      );

  Future<List<Currency>> _getCurrencyList() async {
    Uri url = Uri.parse("https://nbu.uz/uz/exchange-rates/json/");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Currency.fromJson(e))
          .toList();
    }
    throw Exception("ERROR");
  }

  _setSelectedList(List<Currency> list) {
    _selectedList.clear();
    for (String code in _selectedListCodes) {
      for (int i = 0; i < list.length; i++) {
        if (code == list[i].code) {
          _selectedList.add(list[i]);
        }
      }
    }
  }

  List<String> _selectedListCodes = [
    "USD",
    "EUR",
    "GBP",
    "TRY",
    "RUB",
    "KZT",
  ];
}
