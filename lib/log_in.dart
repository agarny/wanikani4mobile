import 'package:flutter/material.dart';
import 'package:wanikani4mobile/utilities.dart';

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
      drawer: drawer(context),
      body: Container(
        margin: EdgeInsets.all(space(context)),
        child: Column(
          children: <Widget>[
            Text('WaniKani for Mobile needs you to log in to WaniKani.'
                'This is needed to retrieve various information about your WaniKani account.'),
            OutlineButton(
              child: Text('Log in to WaniKani'),
              onPressed: () {
                Navigation().navigateTo(WaniKaniLogInRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
