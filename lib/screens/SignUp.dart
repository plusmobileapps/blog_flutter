
import 'package:blog_flutter/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class SignUp extends StatefulWidget {


  @override
  State createState() {
    return _SignUpState();
  }
}


class _SignUpState extends State<SignUp> {

  final AuthService _authService = new AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';


//
//  SignUpState({Key key}) : super

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 300.0,
                    child: TextField(
                      enabled: true,
                      onChanged: (value) {
                        this.email = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    child: TextField(
                      enabled: true,
                      obscureText: true,
                      onChanged: (value) {
                        this.password = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            RaisedButton(
              child: Text('Sign up with email'),
              onPressed: () async {
                User result = await _authService.signUpEmail(email, password);
                if(result == null) {
                  print('error signing in');
                } else {
                  print('signed in');
                  print(result.uid);
                }
              },
            ),
            RaisedButton(
              child: Text('Sign in anon'),
              onPressed: () async {
                 User result = await _authService.signInAnon();
                 if(result == null) {
                   print('error signing in');
                 } else {
                   print('signed in');
                   print(result.uid);
                 }
              },
            ),
            RaisedButton(
              child: Text('Sign in with google'),
              onPressed: () async {
                User result = await _authService.signInWithGoogle();
                if(result == null) {
                  print('error signing in');
                } else {
                  print('signed in');
                  print(result.uid);
                }
              },
            )
          ],
        ),
      );
  }
}