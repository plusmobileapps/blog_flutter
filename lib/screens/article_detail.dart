
import 'package:blog_flutter/components/BlogScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ArticleDetail extends StatefulWidget {

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {

  String _markdownBody = '';

  @override
  void initState() {
    _loadMarkDown();
  }

  @override
  Widget build(BuildContext context) {
    return BlogScaffold(
      title: 'Article Detail',
      body: Markdown(data: _markdownBody,),
    );
  }

  _loadMarkDown() async {
    String config = await rootBundle.loadString('assets/SSH.md');
    setState(() {
      _markdownBody = config;
    });
  }
}