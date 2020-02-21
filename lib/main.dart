import 'package:blog_flutter/model/article.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:blog_flutter/routing/route_names.dart';
import 'package:blog_flutter/routing/router.dart';
import 'package:blog_flutter/screens/SignUp.dart';
import 'package:blog_flutter/screens/about.dart';
import 'package:blog_flutter/screens/article_detail.dart';
import 'package:blog_flutter/screens/flare_teddy.dart';
import 'package:blog_flutter/screens/home_feed.dart';
import 'package:blog_flutter/screens/layout_template.dart';
import 'package:blog_flutter/services/auth.dart';
import 'package:blog_flutter/services/locator.dart';
import 'package:blog_flutter/services/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user,
          catchError: (context, error) {
            return null;
          },
        )
      ],
      child: MaterialApp(
        title: 'Plus Mobile Apps',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) => LayoutTemplate(child: child,),
        navigatorKey: locator.get<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: HomeRoute,
      ),
    );
  }
}
