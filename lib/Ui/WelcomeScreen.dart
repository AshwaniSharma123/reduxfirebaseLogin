import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('redux-login'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text('welcome to flutter'),
          )
        ],
      ),
    );
  }
}