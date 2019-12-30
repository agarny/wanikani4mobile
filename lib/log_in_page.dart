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
      body: Container(
        margin: EdgeInsets.all(space(context)),
        child: Column(
          children: <Widget>[
            Text('WaniKani for Mobile needs your API token to work.'
                'This can be retrieved either automatically by logging in to WaniKani or manually by entering it.'),
            SizedBox(height: space(context)),
            Center(
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    LinkTextSpan(
                      text: 'Log in to WaniKani',
                      style: linkStyle(context),
                      urlOrRoute: '/wanikani_log_in',
                      context: context,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: space(context)),
            Center(
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    LinkTextSpan(
                      text: 'Enter my API token',
                      style: linkStyle(context),
                      urlOrRoute: '/api_token',
                      context: context,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
