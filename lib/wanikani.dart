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
  static const _key = "WaniKaniCache";

  WaniKaniUser user;
  bool hasError;
  String errorMessage;

  factory WaniKani() {
    return _instance;
  }

  WaniKani._() : super(_key, fileFetcher: _fileFetcher);

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();

    return path.join(directory.path, _key);
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
        .readAsString()
        .catchError((e) => throw e);
  }

  Future<WaniKani> fetchAll() async {
    try {
      _instance.user =
          WaniKaniUser.fromJson(jsonDecode(await _fetchEndpoint('user')));

      _instance.hasError = false;
    } catch (e) {
      _instance.hasError = true;
      _instance.errorMessage = e.toString();

      if (_instance.errorMessage ==
          'HttpException: No valid statuscode. Statuscode was 401') {
        _instance.errorMessage = 'The API token is invalid.';
      } else if (_instance.errorMessage ==
          'HttpException: No valid statuscode. Statuscode was 429') {
        _instance.errorMessage =
            'Too many requests have been made to the WaniKani API. Please try again again later.';
      }
    }

    return _instance;
  }
}
