import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blokal/models/base_model.dart';

class NewsModel extends BaseModel {
  final String category;

  NewsModel(this.category);

  List<News> _news = List();
  List<News> get news => _news;

  int get getCount => (_news == null) ? 0 : _news.length;

  @override
  Future fetchData() async {
    var response = await http
        .post(endpoint("news/query-news"),
        body: {'category': this.category});

    List<dynamic> newsJson = json.decode(response.body);

    print("NewsModel: fetchData: category = $category, reply: $newsJson");
    _news.addAll(newsJson.map((json) => News.fromJson(json)));

    setLoading(false);
  }
}

class News {
  final String title;
  final String content;
  final String imageUrl;
  final String category;
  final String sourceUrl;
  final String sourceName;
  final String publishedAt;

  News(
      {this.title,
      this.content,
      this.imageUrl,
      this.category,
      this.sourceUrl,
      this.sourceName,
      this.publishedAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'],
        content: json['content'],
        imageUrl: json['imageUrl'],
        category: json['category'],
        sourceUrl: json['sourceUrl'],
        sourceName: json['sourceName'],
        publishedAt: json['publishedAt']);
  }
}
