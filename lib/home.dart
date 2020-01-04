import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:wanikani4mobile/wanikani.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const _defaultGravatar = 'https://aws1.discourse-cdn.com/business5/uploads/wanikani_community/original/3X/f/d/fd4c154120954695f788402f3bcf4e616499bc2d.png';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WaniKani>(
        future: WaniKani().fetch(),
        builder: (context, snapshot) {
          var gravatarSize = 0.75*min(AppBar().preferredSize.width, AppBar().preferredSize.height);
          var hash =
              md5.convert(utf8.encode(Settings().emailAddress)).toString();

          return Scaffold(
            appBar: AppBar(
              title: (!WaniKani().initialized || WaniKani().hasError)
                  ? Text('WaniKani for Mobile')
                  : Row(
                      children: <Widget>[
                         Container(
                            width: gravatarSize,
                            height: gravatarSize,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://www.gravatar.com/avatar/$hash.jpg?d=$_defaultGravatar")
                                )
                            )),
                        SizedBox(width: space(context)),
                        Column(
                          children: <Widget>[
                            Text(
                              WaniKani().user.data.username,
                              textScaleFactor: 1.5,
                            ),
                            Text('Level ${WaniKani().user.data.level}',
                                textScaleFactor: 0.75),
                          ],
                        ),
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
