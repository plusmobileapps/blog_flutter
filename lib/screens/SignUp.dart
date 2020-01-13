import 'package:blog_flutter/model/user.dart';
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
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[],
          ),
        ),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Login/Sign up'),
          actions: <Widget>[],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                      child: Container(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                    ),
                  ],
                ),
              ),

              RaisedButton(
                child: Text('Login'),
                onPressed: () async {
                  User result = await _authService.signInEmail(email, password);
                  if (result == null) {
                    print('error signing in');
                  } else {
                    print('signed in');
                    print(result.uid);
                    Navigator.pop(context);
                  }
                },
              ),

              RaisedButton(
                child: Text('Sign up with email'),
                onPressed: () async {
                  User result = await _authService.signUpEmail(email, password);
                  if (result == null) {
                    print('error signing in');
                  } else {
                    print('signed in');
                    print(result.uid);
                    Navigator.pop(context);
                  }
                },
              ),
              RaisedButton(
                child: Text('Sign in anon'),
                onPressed: () async {
                  User result = await _authService.signInAnon();
                  if (result == null) {
                    print('error signing in');
                  } else {
                    print('signed in');
                    print(result.uid);
                    Navigator.pop(context);
                  }
                },
              ),
              RaisedButton(
                child: Text('Sign in with google'),
                onPressed: () async {
                  User result = await _authService.signInWithGoogle();
                  if (result == null) {
                    print('error signing in');
                  } else {
                    print('signed in');
                    print(result.uid);
                  }
                },
              )
            ],
          ),
        ));
  }
}
