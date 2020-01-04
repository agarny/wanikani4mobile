import 'package:flutter/material.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:wanikani4mobile/wanikani.dart';

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
              Navigation().navigateTo(SettingsRoute);
            },
          ),
        ],
      ),
      drawer: drawer(context),
      body: Container(
        margin: EdgeInsets.all(space(context)),
        child: Column(
          children: <Widget>[
            FutureBuilder<WaniKani>(
                future: WaniKani().fetchAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.hasError) {
                      return Text(snapshot.data.errorMessage);
                    }

                    return Text(
                        'Welcome to WaniKani for Mobile ${snapshot.data.user.data.username}!');
                  }

                  return Text('Please wait while we are fetching the data...');
                }),
          ],
        ),
      ),
    );
  }
}
