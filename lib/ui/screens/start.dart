import 'package:blokal/models/news.dart';
import 'package:blokal/ui/widgets/news_list.dart';
import 'package:blokal/ui/widgets/news_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {

  TabController _tabController;
  List<NewsModel> _models = <NewsModel>[
    NewsModel("news"),
    NewsModel("politics"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _models.forEach((model) => model.fetchData());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(text: "politics"),
              Tab(text: "money"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            NewsList(_models[0]),
            NewsList(_models[1]),
//            NewsListItem(),
//            Text("inside money"),
          ],
        ));
  }
}
