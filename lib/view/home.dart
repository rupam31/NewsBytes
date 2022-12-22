import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/news_container.dart';

import '../controller/fetch_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    FetchNews.fetchNews();
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
            FetchNews.fetchNews();
            return const NewsContainer(
              imgUrl:
                  "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
              newsHead: "BTC, ETH Price Points to Be Shown...",
              newsCnt:
                  "Elon Musk, an avid vocal supporter of the crypto sector, is integrating more features to cater to the crypto community thriving on the micro-blogging platform. Twitter will now be able to show the prices and market movement trajectory for cryptocurrencies via a simple search of their names. For starters, Bitcoin and Ether have been chosen as the first two cryptocurrencies, prices of which will be fetched if their names are typed on the Twitter search bar, alongside the ‘\$' sign.",
              newsDesc:
                  "Elon Musk, an avid vocal supporter of the crypto sector Elon Musk, an avid vocal supporter of the crypto sector",
              newsUrl: "newsUrl",
            );
          }),
    );
  }
}
