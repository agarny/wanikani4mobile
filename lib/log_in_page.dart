import 'package:flutter/material.dart';

import 'constants.dart';

class LogInPage extends StatefulWidget {
  @override
  LogInPageState createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in to WaniKani'),
      ),
      body: Container(
        margin: EdgeInsets.all(margin),
        child: Column(
          children: <Widget>[
            Text('To be done...'),
          ],
        ),
      ),
    );
  }
}
