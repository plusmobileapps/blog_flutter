import 'package:blog_flutter/model/article.dart';
import 'package:blog_flutter/routing/route_names.dart';
import 'package:blog_flutter/screens/article_detail.dart';
import 'package:blog_flutter/services/locator.dart';
import 'package:blog_flutter/services/navigator.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class HomeFeedCard extends StatelessWidget {

  final Article article;

  HomeFeedCard({this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Container(
                width: double.infinity,
                height: 300,
                child: FlareActor(
                  article.imageUrl,
                  alignment: Alignment.center,
                  fit: BoxFit.fitHeight,
                  animation: "coding",
                ),
              ),
            ),
            ListTile(
              title: Text(article.title),
              subtitle: Text(article.description),
            )
          ],
        ),
      ),
      onTap: () {
        locator.get<NavigationService>().navigateTo(ArticleDetailRoute, queryParams: {'id' : article.id});
      }
    );
  }


}