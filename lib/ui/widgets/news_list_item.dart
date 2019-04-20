import 'package:blokal/models/news.dart';
import 'package:blokal/ui/widgets/hero_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsListItem extends StatelessWidget {
  final News news;

  NewsListItem({this.news});

  @override
  Widget build(BuildContext context) {
    print("title: ${this.news.title}, category: ${this.news.category},"
        "image-url: ${this.news.imageUrl}, tag: ${this.news.sourceUrl}");
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          title: Text(this.news.title),
          subtitle: Text(this.news.sourceName),
          leading: HeroImage().buildHero(
            context: context,
            size: HeroImage.smallSize,
            url: this.news.imageUrl,
            tag: "random",
            title: this.news.title,
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
//                builder: (context) => NewsDetailScreen(this.news)
              )),
        )
      ]
    );
  }
}