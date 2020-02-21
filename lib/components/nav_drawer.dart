import 'package:blog_flutter/model/user.dart';
import 'package:blog_flutter/routing/route_names.dart';
import 'package:blog_flutter/screens/about.dart';
import 'package:blog_flutter/screens/flare_teddy.dart';
import 'package:blog_flutter/services/auth.dart';
import 'package:blog_flutter/services/locator.dart';
import 'package:blog_flutter/services/navigator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../screens/SignUp.dart';

class NavDrawer extends StatefulWidget {

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    bool isLoggedIn = user != null;
    return Drawer(
      child: Column(
        children: <Widget>[
          if(isLoggedIn)...[
            RaisedButton(
              child: Text('Sign out'),
              onPressed: () => AuthService().signOut(),
            )
          ],

          if(!isLoggedIn)...[
            RaisedButton(
              child: Text('Login/Sign Up'),
              onPressed: () {
                locator.get<NavigationService>().navigateTo(LoginRoute);
              },
            ),
          ],
          FlatButton(
            child: Text('Flare Teddy Animation Demo'),
            onPressed: () {
              locator.get<NavigationService>().navigateTo(RiveDemoRoute);
            },
          ),
          FlatButton(
            child: Text('About'),
            onPressed: () {
              locator.get<NavigationService>().navigateTo(AboutRoute);
            },
          )
        ],
      ),
    );
  }
}