import 'package:flutter/material.dart';

import 'constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

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
