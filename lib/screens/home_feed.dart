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
    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;
    if (screenSize.width > 1150) {
      columns = 3;
    } else if (screenSize.width > 825) {
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
              'https://raw.githubusercontent.com/plusmobileapps/dev-articles/master/Android%20App%20Widget.md',
          imageUrl: 'assets/computeranimation.flr'),
      Article(
          id: '2',
          description:
              'Learn how to use git without ever needing to login through the terminal',
          minRead: '5 min',
          title: 'SSH into a git remote repo',
          url:
              'https://raw.githubusercontent.com/plusmobileapps/dev-articles/master/SSH.md',
          imageUrl: 'assets/computeranimation.flr'),
    ];
    return BlogScaffold(
      title: 'Plus Mobile Apps',
      showNavDrawer: true,
      body: GridView.count(
        shrinkWrap: true,
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: columns,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(articles.length, (index) {
          return HomeFeedCard(
            article: articles[index],
          );
        }),
      ),
    );
  }
}
