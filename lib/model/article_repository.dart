import 'dart:async';

import 'package:blog_flutter/model/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleRepository {
    var articlesFirestore = Firestore.instance.collection('articles');

    Stream<List<Article>> getArticles() {
      return articlesFirestore.snapshots().transform(StreamTransformer.fromHandlers(
        handleData: (QuerySnapshot snapshot, EventSink sink) {
          var article = List<Article>();
          snapshot.documents.forEach((element) {
            article.add(_mapDocumentToArticle(element));
          });
          sink.add(article);
        },
        handleError: (Object error, StackTrace stackTrace, EventSink sink) {
          sink.addError(error);
          print(error);
        },
        handleDone: (EventSink sink) => sink.close(),
      ));
    }

    Article _mapDocumentToArticle(DocumentSnapshot snapshot) {
      return Article(
        id: snapshot.documentID,
        url: snapshot['url'],
        imageUrl: snapshot['imageUrl'],
        title: snapshot['title'],
        minRead: snapshot['minRead'],
        description: snapshot['description']
      );
    }

}