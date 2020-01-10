import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:wanikani4mobile/application.dart';
import 'package:wanikani4mobile/utilities.dart';

// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function

Future<void> main() async {
  // Make sure that we are fully initialised (this is needed if we want to get
  // ready to receive notifications).

  WidgetsFlutterBinding.ensureInitialized();

  // Get ready to receive notifications.

  await FlutterLocalNotificationsPlugin().initialize(InitializationSettings(
      AndroidInitializationSettings(Logo), IOSInitializationSettings()));

  // Start our application.

  runApp(Application());
}
