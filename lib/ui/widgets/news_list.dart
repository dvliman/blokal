import 'package:blokal/models/news.dart';
import 'package:blokal/ui/widgets/news_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<NewsModel>(
      builder: (context, child, model) {
        print("NewsList: builder/3, category: ${model.category}");
        return Container(
            child: model.hasError
              ? Center(child: Text("There was a problem fetching data. Please try again.."))
              : model.getCount == 0
                ? Center(child: Text("No news available"))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.getCount,
                    itemBuilder: (context, index) {
                      // TODO: wrap with column, add divider below?
                      return NewsListItem(news: model.news[index]);
                    }
                  )
        );
      },
    );
  }
}
