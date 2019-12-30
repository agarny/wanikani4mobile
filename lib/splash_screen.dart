import 'package:flutter/material.dart';
import 'package:wanikani4mobile/utilities.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: appIcon,
      ),
    );
  }
}
