import 'package:flutter/material.dart';
import 'package:news_app/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  final String imgUrl;
  final String newsHead;
  final String newsDesc;
  final String newsCnt;
  final String newsUrl;

  const NewsContainer({
    super.key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsCnt,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imgUrl,
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  newsHead.length > 70
                      ? "${newsHead.substring(0, 50)}..."
                      : newsHead,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  newsDesc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  newsCnt.length > 300
                      ? newsCnt.substring(0, 300)
                      : "${newsCnt.toString().substring(0, newsCnt.length - 15)}...",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailViewScreen(newsUrl: newsUrl),
                      ),
                    );
                  },
                  child: const Text('Read more'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
