
import 'package:blog_flutter/components/BlogScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AboutPage extends StatefulWidget {

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return BlogScaffold(
      title: 'About Plus Mobile Apps',
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: ExactAssetImage('assets/selfie.jpg'),
              radius: 150,
            ),
          ],
        ),
      ),
    );
  }


}