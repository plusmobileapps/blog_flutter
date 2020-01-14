import 'package:blog_flutter/components/BlogScaffold.dart';
import 'package:blog_flutter/components/home_feed_card.dart';
import 'package:blog_flutter/model/article.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:blog_flutter/components/nav_drawer.dart';
import 'package:blog_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SignUp.dart';

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
    var user = Provider.of<User>(context);
    print('User is: $user');
    bool isLoggedIn = user != null;
    Article article = Article(id: 'some id', description: 'This is an article description', minRead: '7 min read', title: "The amazing article title");
    return BlogScaffold(
      title: 'Plus Mobile Apps',
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return HomeFeedCard(article: article,);
        }),
      ),
    );
  }
}
