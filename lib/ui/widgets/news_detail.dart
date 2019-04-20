
import 'package:blokal/models/news.dart';
import 'package:blokal/ui/widgets/cache_image.dart';
import 'package:blokal/ui/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsDetail extends StatelessWidget {
  final News news;

  NewsDetail(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // image header
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            pinned: false,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: InkWell(
                child: Hero(
                  tag: news.imageUrl,
                  child: CacheImage(news.imageUrl),
                )
              ),
            ),
          ),

          // body
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Text(news.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline
                  ),
                  Separator.spacer(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                    ],
                  )
                ],
              )
            )
          )
        ],
      )
    );
  }
}