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
    return FutureBuilder<WaniKani>(
        future: WaniKani().fetch(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: (!WaniKani().initialized || WaniKani().hasError)
                  ? Text('WaniKani for Mobile')
                  : Column(
                      children: <Widget>[
                        Text(
                          WaniKani().user.data.username,
                          textScaleFactor: 1.5,
                        ),
                        Text('Level ${WaniKani().user.data.level}',
                            textScaleFactor: 0.75),
                      ],
                    ),
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
                child: (!WaniKani().initialized)
                    ? Text('Please wait while we are reetrieving your data...')
                    : (WaniKani().hasError)
                        ? Text(WaniKani().errorMessage)
                        : RefreshIndicator(
                            child: ListView(
                              children: <Widget>[
                                Text(
                                    'Number of lessons available: ${WaniKani().summary.data.lessons[0].subjectIds.length}.\n'
                                    'Number of reviews available: ${WaniKani().summary.data.reviews[0].subjectIds.length}.'),
                              ],
                            ),
                            onRefresh: () async {
                              await WaniKani().fetch();

                              setState(() {});

                              return;
                            },
                          )),
          );
        });
  }
}
