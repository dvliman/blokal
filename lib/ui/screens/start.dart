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
    NewsModel("money"),
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
            indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
            tabs: <Tab>[
              Tab(text: "news"),
              Tab(text: "money"),
              Tab(text: "bola"),
              Tab(text: "tekno"),
              Tab(text: "otomotif"),
              Tab(text: "lifestyle"),
              Tab(text: "kolum"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <ScopedModel> [
            ScopedModel<NewsModel>(
              model: _models[0],
              child: NewsList()
            ),
            ScopedModel<NewsModel>(
              model: _models[1],
              child: NewsList()
            )
          ]
        )
    );
  }

  ScopedModel toScopedModel(NewsModel model) {
    return ScopedModel<NewsModel> (
      model: model,
      child: NewsList()
    );
  }
}
