import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_ui/pages/news_app/article_model.dart';
import 'package:http/http.dart' as http;

class NewsAppMainPage extends StatefulWidget {
  @override
  _NewsAppMainPageState createState() => _NewsAppMainPageState();
}

class _NewsAppMainPageState extends State<NewsAppMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNewsBody(),
    );
  }

  _buildNewsBody() => FutureBuilder(
      future: _getNews(),
      builder: (context, AsyncSnapshot<List<Article>> snap) {
        // print(snap.data);
        return snap.hasData
            ? ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (context, index) {
                  Article article = snap.data[index];
                  return ListTile(
                    title: Text(
                      article.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(article.content, maxLines: 1),
                    trailing: Image.network(article.urlToImage,
                    height: 48.0,
                      width: 70.0,
                      fit: BoxFit.cover,
                    ),


                  );
                })
            : _showIndicator();
      });

  Center _showIndicator() => Center(
        child: CupertinoActivityIndicator(),
      );

  Future<List<Article>> _getNews() async {
    Uri uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2021-10-06&to=2021-10-06&sortBy=popularity&apiKey=711119d3fcde459d84a0b89e2f474312");
    var response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList();
    } else {
      throw Exception("ERROR");
    }
  }
}
