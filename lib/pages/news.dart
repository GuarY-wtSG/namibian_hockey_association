import 'package:flutter/material.dart';
import 'package:nho_app/pages/widgets/news_tile.dart';

import 'models/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsState();
}

class _NewsState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // To change the scroll direction (switching betweeen a Column and Row
      // Listview) aplly the following code and height or width to each container
      // scrollDirection: Axis.horizontal, (for Rows)
      children: [
        // main news content of the page
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'News 📰',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        //1st box containing the news container
        // I'm using a sized box because Expanded creates and infinte height error
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              News news = News(
                title: 'A Namibian hockey giant departs',
                description:
                    'NAMIBIA’S hockey community was still struggling to come to terms with the news that its president Marc Nel had passed away due to Covid-19 complications on Saturday.',
                imagePath: 'lib/images/giant.jpg',
                url:
                    'https://namibiahockey.org/2021/06/28/a-namibian-hockey-giant-departs/',
              );
              return NewsTile(news: news);
            },
          ),
        ),
        const SizedBox(height: 40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Your upcoming Events',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        Container(height: 300, color: Colors.deepOrange),

        //2nd box
        Container(height: 300, color: Colors.deepOrange[400]),

        //3rd box
      ],
    );
  }
}
