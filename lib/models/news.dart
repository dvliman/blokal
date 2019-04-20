import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blokal/models/base_model.dart';

class NewsModel extends BaseModel {
  final String category;

  String get getCategory => category;

  NewsModel(this.category);

  List<News> _news = List();

  List<News> get news => _news;

  bool _hasError = false;

  bool get hasError => _hasError;

  int get getCount => (_news == null) ? 0 : _news.length;

  @override
  Future fetchData() async {
    print("NewsModel: fetchData: category = $category, started...");
    // TODO: use single http client, not init client every single time
    var response = await http
        .post(endpoint("news/query-news"), body: {'category': this.category});

    _news.clear(); // BaseModel:refresh()

    if (response.statusCode == 200) {
      List<News> news = _parseResponse(response);
      _news.addAll(news);
    } else {
      print("NewsModel: "
          "fecthData: category = $category, "
          "response-err: ${response.statusCode}, "
          "response-body: ${response.body}");
      _hasError = true;
    }

    setLoading(false);
  }

  List<News> _parseResponse(http.Response response) {
    List xs = json.decode(response.body);
    return xs.map((json) => News.fromJson(json)).toList();
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
        imageUrl: json['image_url'],
        category: json['category'],
        sourceUrl: json['source_url'],
        sourceName: json['source_name'],
        publishedAt: json['published_at']);
  }
}
