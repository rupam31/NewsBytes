import 'package:flutter/material.dart';
import 'package:news_app/view/model/news_article.dart';
import 'package:news_app/view/widgets/news_container.dart';

import '../controller/fetch_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArt newsArt;

  getNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {});
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            getNews();

            return NewsContainer(
              imgUrl:
                  newsArt.imgUrl,
              newsHead: newsArt.newsHead,
              newsCnt:
                  newsArt.newsCnt,
              newsDesc:
                  newsArt.newsDesc,
              newsUrl: newsArt.newsUrl,
            );
          }),
    );
  }
}
