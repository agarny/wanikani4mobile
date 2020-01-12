import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:wanikani4mobile/wanikani.dart';

Container _header(BuildContext context, String title) {
  return Container(
    padding: EdgeInsets.all(space(context)),
    color: Theme.of(context).primaryColor,
    child: Text(
      title,
      style: Theme.of(context).accentTextTheme.headline,
    ),
  );
}

enum _CurrentlyAvailable {
  Lessons,
  Reviews,
}

InkWell _currentlyAvailable(
    BuildContext context, _CurrentlyAvailable currentlyAvailable) {
  return InkWell(
    child: Padding(
      padding: EdgeInsets.all(space2x(context)),
      child: Row(
        children: <Widget>[
          Text(
            (currentlyAvailable == _CurrentlyAvailable.Lessons)
                ? 'Lessons'
                : 'Reviews',
            style: Theme.of(context).textTheme.subhead,
          ),
          Spacer(),
          Text(
            (currentlyAvailable == _CurrentlyAvailable.Lessons)
                ? WaniKani()
                .summary
                .data
                .lessons[0]
                .subjectIds
                .length
                .toString()
                : WaniKani()
                .summary
                .data
                .reviews[0]
                .subjectIds
                .length
                .toString(),
            style: Theme.of(context).textTheme.subhead,
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: space(context),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    ),
    onTap: () {
      open((currentlyAvailable == _CurrentlyAvailable.Lessons)
          ? 'https://wanikani.com/lesson/session'
          : 'https://wanikani.com/review/session');
    },
  );
}

enum _UpcomingReviews {
  NextHour,
  NextDay,
  All,
}

InkWell _upcomingReviews(BuildContext context, _UpcomingReviews upcomingReviews) {
  return InkWell(
    child: Padding(
      padding: EdgeInsets.all(space2x(context)),
      child: Row(
        children: <Widget>[
          Text(
            (upcomingReviews == _UpcomingReviews.NextHour)
                ? 'Within the next hour'
                : (upcomingReviews == _UpcomingReviews.NextDay)
                ? 'Within the next day'
                : 'All of them',
            style: Theme.of(context).textTheme.subhead,
          ),
        ],
      ),
    ),
  );
}

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
                                thinDivider(),
                                _header(context, 'Currently Available'),
                                _currentlyAvailable(
                                    context, _CurrentlyAvailable.Lessons),
                                thinDivider(),
                                _currentlyAvailable(
                                    context, _CurrentlyAvailable.Reviews),
                                _header(context, 'Upcoming Reviews'),
                                _upcomingReviews(
                                    context, _UpcomingReviews.NextHour),
                                thinDivider(),
                                _upcomingReviews(
                                    context, _UpcomingReviews.NextDay),
                                thinDivider(),
                                _upcomingReviews(context, _UpcomingReviews.All),
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
