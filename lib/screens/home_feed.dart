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
    if(screenSize.width > 1080) {
      columns = 3;
    } else if(screenSize.width > 600) {
      columns = 2;
    } else {
      //mobile
      columns = 1;
    }
    var user = Provider.of<User>(context);
    bool isLoggedIn = user != null;
    Article article = Article(id: 'some id', description: 'This is an article description', minRead: '7 min read', title: "The amazing article title");
    return BlogScaffold(
      title: 'Plus Mobile Apps',
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: columns,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(20, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeFeedCard(article: article,),
          );
        }),
      ),
    );
  }
}
