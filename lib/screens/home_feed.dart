import 'package:blog_flutter/components/BlogScaffold.dart';
import 'package:blog_flutter/components/home_feed_card.dart';
import 'package:blog_flutter/model/article.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    var columns = 1;
    if (screenSize.width > 1080) {
      columns = 3;
    } else if (screenSize.width > 600) {
      columns = 2;
    } else {
      //mobile
      columns = 1;
    }
    var articles = [
      Article(
          id: '1',
          description:
              'Learn the basic fundamentals of how to make an android app widget',
          minRead: '10 min',
          title: 'How to make an Android application widget',
          url:
              'https://raw.githubusercontent.com/plusmobileapps/dev-articles/master/Android%20App%20Widget.md'),
      Article(
          id: '2',
          description:
              'Learn how to use git without ever needing to login through the terminal',
          minRead: '5 min',
          title: 'SSH into a git remote repo',
          url:
              'https://raw.githubusercontent.com/plusmobileapps/dev-articles/master/SSH.md')
    ];
    return BlogScaffold(
      title: 'Plus Mobile Apps',
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: columns,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(articles.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeFeedCard(
              article: articles[index],
            ),
          );
        }),
      ),
    );
  }
}
