import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wanikani4mobile/utilities.dart';

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
              GetIt.instance<NavigationService>().navigateTo(SettingsRoute);
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(space(context)),
        child: Column(
          children: <Widget>[
            Text('Welcome to WaniKani for Mobile!'),
          ],
        ),
      ),
    );
  }
}
