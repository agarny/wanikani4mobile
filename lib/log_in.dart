import 'package:flutter/material.dart';
import 'package:wanikani4mobile/application.dart';
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
            Text('WaniKani for Mobile needs your API token to work.'
                'This can be retrieved either automatically by logging in to WaniKani or manually by entering it.'),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                OutlineButton(
                  child: Text('Log in to WaniKani'),
                  onPressed: () {
                    Navigation().navigateTo(WaniKaniLogInRoute);
                  },
                ),
                SizedBox(width: space(context)),
                OutlineButton(
                  child: Text('Enter my API token'),
                  onPressed: () {
                    Navigation().navigateTo(WaniKaniApiTokenRoute);
                  },
                ),
              ],
            ),
            //---GRY--- THE BELOW IS JUST FOR TESTING NOTIFICATIONS!
            OutlineButton(
              child: Text('Notify me!'),
              onPressed: () {
                Application.notifyReviews(123);
              },
            ),
          ],
        ),
      ),
    );
  }
}
