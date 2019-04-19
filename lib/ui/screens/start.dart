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

  static final List<NewsModel> _models = [
    NewsModel("news"),
    NewsModel("finance"),
    NewsModel("tekno"),
    NewsModel("sports"),
    NewsModel("otomotif"),
    NewsModel("entertainment"),
    NewsModel("lifestyle"),
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(5.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: <Tab>[
                Tab(text: "news"),
                Tab(text: "finance"),
                Tab(text: "tekno"),
                Tab(text: "sports"),
                Tab(text: "otomotif"),
                Tab(text: "entertainment"),
                Tab(text: "lifestyle"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <ScopedModel> [
            toScopedModel(_models[0]), // news
            toScopedModel(_models[1]), // finance
            toScopedModel(_models[2]), // tekno
            toScopedModel(_models[3]), // sports
            toScopedModel(_models[4]), // otomotif
            toScopedModel(_models[5]), // entertainment
            toScopedModel(_models[6]), // lifestyle
          ]
        )
    );
  }
  
  ScopedModel<NewsModel> toScopedModel(NewsModel model) {
    return ScopedModel<NewsModel>(
      model: model,
      child: NewsList()
    );
  }
}
