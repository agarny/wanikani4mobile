// Note: most of the code found in wanikani_*.dart was generated using
//       https://app.quicktype.io/.

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/wanikani_user.dart';

void printJson(dynamic json) {
  print(JsonEncoder.withIndent('  ').convert(json));
}

Future<dynamic> _waniKaniJson(String endpoint) async {
  var response = await http.get(
    'https://api.wanikani.com/v2/$endpoint',
    headers: {
      'Wanikani-Revision': '20170710',
      'Authorization': 'Bearer ' + Settings().apiToken,
    },
  );

  return jsonDecode(response.body);
}

class WaniKani {
  static final WaniKani _instance = WaniKani._internal();

  WaniKaniUser user;

  factory WaniKani() {
    return _instance;
  }

  WaniKani._internal();

  Future<WaniKani> fetch() async {
    _instance.user = WaniKaniUser.fromJson(await _waniKaniJson('user'));

    return _instance;
  }
}
