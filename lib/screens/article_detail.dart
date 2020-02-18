import 'package:blog_flutter/components/BlogScaffold.dart';
import 'package:blog_flutter/model/article.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ArticleDetail extends StatefulWidget {
  final Article _article;

  ArticleDetail(this._article);

  @override
  _ArticleDetailState createState() => _ArticleDetailState(_article);
}

class _ArticleDetailState extends State<ArticleDetail> {
  Article _article;
  String _markdownBody = '';
  bool _loading = true;

  _ArticleDetailState(this._article);

  @override
  void initState() {
    _loadMarkDown();
  }

  @override
  Widget build(BuildContext context) {
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
              child: MarkdownBody(
                data: _markdownBody,
                onTapLink: _launchURL,
              ),
            ),
          ),
        ),
      );
    }
    return BlogScaffold(
      title: 'Article Detail',
      body: body,
    );
  }

  _loadMarkDown() async {
    var response = await http.get(_article.url);
    await new Future.delayed(const Duration(seconds: 1));
    //loading a local json file
//    String config = await rootBundle.loadString('assets/SSH.md');
    setState(() {
      _loading = false;
      _markdownBody = response.body;
    });
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
