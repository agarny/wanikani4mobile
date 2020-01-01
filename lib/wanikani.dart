// Note: most of the code found in wanikani_*.dart was generated using
//       https://app.quicktype.io/.

import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/wanikani_user.dart';

class WaniKani extends BaseCacheManager {
  static final WaniKani _instance = WaniKani._();
  static const key = "WaniKaniCache";

  WaniKaniUser user;
  bool hasError;

  factory WaniKani() {
    return _instance;
  }

  WaniKani._() : super(key, fileFetcher: _fileFetcher);

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();

    return path.join(directory.path, key);
  }

  static Future<FileFetcherResponse> _fileFetcher(String url,
      {Map<String, String> headers}) async {
    print('Retrieving data for \'$url\'...');

    return HttpFileFetcherResponse(await http.get(
      'https://api.wanikani.com/v2/$url',
      headers: {
        'Wanikani-Revision': '20170710',
        'Authorization': 'Bearer ' + Settings().apiToken,
      },
    ));
  }

  Future<String> _fetchEndpoint(String endpoint, {bool force}) async {
    return (force ?? false
            ? (await downloadFile(endpoint)).file
            : await getSingleFile(endpoint))
        .readAsString();
  }

  Future<WaniKani> fetchAll() async {
    try {
      _instance.user =
          WaniKaniUser.fromJson(jsonDecode(await _fetchEndpoint('user')));

      _instance.hasError = false;
    } catch (e) {
      _instance.hasError = true;
    }

    return _instance;
  }
}
