class NewsArt {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsCnt;
  String newsUrl;

  NewsArt({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsCnt,
    required this.newsUrl,
  });

 static NewsArt fromAPItoApp(Map<String, dynamic> article) {
    return NewsArt(
      imgUrl: article["urlToImage"] ??
          "https://images.unsplash.com/photo-1478940020726-e9e191651f1a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      newsHead: article["title"] ?? "--",
      newsDesc: article["description"] ?? "--",
      newsCnt: article["content"] ?? "--",
      newsUrl: article["url"] ?? "https://news.google.co.in/",
    );
  }
}
