import 'package:blog_flutter/model/user.dart';
import 'package:blog_flutter/screens/SignUp.dart';
import 'package:blog_flutter/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'nav_drawer.dart';

class BlogScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  BlogScaffold({this.body, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(title)),
      ),
      body: body,
    );
  }
}
