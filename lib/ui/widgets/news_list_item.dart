import 'package:blokal/models/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsListItem extends StatelessWidget {
  final News news;

  NewsListItem({this.news});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          title: Text(this.news.title),
          subtitle: Text(this.news.category),
        )
      ]
    );
  }
}