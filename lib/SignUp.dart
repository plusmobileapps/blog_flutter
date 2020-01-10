
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'services/auth.dart';

class SignUp extends StatefulWidget {


  @override
  State createState() {
    return _SignUpState();
  }
}


class _SignUpState extends State<SignUp> {

  final AuthService _authService = new AuthService();


//
//  SignUpState({Key key}) : super

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Sign in anon'),
              onPressed: () async {
                 dynamic result = await _authService.signInAnon();
                 if(result == null) {
                   print('error signing in');
                 } else {
                   print('signed in');
                   print(result);
                 }
              },
            )
          ],
        ),
      );
  }
}