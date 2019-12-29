import 'package:flutter/material.dart';

import 'utilities.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WaniKani for Mobile'),
      ),
      body: Container(
        margin: EdgeInsets.all(space(context)),
        child: Column(
          children: <Widget>[
            Text('Welcome to WaniKani for Mobile!'),
          ],
        ),
      ),
    );
  }
}
