import 'package:blokal/models/news.dart';
import 'package:blokal/ui/widgets/news_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("NewsList: build/1");

    return ScopedModelDescendant<NewsModel>(
        builder: (context, child, model) => ListView.builder(
            itemCount: model.news == null ? 0 : model.news.length,
            itemBuilder: (_context, int index) {
              var item = model.news[index];
              return NewsListItem(news: item);
            }));
  }
}
