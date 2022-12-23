// https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=53a9e037d9d04cc68a4b109e0ee634fc
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_app/view/model/news_article.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];
  static Future<NewsArt> fetchNews() async {
    final random = Random();
    var sourceID = sourcesId[random.nextInt(sourcesId.length)];
    print(sourceID);

    Response response = await get(
      Uri.parse(
          "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=53a9e037d9d04cc68a4b109e0ee634fc"),
    );
    Map bodyData = jsonDecode(response.body);
    List articles = bodyData["articles"];
    print(articles);

    final newrandom = Random();
    var myArticle = articles[newrandom.nextInt(articles.length)];
    print(myArticle);

    return NewsArt.fromAPItoApp(myArticle);
  }
}
