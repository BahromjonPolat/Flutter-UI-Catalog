import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/news_app/article_model.dart';

class NewsPageDetailsPage extends StatelessWidget {

  Article article;
  NewsPageDetailsPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
  _getBody() => Column(
    children: [
      Image.network(article.urlToImage),

    ],
  );
}
