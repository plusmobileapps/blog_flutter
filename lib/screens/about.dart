
import 'package:blog_flutter/components/BlogScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutPage extends StatefulWidget {

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return BlogScaffold(
      title: 'About Plus Mobile Apps',
      showNavDrawer: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: ExactAssetImage('assets/selfie.jpg'),
              radius: 150,
            ),
            RaisedButton(
              child: Text('Launch Url'),
              onPressed: _launchURL,
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}