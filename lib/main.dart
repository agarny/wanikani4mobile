import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wanikani4mobile/application.dart';
import 'package:wanikani4mobile/utilities.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => NavigationService());

  runApp(Application());
}
