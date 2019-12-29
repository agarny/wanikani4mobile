import 'package:flutter/material.dart';

import 'utilities.dart';

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
            Align(
              alignment: Alignment.topLeft,
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'WaniKani for Mobile needs your ',
                      style: bodyStyle(context),
                    ),
                    LinkTextSpan(
                      text: 'API token',
                      style: linkStyle(context),
                      urlOrRoute:
                          'https://www.wanikani.com/settings/personal_access_tokens',
                    ),
                    TextSpan(
                      text: ' to work.',
                      style: bodyStyle(context),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: space(context)),
            Text(
                'This can be retrieved either automatically by logging in to WaniKani or manually by entering it.'),
            SizedBox(height: space(context)),
            Center(
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    LinkTextSpan(
                      text: 'Log in to WaniKani',
                      style: linkStyle(context),
                      urlOrRoute: 'https://www.wanikani.com/login',
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
