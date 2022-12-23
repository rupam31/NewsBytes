import 'package:flutter/material.dart';
import 'package:news_app/controller/model/news_article.dart';
import 'package:news_app/view/widgets/news_container.dart';

import '../controller/fetch_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late NewsArt newsArt;

  getNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
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
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            getNews();
          },
          itemBuilder: (context, index) {
            return isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : NewsContainer(
                    imgUrl: newsArt.imgUrl,
                    newsHead: newsArt.newsHead,
                    newsCnt: newsArt.newsCnt,
                    newsDesc: newsArt.newsDesc,
                    newsUrl: newsArt.newsUrl,
                  );
          }),
    );
  }
}
