import 'package:blog_flutter/components/BlogScaffold.dart';
import 'package:blog_flutter/model/article.dart';
import 'package:blog_flutter/services/article_repository.dart';
import 'package:blog_flutter/services/locator.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPage extends StatelessWidget {

  final String id;

  const ArticleDetailPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ArticleDetail(id);
  }
}

class ArticleDetail extends StatefulWidget {
  final String articleId;

  ArticleDetail(this.articleId);

  @override
  _ArticleDetailState createState() => _ArticleDetailState(articleId);
}

class _ArticleDetailState extends State<ArticleDetail> {
  final String _articleId;
  Article _article;
  String _markdownBody = '';
  bool _loading = true;

  _ArticleDetailState(this._articleId);

  @override
  void initState() {
    _loadMarkDown();
  }

  @override
  Widget build(BuildContext context) {
    if(_article == null) {
      Navigator.pop(context);
    }
    Widget body;
    if (_loading) {
      body = Center(
        child: Container(
          width: 200,
          height: 200,
          child: FlareActor(
            "assets/loading.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "Aura",
          ),
        ),
      );
    } else {
      body = SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Container(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0,),
                  MarkdownBody(
                    data: _article.body,
                    onTapLink: _launchURL,
                  ),
                  SizedBox(height: 16.0,)
                ],
              ),
            ),
          ),
        ),
      );
    }
    return BlogScaffold(
      title: 'Article Detail',
      body: body,
      showNavDrawer: false,
    );
  }

  _loadMarkDown() async {
    var article = locator.get<ArticleRepository>().getArticle(_articleId);
    setState(() {
      _loading = false;
      _article = article;
    });
//    var response = await http.get(_article.url);
//    await new Future.delayed(const Duration(seconds: 1));
//    //loading a local json file
////    String config = await rootBundle.loadString('assets/SSH.md');
//    setState(() {
//      _loading = false;
//      _markdownBody = response.body;
//    });
  }

  _launchURL(String url) async {
    print('Launching url: $url');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
