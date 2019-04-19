import 'package:blokal/models/news.dart';
import 'package:blokal/ui/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  static final List<NewsModel> _models = <NewsModel>[
    NewsModel("news"),
    NewsModel("politics"),
  ];

  static final List<Text> _tabs = [
      new Text("something"),
      new Text("another-thing"),
//    ScopedModel<NewsModel> (
//      model: _models[0], // news
//      child: NewsList(),
//    ),
//    ScopedModel<NewsModel> (
//      model: _models[1], // politics
//      child: NewsList(),
//    )
  ];

  @override
  void initState() {
    print("StartScreenState: initState/0");
    super.initState();

    _tabController = TabController(vsync: this, length: 3);
    _models.forEach((model) => model.fetchData());
  }

  @override
  void dispose() {
    print("StartScreenState: dispose/0");

    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("StartScreenState: build/1");

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _tabs,
        )
    );
  }
}
