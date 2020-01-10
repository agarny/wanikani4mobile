import 'dart:convert';
import 'dart:developer';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:wanikani4mobile/application.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/wanikani/assignments.dart';
import 'package:wanikani4mobile/wanikani/level_progressions.dart';
import 'package:wanikani4mobile/wanikani/resets.dart';
import 'package:wanikani4mobile/wanikani/review_statistics.dart';
import 'package:wanikani4mobile/wanikani/reviews.dart';
import 'package:wanikani4mobile/wanikani/srs_stages.dart';
import 'package:wanikani4mobile/wanikani/study_materials.dart';
import 'package:wanikani4mobile/wanikani/subjects.dart';
import 'package:wanikani4mobile/wanikani/summary.dart';
import 'package:wanikani4mobile/wanikani/user.dart';

class WaniKani extends BaseCacheManager {
  static final WaniKani _instance = WaniKani._();
  static const _key = "WaniKaniCache";

  bool _initialized = false;

  WaniKaniAssignments assignments;
  WaniKaniLevelProgressions levelProgressions;
  WaniKaniResets resets;
  WaniKaniReviewStatistics reviewStatistics;
  WaniKaniReviews reviews;
  WaniKaniSrsStages srsStages;
  WaniKaniStudyMaterials studyMaterials;
  WaniKaniSubjects subjects;
  WaniKaniSummary summary;
  WaniKaniUser user;
  bool hasError;
  String errorMessage;

  factory WaniKani() {
    return _instance;
  }

  WaniKani._() : super(_key, fileFetcher: _fileFetcher);

  void reset() {
    _initialized = false;

    assignments = WaniKaniAssignments();
    levelProgressions = WaniKaniLevelProgressions();
    resets = WaniKaniResets();
    reviewStatistics = WaniKaniReviewStatistics();
    reviews = WaniKaniReviews();
    srsStages = WaniKaniSrsStages();
    studyMaterials = WaniKaniStudyMaterials();
    subjects = WaniKaniSubjects();
    summary = WaniKaniSummary();
    user = WaniKaniUser();
    hasError = false;
    errorMessage = '';
  }

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();

    return path.join(directory.path, _key);
  }

  bool get initialized => _initialized;

  static Future<FileFetcherResponse> _fileFetcher(String url,
      {Map<String, String> headers}) async {
    log('Retrieving data for \'$url\'.');

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

  void _handleError(Exception e) {
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

  Future<WaniKani> _fetchAll() async {
    try {
      _instance.assignments = WaniKaniAssignments.fromJson(
          jsonDecode(await _fetchEndpoint('assignments')));
      _instance.levelProgressions = WaniKaniLevelProgressions.fromJson(
          jsonDecode(await _fetchEndpoint('level_progressions')));
      _instance.resets =
          WaniKaniResets.fromJson(jsonDecode(await _fetchEndpoint('resets')));
      _instance.reviewStatistics = WaniKaniReviewStatistics.fromJson(
          jsonDecode(await _fetchEndpoint('review_statistics')));
      _instance.reviews =
          WaniKaniReviews.fromJson(jsonDecode(await _fetchEndpoint('reviews')));
      _instance.srsStages = WaniKaniSrsStages.fromJson(
          jsonDecode(await _fetchEndpoint('srs_stages')));
      _instance.studyMaterials = WaniKaniStudyMaterials.fromJson(
          jsonDecode(await _fetchEndpoint('study_materials')));
      _instance.subjects = WaniKaniSubjects.fromJson(
          jsonDecode(await _fetchEndpoint('subjects')));
      _instance.summary =
          WaniKaniSummary.fromJson(jsonDecode(await _fetchEndpoint('summary')));
      _instance.user =
          WaniKaniUser.fromJson(jsonDecode(await _fetchEndpoint('user')));

      _instance.hasError = false;
    } catch (e) {
      _handleError(e);
    }

    return _instance;
  }

  Future<WaniKani> _fetchSummary() async {
    try {
      _instance.summary =
          WaniKaniSummary.fromJson(jsonDecode(await _fetchEndpoint(
        'summary',
        force: true,
      )));

      _instance.hasError = false;
    } catch (e) {
      _handleError(e);
    }

    return _instance;
  }

  Future<WaniKani> fetch() async {
    if (_initialized && !hasError) {
      log('Retrieving only the summary data.');

      await _fetchSummary();
    } else {
      log('Retrieving all the data.');

      await _fetchAll();

      _initialized = !hasError;
    }

    log('The data has been retrieved.');

    if (hasError) {
      Application.reset();
    } else {
      Application.updateBadge(summary.data.reviews[0].subjectIds.length);
    }

    return _instance;
  }
}
