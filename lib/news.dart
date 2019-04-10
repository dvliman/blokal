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
