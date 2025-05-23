import 'package:flutter/material.dart';

import '../models/news_model.dart';

// ignore: must_be_immutable
class NewsTile extends StatelessWidget {
  News news;
  NewsTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          //news pic
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              news.imagePath,
              // this is to handle image render issues
              errorBuilder: (context, error, StackTrace) {
                return Icon(Icons.image_not_supported);
              },
            ),
          ),
          SizedBox(height: 10),

          //News description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              news.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(news.description),
          ),
        ],
      ),
    );
  }
}
