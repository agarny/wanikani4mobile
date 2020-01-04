import 'package:flutter/material.dart';
import 'package:wanikani4mobile/application.dart';
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
        child: FutureBuilder<WaniKani>(
            future: WaniKani().fetch(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.hasError) {
                  return Text(snapshot.data.errorMessage);
                }

                Application.updateBadge(
                    WaniKani().summary.data.reviews[0].subjectIds.length);

                return RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Text(
                          'Welcome to WaniKani for Mobile ${WaniKani().user.data.username}!\n'
                          '\n'
                          'Number of lessons available: ${WaniKani().summary.data.lessons[0].subjectIds.length}.\n'
                          'Number of reviews available: ${WaniKani().summary.data.reviews[0].subjectIds.length}.'),
                    ],
                  ),
                  onRefresh: () async {
                    setState(() {});

                    return;
                  },
                );
              }

              return Text('Please wait while we are fetching the data...');
            }),
      ),
    );
  }
}
