
import 'package:blog_flutter/routing/route_names.dart';
import 'package:blog_flutter/screens/SignUp.dart';
import 'package:blog_flutter/screens/about.dart';
import 'package:blog_flutter/screens/article_detail.dart';
import 'package:blog_flutter/screens/flare_teddy.dart';
import 'package:blog_flutter/screens/home_feed.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(MyHomePage(title: 'Plus Mobile Apps',), settings);
    case AboutRoute:
      return _getPageRoute(AboutPage(), settings);
    case ArticleDetailRoute:
      return _getPageRoute(ArticleDetailPage(), settings);
    case RiveDemoRoute:
      return _getPageRoute(FlareTeddyWidget(), settings);
    case LoginRoute:
      return _getPageRoute(SignUp(), settings);
    default:
      return _getPageRoute(MyHomePage(title: 'Plus Mobile Apps',), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
    settings: RouteSettings(name: routeName),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    child,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}