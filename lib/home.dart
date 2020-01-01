import 'package:flutter/material.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:wanikani4mobile/wanikani_api.dart';
import 'package:wanikani4mobile/wanikani_user.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              navigateTo(SettingsRoute);
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(space(context)),
        child: Column(
          children: <Widget>[
            FutureBuilder<WaniKaniUser>(
                future: waniKaniUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        'Welcome to WaniKani for Mobile ${snapshot.data.data.username}!');
                  } else {
                    return Text('Fetching data...');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
