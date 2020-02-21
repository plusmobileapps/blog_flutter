import 'package:blog_flutter/routing/route_names.dart';
import 'package:blog_flutter/routing/router.dart';
import 'package:blog_flutter/services/locator.dart';
import 'package:blog_flutter/services/navigator.dart';
import 'package:flutter/material.dart';

class LayoutTemplate extends StatelessWidget {

  final Widget child;

  const LayoutTemplate({Key key, this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }
}