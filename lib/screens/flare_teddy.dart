import 'package:blog_flutter/components/BlogScaffold.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlareTeddyWidget extends StatelessWidget {

  final FlareControls controls = FlareControls();

  @override
  Widget build(BuildContext context) {
    return BlogScaffold(
      title: 'Flare Flutter Animation Demo - Teddy',
      showNavDrawer: false,
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 300,
              height: 300,
              child: FlareActor(
                "assets/Teddy.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "idle",
                controller: controls,
              ),
            ),
          ),
          RaisedButton(
            child: Text('Idle'),
            onPressed: () {
              controls.play('idle');
            },
          ),
          RaisedButton(
            child: Text('Success'),
            onPressed: () {
              controls.play('success');
            },
          ),
          RaisedButton(
            child: Text('Fail'),
            onPressed: () {
              controls.play('fail');
            },
          )
        ],
      ),
    );
  }

}