import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:wanikani4mobile/wanikani.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _defaultGravatar =
      'https://aws1.discourse-cdn.com/business5/uploads/wanikani_community/original/3X/f/d/fd4c154120954695f788402f3bcf4e616499bc2d.png';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WaniKani>(
        future: WaniKani().fetch(),
        builder: (context, snapshot) {
          var hash =
              md5.convert(utf8.encode(Settings().emailAddress)).toString();

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: space(context),
              title: (!WaniKani().initialized || WaniKani().hasError)
                  ? Text('WaniKani for Mobile')
                  : Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.gravatar.com/avatar/$hash.jpg?d=$_defaultGravatar'),
                        ),
                        SizedBox(width: space3x(context)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              WaniKani().user.data.username,
                              style: Theme.of(context).accentTextTheme.headline,
                            ),
                            Text(
                              'Level ${WaniKani().user.data.level}',
                              style: Theme.of(context).accentTextTheme.caption,
                            ),
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
                child: (!WaniKani().initialized)
                    ? Padding(
                        padding: EdgeInsets.all(space(context)),
                        child: Text(
                            'Please wait while we are retrieving your data...'),
                      )
                    : (WaniKani().hasError)
                        ? Text(WaniKani().errorMessage)
                        : RefreshIndicator(
                            child: ListView(
                              children: <Widget>[
                                header(context, 'Currently Available'),
                                currentlyAvailable(
                                    context, CurrentlyAvailable.Lessons),
                                thinDivider(),
                                currentlyAvailable(
                                    context, CurrentlyAvailable.Reviews),
                                header(context, 'Upcoming Reviews'),
                                upcomingReviews(
                                    context, UpcomingReviews.NextHour),
                                thinDivider(),
                                upcomingReviews(
                                    context, UpcomingReviews.NextDay),
                                thinDivider(),
                                upcomingReviews(context, UpcomingReviews.All),
                                thinDivider(),
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
