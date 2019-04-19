import 'package:blokal/models/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("NewsList: build/1");

    return ScopedModelDescendant<NewsModel>(
      builder: (context, child, model) {
        return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: model.getCount == 0
                ? Center(child: Text("No news available"))
                : Center(child: Text("some news in there"))
//                : ListView.builder(
//                    itemCount: model.getCount + 1,
//                    itemBuilder: (context, index) {
//                      return Container();
//                    }
//                  )
        );
      },
    );
  }
}
