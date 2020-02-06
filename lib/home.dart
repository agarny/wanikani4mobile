import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
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
      style: Theme.of(context).accentTextTheme.body1,
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
                ? WaniKani().lessonsAvailable()
                : WaniKani().reviewsAvailable(),
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(
            width: space(context),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Theme.of(context).disabledColor,
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

InkWell _upcomingReviews(
    BuildContext context, _UpcomingReviews upcomingReviews) {
  return InkWell(
    child: Padding(
      padding: EdgeInsets.only(
        top: space2x(context),
        left: space2x(context),
        bottom: space2x(context),
        right: ((upcomingReviews == _UpcomingReviews.NextHour) ||
                (upcomingReviews == _UpcomingReviews.NextDay))
            ? space3x(context)
            : space2x(context),
      ),
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
          Spacer(),
          (upcomingReviews == _UpcomingReviews.NextHour)
              ? Text(
                  '0',
                  style: Theme.of(context).textTheme.subhead,
                )
              : (upcomingReviews == _UpcomingReviews.NextDay)
                  ? Text(
                      '0',
                      style: Theme.of(context).textTheme.subhead,
                    )
                  : Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).disabledColor,
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
  static final GlobalKey<RefreshIndicatorState> _refreshIndicatorState =
      new GlobalKey<RefreshIndicatorState>();
  static const _defaultGravatar =
      'https://aws1.discourse-cdn.com/business5/uploads/wanikani_community/original/3X/f/d/fd4c154120954695f788402f3bcf4e616499bc2d.png';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _refreshIndicatorState.currentState.show());
  }

  @override
  Widget build(BuildContext context) {
    var hash = md5.convert(utf8.encode(Settings().emailAddress)).toString();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: space(context),
        title: WaniKani().hasError
            ? Text('WaniKani for Mobile')
            : Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        'https://www.gravatar.com/avatar/$hash.jpg?d=$_defaultGravatar'),
                  ),
                  SizedBox(width: space3x(context)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        WaniKani().userName(),
                        style: Theme.of(context).accentTextTheme.headline,
                      ),
                      Text(
                        WaniKani().level(),
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
        child: (WaniKani().hasError)
            ? Text(WaniKani().errorMessage)
            : RefreshIndicator(
                key: _refreshIndicatorState,
                child: ListView(
                  children: <Widget>[
                    thinDivider(),
                    _header(context, 'CURRENTLY AVAILABLE'),
                    _currentlyAvailable(context, _CurrentlyAvailable.Lessons),
                    thinDivider(),
                    _currentlyAvailable(context, _CurrentlyAvailable.Reviews),
                    _header(context, 'UPCOMING REVIEWS'),
                    _upcomingReviews(context, _UpcomingReviews.NextHour),
                    thinDivider(),
                    _upcomingReviews(context, _UpcomingReviews.NextDay),
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
              ),
      ),
    );
  }
}
