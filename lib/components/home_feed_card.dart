import 'package:blog_flutter/model/article.dart';
import 'package:flutter/material.dart';

class HomeFeedCard extends StatelessWidget {

  final Article article;

  HomeFeedCard({this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.email),
          ListTile(
            title: Text(article.title),
            subtitle: Text(article.description),
          )
        ],
      ),
    );
  }


}